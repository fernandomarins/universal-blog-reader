//
//  GCDBlackBox.swift
//  Universal Blog
//
//  Created by Fernando Augusto de Marins on 30/06/16.
//  Copyright © 2016 Fernando, Inc. All rights reserved.
//

func performUIUpdatesOnMain(updates: () -> Void) {
    dispatch_async(dispatch_get_main_queue()) {
        updates()
    }
}