//
//  AsyncContentView.swift
//  cdc-covid
//
//  Created by Goyal, Apurva on 3/22/22.
//

import Foundation
import SwiftUI
struct AsyncContentView<Source: LoadableObject, LoadingView: View, Content: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content
    var loadingView: LoadingView
    init(source: Source, loadingView: LoadingView, @ViewBuilder content: @escaping (Source.Output) -> Content){
        self.source = source
        self.loadingView = loadingView
        self.content = content
    }
    var body: some View {
        switch source.state {
        case .idle:
            EmptyView()
        case .loading:
            loadingView
        case .failed(let error):
            //TODO: Error View
            Text("Error")
        case .loaded(let output):
            content(output)
        }
    }
}

