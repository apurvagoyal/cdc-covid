//
//  API.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/23/22.
//

import Foundation
public actor APIClient {
    static let scheme = "https"
    static let app_token = "wvgfZtdmCamegTkSBeIJLo17Z"
    
    enum APIError: Error {
        case invalidURL
        case invalidRequest
    }
    
    private let urlSession: URLSession
    private let host: String
    private let serializer = Serializer()
    
    init(
        configuration: URLSessionConfiguration = .default,
        host: String = "data.cdc.gov") {
        self.urlSession = URLSession(configuration: configuration)
            self.host = host
    }
    
//    func transmissions(in state: String, _ date: String) async throws -> [Transmission] {
//        //TODO: Add the token in the request
//        guard let url = Endpoint.transmissions(for: state, date).url() else{
//            throw APIError.invalidURL
//        }
//        let (data, response) = try await urlSession.data(from: url)
//        guard(response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw APIError.invalidRequest
//        }
//        let decoder = JSONDecoder()
//        return try decoder.decode([Transmission].self, from: data)
//    }
    
}

extension APIClient {
    public func send<T: Decodable>(_ request: Request<T>) async throws -> T {
        try await send(request, serializer.decode)
    }
    
    public func send(_ request: Request<Void>) async throws -> Void {
        try await send(request, { _ in () })
    }
    private func send<T>(_ request: Request<T>,
                         _ decode: @escaping (Data) async throws -> T) async throws -> T {
        let request = try await makeRequest(for: request)
        let (data, response) = try await send(request)
        try validate(response: response, data: data)
        return try await decode(data)
    }
    private func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
           try await urlSession.data(for: request, delegate: nil)
       }
    
    func makeRequest<T>(for request: Request<T>) async throws -> URLRequest {
        let url = try makeURL(path: request.path, query: request.query)
        return try await makeRequest(url: url, method: request.method)
    }
    
    func makeURL(path: String, query: [String: String]?) throws -> URL {
        guard let url = URL(string: path),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw URLError(.badURL)
        }
        if path.starts(with: "/") {
            components.scheme = APIClient.scheme
            components.host = host
        }
        if let query = query {
            components.queryItems = query.map(URLQueryItem.init)
        }
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return url
    }
    
    func makeRequest(url: URL, method: String) async throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else { return }
        if !(200..<300).contains(httpResponse.statusCode) {
            throw URLError(.badServerResponse)
        }
    }
}

private actor Serializer {
    func encode<T: Encodable>( _ entity: T) async throws -> Data {
        try JSONEncoder().encode(entity)
    }
    
    func decode<T: Decodable>(_ data: Data) async throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
}
