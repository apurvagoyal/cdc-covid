//
//  TransmissionView.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 1/19/23.
//

import SwiftUI
import ComposableArchitecture

struct TransmissionView: View {
    
    
    let store: StoreOf<ComposableTransmission>
    
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                NavigationStack {
                    List {
                        ForEach(viewStore.state.transmissions) { transmission in
                            NavigationLink(value: transmission){
                                CountyRowView(transmission: transmission)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
                .navigationDestination(for: Transmission.self) { transmission in
                    CountyView(viewModel: CountyViewModel(fips: transmission.fips))
                }
              
            }
            .navigationTitle(Constants.counties_title)
            .font(.system(.body, design: .monospaced))
            //TODO: how to call API when screen appears
            
            
            //            AsyncContentView(source: viewModel, loadingView: Placeholder()){ transmissions in
            //                NavigationStack {
            //                    List(transmissions) { transmission in
            //                        NavigationLink(value: transmission){
            //                            CountyRowView(transmission: transmission)
            //                        }
            //                    }
            //                    .listStyle(.insetGrouped)
            //                    .navigationDestination(for: Transmission.self) { transmission in
            //                        CountyView(viewModel: CountyViewModel(fips: transmission.fips))
            //                    }
            //                }
            //                .navigationTitle(Constants.counties_title)
            //                .font(.system(.body, design: .monospaced))
            //            }
            //        }
            //        .task {
            //            //check if the state is not already loading
            //            if viewModel.state == LoadingState.loading {return}
            //            await viewModel.load()
            //        }
        }
    }
}

struct TransmissionView_Previews: PreviewProvider {
    static var previews: some View {
       TransmissionView(store: Store(
        initialState: TransmissionState(),
        reducer: transmissionReducer(),
       environment: TransmissionEnvironment()))
    }
}


