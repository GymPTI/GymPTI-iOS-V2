//
//  EditInfoView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct EditInfoView {
    
    private let store: StoreOf<EditInfo>
    @ObservedObject var viewStore: ViewStoreOf<EditInfo>
    
    public init(store: StoreOf<EditInfo>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension EditInfoView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            Text("회원 정보 수정")
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
