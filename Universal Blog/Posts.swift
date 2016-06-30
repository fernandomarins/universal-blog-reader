//
//  Posts.swift
//  Universal Blog
//
//  Created by Fernando Augusto de Marins on 30/06/16.
//  Copyright © 2016 Fernando, Inc. All rights reserved.
//

// Class created to store posts
class Posts {
    var items = [MWFeedItem]()
    static let sharedInstace = Posts()
}