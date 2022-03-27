//
//  NetworkState.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
enum LoadingState<Value>: Equatable {
    static func == (lhs: LoadingState<Value>, rhs: LoadingState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading,.loading):
            return true
        case (.failed,.failed):
            return true
        case (.loaded,.loaded):
            return true
        default:
            return false
            
        }
    }
    
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
    
    
}
