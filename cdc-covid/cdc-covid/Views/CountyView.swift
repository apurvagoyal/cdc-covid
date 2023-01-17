//
//  CountyView.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 6/16/22.
//

import Foundation
import SwiftUI
struct CountyView: View {
    @StateObject var viewModel: CountyViewModel
    
    var body: some View {
            AsyncContentView(source: viewModel, loadingView: Placeholder()){ vaccinations in
                Text(vaccinations.first!.atLeastOneDose65PlusPercent.description)
                .font(.system(.body, design: .monospaced))
            }
        .task {
            //check if the state is not already loading
            if viewModel.state == LoadingState.loading {return}
            await viewModel.load()
        }
        
    }
    
    
}
