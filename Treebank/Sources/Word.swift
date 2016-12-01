//
//  Word.swift
//  Treebank
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Foundation

public struct Word {

    public let id: Int
    public let form: String
    public let lemma: String?
    public let postag: Postag?
    public let relation: Relation?
    public let cite: String?
    public let head: Int?

}

extension Word: CustomStringConvertible {

    public var description: String {
        return form + " "
    }

}
