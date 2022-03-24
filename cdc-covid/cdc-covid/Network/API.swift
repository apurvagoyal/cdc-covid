//
//  API.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/23/22.
//

import Foundation
struct API {
    static let host = "data.cdc.gov"
    static let scheme = "https"
    static let app_token = "wvgfZtdmCamegTkSBeIJLo17Z"
    
    enum APIError: Error {
        case invalidURL
        case invalidRequest
    }
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func transmissions(in state: String, _ date: String) async throws -> [Transmission] {
        //TODO: Add the token in the request
        guard let url = Endpoint.transmissions(for: state, date).url() else{
            throw APIError.invalidURL
        }
        let (data, response) = try await urlSession.data(from: url)
        guard(response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.invalidRequest
        }
        let decoder = JSONDecoder()
        return try decoder.decode([Transmission].self, from: data)
    }
    
}
