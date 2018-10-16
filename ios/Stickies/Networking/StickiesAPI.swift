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

    func saveSticky(_ sticky: Sticky, completion: (Sticky?, Error?) -> Void) {
        let url = apiURL(given: .stickyEndpoint)
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(sticky)
        service.fireRequest(to: url, withMethod: "POST", withData: data) { (object, error) in
            completion(object as? Sticky, error)
        }
    }

    func deleteSticky(withId stickyId: Int, completion: (Error?) -> Void) {
        let url = apiURL(given: .stickyEndpoint).appendingPathComponent("/\(stickyId)")
        service.fireRequest(to: url, withMethod: "DELETE", withData: nil) { (_, error) in
            completion(error)
        }
    }

}

private extension StickiesAPI {

    enum StickiesEndpoint: String {

        case stickyEndpoint = "/stickies"

    }

    func apiURL(given endpoint: StickiesEndpoint) -> URL {
        return baseURL.appendingPathComponent(endpoint.rawValue)
    }

    var baseURL: URL {
        let bundle = Bundle(for: type(of: self))
        guard
            let appSettingsDictionary = bundle.infoDictionary?["AppSettings"] as? [String: String],
            let urlString = appSettingsDictionary["StickiesAPIBaseURL"],
            let url = URL(string: urlString) else {
                fatalError("Could not look up API URL from the Stickies Info.plist")
        }

        return url
    }

}
