//
//  CountyViewModel.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 6/16/22.
//

import Foundation
import os
class CountyViewModel: LoadableObject {
    //TODO: make async call
    func load() async {
        //TODO: Sort the model alphabetically
        await updateState(newState: .loading)
        var queryItems: [String:String] = [:]
        queryItems["fips"] = fips
        queryItems["date"] = "2022-03-22T00:00:00.000"
        let request = Request<[Vaccination]>.get("resource/8xkx-amqh.json", query: queryItems)
        do {
            let vaccinations = try await apiClient.send(request)
            vaccinations.isEmpty ? await updateState(newState: .failed(APIClient.APIError.noData)) :  await updateState(newState: .loaded(vaccinations))
            
        } catch (let error) {
            logger.log("\(String(describing: error))")
            await updateState(newState: .failed(error))
            //self.error = error
        }
    }
    
    @MainActor
    func updateState(newState: LoadingState<[Vaccination]>) {
        state = newState
    }
    @MainActor @Published private(set) var state: LoadingState<[Vaccination]> = LoadingState.idle
    @Published private(set) var fips: String
    private let apiClient = APIClient()
    @MainActor @Published var error: Error?
    let logger = Logger(subsystem: "com.deloitte.cdc-covid", category: "api")
    
    init(fips: String) {
        self.fips = fips
    }
}


