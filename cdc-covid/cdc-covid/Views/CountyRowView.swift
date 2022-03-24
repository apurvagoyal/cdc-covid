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
            Text(transmission.county)
            Spacer()
            Image(systemName: "star")
                .modifier(EnumColor(value: transmission.level))
        }
    }
}

struct CountyView_Previews: PreviewProvider {
    static var previews: some View {
        CountyRowView(transmission: .data[0])
    }
}
