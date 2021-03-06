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
        .task {
            //check if the state is not already loading
            if viewModel.state == LoadingState.loading {return}
            await viewModel.load()
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
             county: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             level: .substantial))
            CountyRowView(transmission: Transmission(
             fips: "123",
             county: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             level: .substantial))
            CountyRowView(transmission: Transmission(
             fips: "123",
             county: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             level: .substantial))
            CountyRowView(transmission: Transmission(
             fips: "123",
             county: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             level: .substantial))
            CountyRowView(transmission: Transmission(
             fips: "123",
             county: "South Dakota",
             state: "South Dakota",
             casesPer100K: "1000",
             level: .substantial))
        }
       .redacted(reason: .placeholder)
    }
}
