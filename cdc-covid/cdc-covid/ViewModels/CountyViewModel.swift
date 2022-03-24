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
    func load(loading: @escaping Loading<[Transmission]>) async {
        //TODO: Sort the model alphabetically
        state = .loading
        do {
            let transmissions = try await loading()
            state = .loaded(transmissions)
        } catch (let error) {
            self.error = error
            state = .failed(error)
        }
    }
    @Published private(set) var state: LoadingState<[Transmission]> = LoadingState.loaded(Transmission.data)
    @Published var error: Error?
    //let loading: Loading<[Transmission]>
    typealias Loading<T> = () async throws -> T
//
//    init(loading: @escaping Loading<[Transmission]>){
//        self.loading = loading
//    }
    //
}
