//
//  EnumColor.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/23/22.
//

import Foundation
import SwiftUI
struct EnumColor: ViewModifier {
    var value: Transmission.transmission_level
    func body(content: Content) -> some View {
        switch value {
        case .high:
            content
                .foregroundColor(Color(.red))
        case .substantial:
            content
                .foregroundColor(.orange)
        case .moderate:
            content
                .foregroundColor(.yellow)
        case .low:
            content
                .foregroundColor(.green)
        case .unknown:
            EmptyView()
        }
    }
}
