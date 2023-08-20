//
//  RoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct RoutineView {
    
    private let store: StoreOf<Routine>
    @ObservedObject var viewStore: ViewStoreOf<Routine>
    
    public init(store: StoreOf<Routine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension RoutineView: View {
    
    public var body: some View {
        
        VStack {
            
            HStack {
                
                Text("루틴")
                    .setFont(34, .semibold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    
                    Button(action: {
                        viewStore.send(.onTapAiAddRoutineButton)
                    }) {
                        Image("ai")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 40)
                    
                    Button(action: {
                        viewStore.send(.onTapAddRoutineButton)
                    }) {
                        Image("add")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Colors.white.color)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            ScrollView {
                
                Button(action: {
                    
                })  {
                    Text("루틴")
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
