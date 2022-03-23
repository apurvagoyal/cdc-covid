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
    func load(){
        
    }
    @Published private(set) var state: LoadingState<[Transmission]> = LoadingState.loading
}
