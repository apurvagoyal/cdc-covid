//
//  Vaccination.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
struct Transmission: Identifiable {
    //always use enums in the model to display state and remove ambiguity
    //this also sits well with state machine
    enum transmission_level {
        case high
        case substantial
        case moderate
        case low
        case unknown
    }
    let id = UUID()
    var fips: String
    var name: String
    var state: String
    var casesPer100K: String
    var positiveTestResults: Double
    var level: transmission_level = .unknown
    
}

extension Transmission {
    static let data =
        [Transmission(fips: "46103", name: "Brown County", state: "VA", casesPer100K: "65.264", positiveTestResults: 14.08, level: .high)]
    
}
