//
//  LoadableObject.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> {get}
}
