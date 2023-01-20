//
//  ComposableVaccination.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 1/20/23.
//

import Foundation
import ComposableArchitecture


struct ComposableVaccination: ReducerProtocol {
    
    struct State: Equatable {
        var fips: String
        var vaccinations: [Vaccination] = []
        var alert: AlertState<Action>?
        var loading: SimpleLoadingState = .idle
    }
    
    enum Action: Equatable {
        case loaded
        case vaccinationResponseReceived(TaskResult<[Vaccination]>)
        case errorAlertDismissed
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .loaded:
            state.loading = .loading
            let apiClient = APIClient()
            //call the API
            return .task { [fips = state.fips] in
                await .vaccinationResponseReceived(
                    TaskResult {
                        try await apiClient.vaccinations(fips:fips)
                    }
                )
            }
        case .vaccinationResponseReceived(.failure):
            state.alert = AlertState(title: {
                TextState("Error")
            },
                                     actions: {
                ButtonState(role: .cancel){
                    TextState("Ok")
                }
            }, message: {
                TextState("Could not get vaccincations")
            })
            return .none
        case let .vaccinationResponseReceived(.success(vaccinations)):
            state.loading = .loaded
            state.vaccinations = vaccinations
            return .none
        case .errorAlertDismissed:
            state.alert = nil
            return .none
        }
    }
}

