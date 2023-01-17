//
//  Vaccination.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 1/12/23.
//

import Foundation
struct Vaccination: Identifiable, Decodable, Hashable {
    let id = UUID()
    var fips: String
    var county: String
    var state: String
    var completenessPercent: String
    var atLeastOneDoseTotalPercent: String
    var atLeastOneDose65PlusPercent: String
    var boosterPercent: String
    var booster65PlusPercent: String
}

extension Vaccination {
    static let data =
        Transmission(fips: "46103", county: "Brown County", state: "Virginia", casesPer100K: "65.264", level: .high)
}

extension Vaccination {
    enum CodingKeys: String, CodingKey {
        case fips = "fips"
        case county = "recip_county"
        case state = "recip_state"
        case completenessPercent = "completeness_pct"
        case atLeastOneDoseTotalPercent = "administered_dose1_pop_pct"
        case atLeastOneDose65PlusPercent = "administered_dose1_recip_65pluspop_pct"
        case boosterPercent = "booster_doses_vax_pct"
        case booster65PlusPercent = "booster_doses_65plus_vax_pct"
    }
}
