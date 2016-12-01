//
//  Text.swift
//  Treebank
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Foundation

public struct Text {

    public let title: String
    public let author: String
    public let sentences: [Sentence]

    init(title: String, author: String, sentences: [Sentence]) {
        self.title = title
        self.author = author
        self.sentences = sentences
    }

    public init?(with url: URL) {
        let parser = XMLParser(contentsOf: url)
        let delegate = TextParserDelegate()
        parser?.delegate = delegate
        parser?.parse()
        guard let text = delegate.text else { return nil }
        self = text
    }

    public init?(with data: Data) {
        let parser = XMLParser(data: data)
        let delegate = TextParserDelegate()
        parser.delegate = delegate
        parser.parse()
        guard let text = delegate.text else { return nil }
        self = text
    }
}

extension Text: CustomStringConvertible {

    public var description: String {

        var result: String = ""

        result += title + "\n" + author

        var current: String?
        for sentence in sentences {
            if sentence.subdoc != current {
                result += "\n\n"
                current = sentence.subdoc
            }
            result += sentence.description
        }
        
        return result
    }

}

fileprivate class TextParserDelegate: NSObject, XMLParserDelegate {

    enum Element {
        case body
        case title
        case author
        case sentence
        case word

        init?(name: String) {
            switch name {
            case "body": self = .body
            case "title": self = .title
            case "author": self = .author
            case "sentence": self = .sentence
            case "word": self = .word
            default: return nil
            }
        }
    }

    var currentElement: Element?

    var title: String?
    var author: String?
    var sentences: [Sentence] = []

    var sentenceAttributes: Dictionary<String, String>?
    var words: [Word] = []

    var text: Text?

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        guard let element = Element(name: elementName) else {
            currentElement = nil
            return
        }
        currentElement = element

        switch element {
        case .sentence: sentenceAttributes = attributeDict
        case .word:
            if let word = Word(dictionary: attributeDict) {
                words.append(word)
            }
        default: break
        }

    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

        guard let element = Element(name: elementName) else { return }

        switch element {
        case .body:
            guard let title_ = title, let author_ = author else { fatalError() }
            text = Text(title: title_, author: author_, sentences: sentences)

            title = nil
            author = nil
            sentences = []

        case .sentence:
            guard
                let sentenceAttributes_ = sentenceAttributes,
                let id_ = sentenceAttributes_["id"],
                let id = Int(id_),
                let subdoc = sentenceAttributes_["subdoc"],
                let docId = sentenceAttributes_["document_id"]
                else { fatalError() }
            let sentence = Sentence(id: id, subdoc: subdoc, docId: docId, words: words)
            sentences.append(sentence)

            sentenceAttributes = nil
            words = []

        default: break
        }

        currentElement = nil
        
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {

        guard let currentElement = currentElement else { return }
        switch currentElement {
        case .title: title = string
        case .author: author = string
        default: break
        }
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
}

extension Word {

    init?(dictionary: Dictionary<String, String>) {

        guard
            let id_ = dictionary["id"],
            let id = Int(id_),
            let form = dictionary["form"]
            else { print("could not make a word from \(dictionary)"); return nil }

        self.id = id
        self.form = form
        self.relation = dictionary["relation"].flatMap { Relation(code: $0) }
        self.head = dictionary["head"].flatMap { Int($0) }
        self.lemma = dictionary["lemma"]
        self.postag = dictionary["postag"].flatMap { Postag(tag: $0) }
        self.cite = dictionary["cite"]
    }

}
