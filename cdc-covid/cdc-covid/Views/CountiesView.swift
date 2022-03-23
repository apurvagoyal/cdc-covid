//
//  CountiesView.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import SwiftUI

struct CountiesView: View {
    @StateObject var viewModel: CountyViewModel
    var body: some View {
        NavigationView {
            AsyncContentView(source: viewModel, loadingView: Placeholder()){ transmissions in
                List(transmissions) { transmission in
                    CountyRowView(transmission: transmission)
                }
                .listStyle(.insetGrouped)
                .navigationTitle(Constants.counties_title)
                .font(.system(.body, design: .monospaced))
            }
        }
        
    }
}

struct CountiesView_Previews: PreviewProvider {
    static var previews: some View {
        CountiesView(viewModel: CountyViewModel())
    }
}

struct Placeholder: View {
    var body: some View {
        List{
            CountyRowView(transmission: Transmission(
             fips: "123",
             name: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             positiveTestResults: 34.67))
            CountyRowView(transmission: Transmission(
             fips: "123",
             name: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             positiveTestResults: 34.67))
            CountyRowView(transmission: Transmission(
             fips: "123",
             name: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             positiveTestResults: 34.67))
            CountyRowView(transmission: Transmission(
             fips: "123",
             name: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             positiveTestResults: 34.67))
            CountyRowView(transmission: Transmission(
             fips: "123",
             name: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             positiveTestResults: 34.67))
        }
       .redacted(reason: .placeholder)
    }
}
