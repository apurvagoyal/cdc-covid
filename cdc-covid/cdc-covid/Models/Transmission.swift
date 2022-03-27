//
//  Vaccination.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
struct Transmission: Identifiable, Codable {
    //always use enums in the model to display state and remove ambiguity
    //this also sits well with state machine
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
    //var positiveTestResults: Double
    var level: transmission_level
    
    
    
}

extension Transmission {
    static let data =
        [Transmission(fips: "46103", county: "Brown County", state: "Virginia", casesPer100K: "65.264", level: .high),
         Transmission(fips: "46103", county: "Riley County", state: "Kansas", casesPer100K: "65.264", level: .substantial),
         Transmission(fips: "46103", county: "Knox County", state: "Ohio", casesPer100K: "22.464", level: .low),
         Transmission(fips: "46103", county: "Brown County", state: "California", casesPer100K: "65.264", level: .moderate)]
    
}

extension Transmission {
    enum CodingKeys: String, CodingKey {
        case fips = "fips_code"
        case county = "county_name"
        case state = "state_name"
        case casesPer100K = "cases_per_100k_7_day_count"
        //case positiveTestResults = "percent_test_results_reported"
        case level = "community_transmission_level"
    }
}
