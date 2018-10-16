//
//  Sticky.swift
//  Stickies
//
//  Created by Stefan on 10/10/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import Foundation



class Sticky: Codable {

    let id: Int?

    let content: String

    init(content: String, id: Int? = nil) {
        self.id = id
        self.content = content
    }
}
