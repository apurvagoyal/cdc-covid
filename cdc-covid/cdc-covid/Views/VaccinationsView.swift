//
//  VaccinationsView.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 1/20/23.
//

import SwiftUI
import ComposableArchitecture

struct VaccinationsView: View {
    let store: StoreOf<ComposableVaccination>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }){ viewStore in
            Text(viewStore.vaccinations.first!.atLeastOneDose65PlusPercent.description)
            .font(.system(.body, design: .monospaced))
            .alert(
                self.store.scope(state: \.alert),
                dismiss: .errorAlertDismissed)
            .onAppear{
                viewStore.send(.loaded)
            }
        }
        
    }
}


