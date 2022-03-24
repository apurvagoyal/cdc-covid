//
//  EndPoint.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/23/22.
//

import Foundation
struct Endpoint {
    var path: String
    var queryItems = [URLQueryItem]()
}

extension Endpoint {
    //https://data.cdc.gov/resource/nra9-vzzn.json
    func url() -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        guard let url = components.url else {
           return nil
        }
        return url
    }
    
//    func makeRequest(with data: Kind.RequestData) ->URLRequest? {
//        var components = URLComponents()
//              components.scheme = API.scheme
//              components.host = API.host
//              components.path = "/" + path
//              components.queryItems = queryItems.isEmpty ? nil : queryItems
//
//              // If either the path or the query items passed contained
//              // invalid characters, we'll get a nil URL back:
//              guard let url = components.url else {
//                  return nil
//              }
//
//              var request = URLRequest(url: url)
//              request.httpMethod = method
//              Kind.prepare(&request, with: data)
//              return request
//    }
}

extension Endpoint {
    static var transmissions: Self {
        Endpoint(path: "resource/nra9-vzzn.json")
    }

    
    static func transmissions(for state: String, _ date: String) -> Self {
        Endpoint(
            path: "resource/nra9-vzzn.json",
            queryItems: [URLQueryItem(
                name: "state_name",
                value: state
            ),
                         URLQueryItem(
                            name: "date",
                            value: date
                         )]
        )
    }
}

//protocol EndpointKind {
//    associatedtype RequestData
//    static func prepare(_ request: inout URLRequest,
//                        with data: RequestData)
//}
//
//enum EndpointKinds {
//    enum Public: EndpointKind {
//        static func prepare(_ request: inout URLRequest,
//                            with _: Void) {
//            request.cachePolicy = .reloadIgnoringLocalCacheData
//        }
//    }
//
//    enum Private: EndpointKind {
//        static func prepare(_ request: inout URLRequest,
//                            with token: String) {
//            request.addValue(API.app_token,
//                forHTTPHeaderField: "X-App-Token"
//            )
//        }
//    }
//}
