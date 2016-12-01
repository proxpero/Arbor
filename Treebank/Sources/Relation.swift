//
//  Relation.swift
//  Treebank
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Foundation

public enum Relation {

        /// Predicate
        case pred

        /// Subject
        case sbj

        /// Object
        case obj

        /// Attribute
        case atr

        /// Adverbial
        case adv

        /// Preposition
        case auxp

        /// Conjunction
        case auxc

        /// Sentence Adverbial
        case auxy

        /// Emphasizing Particle
        case auxz

        /// Auxiliary Verb
        case auxv

        /// Reflexive Passive
        case auxr

        /// Bracketing Punctuation
        case auxg

        /// Comma
        case auxx

        /// Terminal Punctuation
        case auxk

        /// Coordinator
        case coord

        /// Non-Obligatory Complementation
        case atv

        /// Non-Obligatory Complementation
        case atvv

        /// Predicate Nominal
        case pnom
        
        /// Object Complement
        case ocomp
        
        /// Apposing Element
        case apos
        
        /// Ellipsis
        case exd
        
//        /// Coordinated (Suffix)
//        case co
//        
//        /// Apposing (Suffix)
//        case ap
//        
//        /// Apposing And Coordinated
//        case apco

        var code: String {
            switch self {
            case .pred: return "PRED"
            case .sbj: return "SBJ"
            case .obj: return "OBJ"
            case .atr: return "ATR"
            case .adv: return "ADV"
            case .auxp: return "AuxP"
            case .auxc: return "AuxC"
            case .auxy: return "AuxY"
            case .auxz: return "AuxZ"
            case .auxv: return "AuxV"
            case .auxr: return "AuxR"
            case .auxg: return "AuxG"
            case .auxx: return "AuxX"
            case .auxk: return "AuxK"
            case .coord: return "COORD"
            case .atv: return "ATV"
            case .atvv: return "AtvV"
            case .pnom: return "PNOM"
            case .ocomp: return "OCOMP"
            case .apos: return "APOS"
            case .exd: return "ExD"
//            case .co: return "_CO"
//            case .ap: return "_AP"
//            case .apco: return "AP_CO"
            }
        }

        public init?(code: String) {

            var code_ = code
            code_ = code_.replacingOccurrences(of: "_CO", with: "")
            code_ = code_.replacingOccurrences(of: "_AP", with: "")

            switch code_ {
            case "PRED": self = .pred
            case "SBJ": self = .sbj
            case "OBJ": self = .obj
            case "ATR": self = .atr
            case "ADV": self = .adv
            case "AuxP": self = .auxp
            case "AuxC": self = .auxc
            case "AuxY": self = .auxy
            case "AuxZ": self = .auxz
            case "AuxV": self = .auxv
            case "AuxR": self = .auxr
            case "AuxG": self = .auxg
            case "AuxX": self = .auxx
            case "AuxK": self = .auxk
            case "COORD": self = .coord
            case "ATV": self = .atv
            case "AtvV": self = .atvv
            case "PNOM": self = .pnom
            case "OCOMP": self = .ocomp
            case "APOS": self = .apos
            case "ExD": self = .exd
//            case "_CO": self = .co
//            case "_AP": self = .ap
//            case "AP_CO": self = .apco
            default: return nil
            }
        }
        
        static var punctuation: [Relation] = [.auxg, .auxx, auxk]

}

extension Relation: CustomStringConvertible {

    public var description: String {
        switch self {
        case .pred: return "predicate"
        case .sbj: return "subject"
        case .obj: return "object"
        case .atr: return "attribute"
        case .adv: return "adverbial"
        case .auxp: return "preposition"
        case .auxc: return "conjunction"
        case .auxy: return "sentence adverbial"
        case .auxz: return "emphasizing particle"
        case .auxv: return "auxiliary verb"
        case .auxr: return "reflexive passive"
        case .auxg: return "bracketing punctuation"
        case .auxx: return "comma"
        case .auxk: return "terminal punctuation"
        case .coord: return "coordinator"
        case .atv: return "non-obligatory complementation"
        case .atvv: return "non-obligatory complementation"
        case .pnom: return "predicate nominal"
        case .ocomp: return "object complement"
        case .apos: return "apposing element"
        case .exd: return "ellipsis"
        }
    }

}
