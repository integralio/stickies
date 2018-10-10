//
//  StickiesAPI.swift
//  Stickies
//
//  Created by Stefan on 10/10/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import Foundation



class StickiesAPI {

    private let service: HTTPRequestService

    init(service: HTTPRequestService) {
        self.service = service
    }

    func fetchSticky(withId id: Int, completion: (Sticky?, Error?) -> Void) {
        let url = apiURL(given: .stickyEndpoint, forId: id)
        service.fireRequest(to: url, withMethod: "GET", withData: nil) { (object, error) in
            completion(object as? Sticky, error)
        }
    }

    func saveSticky(_ sticky: Sticky, completion: (Sticky?, Error?) -> Void) {
        let url = apiURL(given: .stickyEndpoint)
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(sticky)
        service.fireRequest(to: url, withMethod: "POST", withData: data) { (object, error) in
            completion(object as? Sticky, error)
        }
    }

}

private extension StickiesAPI {

    enum StickiesEndpoint: String {

        case stickyEndpoint = "/stickies"

    }

    func apiURL(given endpoint: StickiesEndpoint, forId id: Int? = nil) -> URL {
        guard let id = id else {
            return baseURL.appendingPathComponent(endpoint.rawValue)
        }

        return baseURL.appendingPathComponent(endpoint.rawValue).appendingPathComponent("\(id)")
    }

    var baseURL: URL {
        let bundle = Bundle(for: type(of: self))
        let urlString = bundle.infoDictionary?["StickiesAPIBaseURL"] as? String ?? ""
        return URL(string: urlString)!
    }

}
