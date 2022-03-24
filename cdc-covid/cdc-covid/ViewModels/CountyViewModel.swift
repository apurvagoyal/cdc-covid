//
//  CountyViewModel.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
import SwiftUI
class CountyViewModel: LoadableObject {
    //TODO: make async call
    func load() async {
        //TODO: Sort the model alphabetically
        state = .loading
        var queryItems: [String:String] = [:]
        queryItems["state_name"] = "VA"
        queryItems["date"] = "2020-03-22:T00:00:00.00"
        let request = Request<[Transmission]>.get("resource/nra9-vzzn.json", query: queryItems)
        do {
            let transmissions = try await apiClient.send(request)
            state = .loaded(transmissions)
        } catch (let error) {
            self.error = error
            state = .failed(error)
        }
    }
    @Published private(set) var state: LoadingState<[Transmission]> = LoadingState.loading
    @Published var error: Error?
    private let apiClient = APIClient()
}
