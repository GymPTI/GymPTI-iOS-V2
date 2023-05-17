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
        viewStore = ViewStore(store)
    }
}

extension TipView: View {
    
    public var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            //            ScrollView {
            
            //                VStack(alignment: .leading) {
            //
            //                    Text("\(viewStore.title)")
            //                        .setFont(38, .bold)
            //                        .foregroundColor(Colors.white.color)
            //                        .lineLimit(10)
            //                        .frame(maxWidth: .infinity, alignment: .leading)
            //                        .padding(.top, 60)
            //
            //                    Image("test")
            //
            //                    Text("\(viewStore.contents[0])")
            //                        .setFont(18, .medium)
            //                        .foregroundColor(Colors.gray.color)
            //                        .lineLimit(10)
            //
            //                    Text("점진적 과부화란?")
            //                        .setFont(22, .medium)
            //                        .foregroundColor(Colors.white.color)
            //                        .padding(.top, 10)
            //
            //                    Image("test2")
            //
            //                    Text("\(viewStore.contents[1])")
            //                        .setFont(18, .medium)
            //                        .foregroundColor(Colors.gray.color)
            //                        .lineLimit(10)
            //
            //                    Text("푸쉬업에 점진적 과부화 적용하기")
            //                        .setFont(22, .medium)
            //                        .foregroundColor(Colors.white.color)
            //                        .padding(.top, 10)
            //
            //                    Text("\(viewStore.contents[0])")
            //                        .setFont(18, .medium)
            //                        .foregroundColor(Colors.gray.color)
            //                        .lineLimit(10)
            //
            //                    Image("test")
            //
            //                    Text("\(viewStore.contents[1])")
            //                        .setFont(18, .medium)
            //                        .foregroundColor(Colors.gray.color)
            //                        .lineLimit(10)
            //                }
            
            WebView(url: URL(string: "https://mingyu.run")!)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            //            }
            
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
        .setBackground()
        
    }
}
