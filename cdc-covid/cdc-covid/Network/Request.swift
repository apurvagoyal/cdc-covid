//
//  Request.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/24/22.
//

import Foundation

public struct Request<Response> {
    var method: String
    var path: String
    var query: [String:String]?
}

extension Request {
    public static func get(_ path: String, query: [String:String]? = nil) -> Request {
        Request(method: "GET", path: path, query: query)
    }
//    public static func post<U: Encodable>(_ path: String, body: U) -> Request {
//           Request(method: "POST", path: path, body: AnyEncodable(body))
//       }
//
//       public static func patch<U: Encodable>(_ path: String, body: U) -> Request {
//           Request(method: "PATCH", path: path, body: AnyEncodable(body))
//       }
}
