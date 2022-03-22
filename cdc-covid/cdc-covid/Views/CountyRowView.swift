//
//  CountyView.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import SwiftUI

struct CountyRowView: View {
    var transmission: Transmission
    var body: some View {
        HStack {
            Text(transmission.state)
            Spacer()
            Text(transmission.casesPer100K)
        }
    }
}

struct CountyView_Previews: PreviewProvider {
    static var previews: some View {
        CountyRowView(transmission: .data[0])
    }
}
