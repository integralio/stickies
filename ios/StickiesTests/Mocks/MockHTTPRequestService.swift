//
//  MockHTTPRequestService.swift
//  StickiesTests
//
//  Created by Stefan on 10/10/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import Foundation
@testable import Stickies



class MockHTTPRequestService: HTTPRequestService {

    func fireRequest(to address: URL, withMethod HTTPMethod: String, withData data: Data?, completion: (Any?, Error?) -> Void) {
        switch address.absoluteString {
        case "http://localhost:8080/stickies/1" where HTTPMethod == "GET":
            let sticky = Sticky(content: "This is a sticky note.", id: 1)
            completion(sticky, nil)
        case "http://localhost:8080/stickies/1" where HTTPMethod == "DELETE":
            completion(nil, nil)
        case "http://localhost:8080/stickies":
            let sticky = Sticky(content: "My new sticky note.", id: UUID().uuidString.hashValue)
            completion(sticky, nil)
        default:
            break
        }
    }

}
