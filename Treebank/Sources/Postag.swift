//
//  Postag.swift
//  Treebank
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Foundation

public struct Postag {

    public private(set) var partOfSpeech: PartOfSpeech?
    public private(set) var person: Person?
    public private(set) var number: Number?
    public private(set) var tense: Tense?
    public private(set) var mood: Mood?
    public private(set) var voice: Voice?
    public private(set) var gender: Gender?
    public private(set) var `case`: Case?
    public private(set) var degree: Degree?

    public init?(tag: String) {
        guard tag.characters.count == 9 else { return nil }
        for (index, code) in tag.characters.enumerated() {
            switch index {
            case 0: self.partOfSpeech = PartOfSpeech(code: code)
            case 1: self.person = Person(code: code)
            case 2: self.number = Number(code: code)
            case 3: self.tense = Tense(code: code)
            case 4: self.mood = Mood(code: code)
            case 5: self.voice = Voice(code: code)
            case 6: self.gender = Gender(code: code)
            case 7: self.case = Case(code: code)
            case 8: self.degree = Degree(code: code)
            default: break
            }
        }
    }

}

protocol PostagElement {
    var code: Character { get }
    init?(code: Character)
}

public enum PartOfSpeech: PostagElement {

    /// Noun
    case noun

    /// Verb
    case verb

    /// Adjective
    case adjective

    /// Adverb
    case adverb

    /// Conjunction
    case conjunction

    /// Adposition
    case adposition

    /// Pronoun
    case pronoun

    /// Numeral
    case numeral

    /// Interjection
    case interjection
    
    /// Exclamation
    case exclamation
    
    /// Punctuation
    case punctuation

    var code: Character {

        switch self {
        case .noun: return "n"
        case .verb: return "v"
        case .adjective: return "a"
        case .adverb: return "d"
        case .conjunction: return "c"
        case .adposition: return "r"
        case .pronoun: return "p"
        case .numeral: return "m"
        case .interjection: return "i"
        case .exclamation: return "e"
        case .punctuation: return "u"

        }

    }

    init?(code: Character) {

        switch code {
        case "n": self = .noun
        case "v": self = .verb
        case "a": self = .adjective
        case "d": self = .adverb
        case "c": self = .conjunction
        case "r": self = .adposition
        case "p": self = .pronoun
        case "m": self = .numeral
        case "i": self = .interjection
        case "e": self = .exclamation
        case "u": self = .punctuation
        default: return nil
        }

    }

}

extension PartOfSpeech: CustomStringConvertible {

    public var description: String {
        switch self {
        case .noun: return "noun"
        case .verb: return "verb"
        case .adjective: return "adjective"
        case .adverb: return "adverb"
        case .conjunction: return "conjunction"
        case .adposition: return "adposition"
        case .pronoun: return "pronoun"
        case .numeral: return "numeral"
        case .interjection: return "interjection"
        case .exclamation: return "exclamation"
        case .punctuation: return "punctuation"
        }
    }
    
}


public enum Person: PostagElement {

    /// First Person
    case first

    /// Second Person
    case second

    /// Third Person
    case third

    var code: Character {

        switch self {
        case .first: return "1"
        case .second: return "2"
        case .third: return "3"
        }

    }

    init?(code: Character) {

        switch code {
        case "1": self = .first
        case "2": self = .second
        case "3": self = .third
        default: return nil
        }

    }

}

extension Person: CustomStringConvertible {

    public var description: String {
        switch self {
        case .first: return "first person"
        case .second: return "second person"
        case .third: return "third person"
        }
    }
    
}


public enum Number: PostagElement {

    /// Singular
    case singular

    /// Plural
    case plural

    var code: Character {

        switch self {
        case .singular: return "s"
        case .plural: return "p"
        }

    }

    init?(code: Character) {

        switch code {
        case "s": self = .singular
        case "p": self = .plural
        default: return nil
        }

    }

}

extension Number: CustomStringConvertible {

    public var description: String {
        switch self {
        case .singular: return "singular"
        case .plural: return "plural"
        }
    }
    
}


public enum Tense: PostagElement {

    /// Present
    case present

    /// Imperfect
    case imperfect

    /// Perfect
    case perfect

    /// Pluperfect
    case pluperfect

    /// Futureperfect
    case futurePerfect
    
    /// Future
    case future

    var code: Character {

        switch self {
        case .present: return "p"
        case .imperfect: return "i"
        case .perfect: return "r"
        case .pluperfect: return "l"
        case .futurePerfect: return "t"
        case .future: return "f"
        }
    }

    init?(code: Character) {

        switch code {
        case "p": self = .present
        case "i": self = .imperfect
        case "r": self = .perfect
        case "l": self = .pluperfect
        case "t": self = .futurePerfect
        case "f": self = .future
        default: return nil
        }

    }

}

