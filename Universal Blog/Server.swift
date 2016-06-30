//
//  Server.swift
//  Universal Blog
//
//  Created by Fernando Augusto de Marins on 30/06/16.
//  Copyright © 2016 Fernando, Inc. All rights reserved.
//

import Foundation
import UIKit

class Server: NSObject,
    MWFeedParserDelegate  {

    func request(url: String) {
        let URL = NSURL(string: url)
        let feedParser = MWFeedParser(feedURL: URL)
        feedParser.delegate = self
        feedParser.parse()
    }
    
    func feedParserDidStart(parser: MWFeedParser) {
        SVProgressHUD.show()
        Posts.sharedInstace.items = [MWFeedItem]()
    }
    
    func feedParserDidFinish(parser: MWFeedParser) {
        SVProgressHUD.dismiss()
    }
    
    func feedParser(parser: MWFeedParser, didParseFeedInfo info: MWFeedInfo) {
//        title = info.title
    }
    
    func feedParser(parser: MWFeedParser, didParseFeedItem item: MWFeedItem) {
        Posts.sharedInstace.items.append(item)
    }
    
    static let sharedInstace = Server()
    
}