//
//  TipView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/16.
//

import SwiftUI
import ComposableArchitecture

public struct TipView {
    
    private let store: StoreOf<Tip>
    @ObservedObject var viewStore: ViewStoreOf<Tip>
    
    public init(store: StoreOf<Tip>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension TipView: View {
    
    public var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            WebView(url: URL(string: "https://mingyu.run")!)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button(action: {
                viewStore.send(.onTapBackButton)
            }) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .background(.pink)
            }
            .padding([.top, .trailing], 20)
        }    
    }
}
