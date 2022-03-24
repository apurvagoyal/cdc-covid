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
        case (.idle, _), (_, .idle):
            return true
        case (.loading, _), (_, .loading):
            return true
        case (.failed, _), (_, .failed):
            return true
        case (.loaded, _), (_, .loaded):
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
