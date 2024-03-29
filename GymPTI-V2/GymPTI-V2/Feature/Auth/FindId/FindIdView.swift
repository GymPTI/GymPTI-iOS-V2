//
//  FindIdView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import ComposableArchitecture

public struct FindIdView {
    
    private let store: StoreOf<FindId>
    @ObservedObject var viewStore: ViewStoreOf<FindId>
    
    public init(store: StoreOf<FindId>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension FindIdView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            CustomNavigationBar(title: "아이디 찾기") {
                viewStore.send(.onTapBackButton)
            }
            
            CustomTextField(text: viewStore.$email, isSecurable: false)
            
            Spacer()
            
            CustomButton("찾기", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                
                viewStore.send(.onTapFindIdButton)
            }
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
