//
//  NetworkState.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
