//
//  HTTPRequestService.swift
//  Stickies
//
//  Created by Stefan on 10/10/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import Foundation



protocol HTTPRequestService {

    func fireRequest(to address: URL,
                     withMethod HTTPMethod: String,
                     withData data: Data?,
                     completion: (Any?, Error?) -> Void)

}
