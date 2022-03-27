//
//  CountyViewModel.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
import SwiftUI
import os
class CountyViewModel: LoadableObject {
    //TODO: make async call
    func load() async {
        //TODO: Sort the model alphabetically
        await updateState(newState: .loading)
        var queryItems: [String:String] = [:]
        queryItems["state_name"] = "Virginia"
        queryItems["date"] = "2022-03-22T00:00:00.000"
        let request = Request<[Transmission]>.get("resource/nra9-vzzn.json", query: queryItems)
        do {
            let transmissions = try await apiClient.send(request)
            await updateState(newState: .loaded(transmissions))
        } catch (let error) {
            logger.log("\(String(describing: error))")
            await updateState(newState: .failed(error))
            //self.error = error
        }
    }
    
    @MainActor
    func updateState(newState: LoadingState<[Transmission]>) {
        state = newState
    }
    @MainActor @Published private(set) var state: LoadingState<[Transmission]> = LoadingState.idle
    @MainActor @Published var error: Error?
    private let apiClient = APIClient()
    let logger = Logger(subsystem: "com.deloitte.cdc-covid", category: "api")
}
