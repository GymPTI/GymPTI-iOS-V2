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
        viewStore = ViewStore(store)
    }
}

extension RoutineView: View {
    
    public var body: some View {
        
        VStack(alignment: .center, spacing: 10) {

            ZStack {
                            
                Button(action: {
                    print("띵~~")
                }) {
                    Image("bell")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Text("루틴")
                .setFont(38, .bold)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
