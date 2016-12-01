//
//  Sentence.swift
//  Treebank
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Foundation

public struct Sentence {

    public let id: Int
    public let subdoc: String
    public let docId: String
    public let words: [Word]

}

extension Sentence: CustomStringConvertible {

    public var description: String {

        var result = ""

        for word in words {

            // Trim the space before a punctuation mark.
            if word.description
                .trimmingCharacters(in: .whitespaces)
                .trimmingCharacters(in: .punctuationCharacters)
                .isEmpty
            {
               result = result.trimmingCharacters(in: .whitespaces)
            }

            result += word.description
        }

        result = result.replacingOccurrences(of: "( ", with: " (")
        result = result.replacingOccurrences(of: "..", with: ".")
        result = result.replacingOccurrences(of: " -que", with: "que")
        result = result.replacingOccurrences(of: " -ne", with: "ne")

        return result
    }
}
