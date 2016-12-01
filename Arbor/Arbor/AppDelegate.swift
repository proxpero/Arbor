//
//  AppDelegate.swift
//  Arbor
//
//  Created by Todd Olsen on 11/30/16.
//  Copyright © 2016 proxpero. All rights reserved.
//

import UIKit
import Treebank

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let titles = ""
        let urls = [
            "https://raw.githubusercontent.com/proxpero/treebank_data/master/v2.1/Latin/texts/phi0448.phi001.perseus-lat1.tb.xml" // ,
//            "https://raw.githubusercontent.com/proxpero/treebank_data/master/v2.1/Latin/texts/phi0474.phi013.perseus-lat1.tb.xml",
//            "https://raw.githubusercontent.com/proxpero/treebank_data/master/v2.1/Latin/texts/phi0620.phi001.perseus-lat1.tb.xml"
            ]

        for request in urls.flatMap({ URL(string: $0) }).map({ URLRequest(url: $0) }) {
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data, let text = Text(with: data) {
                    print(text.description)
                }
            }
            task.resume()
        }

        return true
    }

}

