//
//  CountyViewModel.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
import SwiftUI
class CountyViewModel: ObservableObject {
    @Published private(set) var transmissions: [Transmission]  = Transmission.data
}