extension Tense: CustomStringConvertible {

    public var description: String {
        switch self {
        case .present: return "present"
        case .imperfect: return "imperfect"
        case .perfect: return "perfect"
        case .pluperfect: return "pluperfect"
        case .futurePerfect: return "future perfect"
        case .future: return "future"
        }
    }
    
}


public enum Mood: PostagElement {

    /// Indicative
    case indicative

    /// Subjunctive
    case subjunctive

    /// Infinitive
    case infinitive

    /// Imperative
    case imperative

    /// Participle
    case participle
    
    /// Gerund
    case gerund
    
    /// Gerundive
    case gerundive

    var code: Character {

        switch self {
        case .indicative: return "i"
        case .subjunctive: return "s"
        case .infinitive: return "n"
        case .imperative: return "m"
        case .participle: return "p"
        case .gerund: return "d"
        case .gerundive: return "g"
        }

    }

    init?(code: Character) {

        switch code {
        case "i": self = .indicative
        case "s": self = .subjunctive
        case "n": self = .infinitive
        case "m": self = .imperative
        case "p": self = .participle
        case "d": self = .gerund
        case "g": self = .gerundive
        default: return nil
        }

    }

}

extension Mood: CustomStringConvertible {

    public var description: String {
        switch self {
        case .indicative: return "indicative"
        case .subjunctive: return "subjunctive"
        case .infinitive: return "infinitive"
        case .imperative: return "imperative"
        case .participle: return "participle"
        case .gerund: return "gerund"
        case .gerundive: return "gerundive"
        }
    }
    
}


public enum Voice: PostagElement {

    /// Active
    case active

    /// Passive
    case passive

    /// Deponent
    case deponent

    var code: Character {

        switch self {
        case .active: return "a"
        case .passive: return "p"
        case .deponent: return "d"
        }

    }

    init?(code: Character) {

        switch code {
        case "a": self = .active
        case "p": self = .passive
        case "d": self = .deponent
        default: return nil
        }
        
    }

}

extension Voice: CustomStringConvertible {

    public var description: String {
        switch self {
        case .active: return "active"
        case .passive: return "passive"
        case .deponent: return "deponent"
        }
    }
    
}


public enum Gender: PostagElement {

    /// Masculine
    case masculine

    /// Feminine
    case feminine

    /// Neuter
    case neuter

    var code: Character {

        switch self {
        case .masculine: return "m"
        case .feminine: return "f"
        case .neuter: return "n"
        }

    }

    init?(code: Character) {

        switch code {
        case "m": self = .masculine
        case "f": self = .feminine
        case "n": self = .neuter
        default: return nil
        }
        
    }

}

extension Gender: CustomStringConvertible {

    public var description: String {
        switch self {
        case .masculine: return "masculine"
        case .feminine: return "feminine"
        case .neuter: return "neuter"
        }
    }
    
}


public enum Case: PostagElement {

    /// Nominative
    case nominative

    /// Genitive
    case genitive

    /// Dative
    case dative

    /// Accusative
    case accusative

    /// Vocative
    case vocative
    
    /// Ablative
    case ablative
    
    /// Locative
    case locative

    var code: Character {

        switch self {
        case .nominative: return "n"
        case .genitive: return "g"
        case .dative: return "d"
        case .accusative: return "a"
        case .vocative: return "v"
        case .ablative: return "b"
        case .locative: return "l"
        }

    }

    init?(code: Character) {

        switch code {
        case "n": self = .nominative
        case "g": self = .genitive
        case "d": self = .dative
        case "a": self = .accusative
        case "v": self = .vocative
        case "b": self = .ablative
        case "l": self = .locative
        default: return nil
        }
        
    }

}

extension Case: CustomStringConvertible {

    public var description: String {
        switch self {
        case .nominative: return "nominative"
        case .genitive: return "genitive"
        case .dative: return "dative"
        case .accusative: return "accusative"
        case .vocative: return "vocative"
        case .ablative: return "ablative"
        case .locative: return "locative"
        }
    }
    
}


public enum Degree: PostagElement {

    /// Apositive
    case apositive

    /// Comparative
    case comparative

    /// Superlative
    case superlative

    var code: Character {

        switch self {
        case .apositive: return "p"
        case .comparative: return "c"
        case .superlative: return "s"
        }

    }

    init?(code: Character) {

        switch code {
        case "p": self = .apositive
        case "c": self = .comparative
        case "s": self = .superlative
        default: return nil
        }
        
    }

}

extension Degree: CustomStringConvertible {

    public var description: String {
        switch self {
        case .apositive: return "apositive"
        case .comparative: return "comparative"
        case .superlative: return "superlative"
        }
    }

}

