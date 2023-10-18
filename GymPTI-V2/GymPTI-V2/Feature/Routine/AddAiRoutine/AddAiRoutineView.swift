//
//  AddAiRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import SwiftUI
import ComposableArchitecture

struct AddAiRoutineView {
    
    private let store: StoreOf<AddAiRoutine>
    @ObservedObject var viewStore: ViewStoreOf<AddAiRoutine>
    
    public init(store: StoreOf<AddAiRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension AddAiRoutineView: View {
    
    var body: some View {
        Text("임시")
    }
}
