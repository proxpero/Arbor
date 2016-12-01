//
//  main.swift
//  PerseusTool
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import Foundation

let urls = [
    "https://raw.githubusercontent.com/proxpero/treebank_data/master/v2.1/Latin/texts/phi0448.phi001.perseus-lat1.tb.xml",
    "https://raw.githubusercontent.com/proxpero/treebank_data/master/v2.1/Latin/texts/phi0474.phi013.perseus-lat1.tb.xml",
    "https://raw.githubusercontent.com/proxpero/treebank_data/master/v2.1/Latin/texts/phi0620.phi001.perseus-lat1.tb.xml",
    
]

for url in urls.flatMap({ URL(string: $0) }) {
    if let text = Text(with: url) {
        print(text.description)
    }
}
