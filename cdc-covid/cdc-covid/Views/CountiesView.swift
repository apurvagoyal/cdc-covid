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
            List(viewModel.transmissions) { transmission in
                CountyRowView(transmission: transmission)
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Constants.counties_title)
        }
    }
}

struct CountiesView_Previews: PreviewProvider {
    static var previews: some View {
        CountiesView(viewModel: CountyViewModel())
    }
}
