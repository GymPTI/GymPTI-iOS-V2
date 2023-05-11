//
//  EditAccountView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct EditAccountView {
    
    private let store: StoreOf<EditAccount>
    @ObservedObject var viewStore: ViewStoreOf<EditAccount>
    
    public init(store: StoreOf<EditAccount>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension EditAccountView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            Text("계정 정보 수정")
                .setFont(20, .semibold)
        }
        .setBackground()
        .navigationBarItems(
            trailing:
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image(systemName: "pencil")
                }
        )
    }
}
