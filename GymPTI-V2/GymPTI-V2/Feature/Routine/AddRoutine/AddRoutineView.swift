//
//  AddRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI
import ComposableArchitecture

public struct AddRoutineView {
    
    private let store: StoreOf<AddRoutine>
    @ObservedObject var viewStore: ViewStoreOf<AddRoutine>
    
    public init(store: StoreOf<AddRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension AddRoutineView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 9, height: 15)
                }
                .frame(width: 42, height: 36)
                .padding(.bottom, 6)
                
                Spacer()
                
                Text("루틴 추가하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                    .padding(.trailing, 42)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Colors.darkGray.color)
            
            Spacer()
        }
        .setBackground()
    }
}
