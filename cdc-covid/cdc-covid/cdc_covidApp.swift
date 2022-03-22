//
//  cdc_covidApp.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/18/22.
//

import SwiftUI

@main
struct cdc_covidApp: App {
    var body: some Scene {
        WindowGroup {
            CountiesView(viewModel: CountyViewModel())
        }
    }
}
