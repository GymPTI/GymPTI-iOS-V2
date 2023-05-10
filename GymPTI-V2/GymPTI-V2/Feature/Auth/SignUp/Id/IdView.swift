//
//  IdView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct IdView {
    
    private let store: StoreOf<Id>
    @ObservedObject var viewStore: ViewStoreOf<Id>
    
    public init(store: StoreOf<Id>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension IdView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            TextField("아이디를 입력해주세요", text: viewStore.binding(\.$id))
            
            Button("다음") {
                viewStore.send(.onTapNextButton)
                KeyboardManager.downKeyborad()
            }
        }
        .padding()
        .setBackground()
    }
}
