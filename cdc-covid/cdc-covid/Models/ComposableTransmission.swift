//
//  ComposableTransmission.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 1/19/23.
//

import Foundation
import ComposableArchitecture

struct ComposableTransmission: ReducerProtocol {
    //always use enums in the model to display state and remove ambiguity
    //this also sits well with state machine
    struct State: Identifiable, Decodable, Hashable, Equatable {
        enum transmission_level: String, Codable {
            case high
            case substantial
            case moderate
            case low
            case unknown
        }
        let id = UUID()
        var fips: String
        var county: String
        var state: String
        var casesPer100K: String
        var level: transmission_level?
    }
    
    enum Action : Equatable {
        case loaded
        case countySelected(String)
        case transmissionResponseFailed(Error)
        case transmissionResponseReceived([State])
    }
 
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .loaded :
            return .task {
                await 
            }
        case .countySelected(let county) :
            //how to navigate
            return .none
        }
    }
    

}

extension ComposableTransmission {
    static let data =
        [Transmission(fips: "46103", county: "Brown County", state: "Virginia", casesPer100K: "65.264", level: .high),
         Transmission(fips: "46103", county: "Riley County", state: "Kansas", casesPer100K: "65.264", level: .substantial),
         Transmission(fips: "46103", county: "Knox County", state: "Ohio", casesPer100K: "22.464", level: .low),
         Transmission(fips: "46103", county: "Brown County", state: "California", casesPer100K: "65.264", level: .moderate)]
    
}

extension ComposableTransmission {
    enum CodingKeys: String, CodingKey {
        case fips = "fips_code"
        case county = "county_name"
        case state = "state_name"
        case casesPer100K = "cases_per_100k_7_day_count"
        //case positiveTestResults = "percent_test_results_reported"
        case level = "community_transmission_level"
    }
}
