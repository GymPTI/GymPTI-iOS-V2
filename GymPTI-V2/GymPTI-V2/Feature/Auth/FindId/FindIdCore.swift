//
//  FindIdCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import ComposableArchitecture

public struct FindId: Reducer {
    
    public struct State: Equatable {
        
        var id: String = ""

        @BindingState var email: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapFindIdButton
    }
    
    @Dependency(\.sideEffect.name) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapFindIdButton:
//                findIdRequest(state: state)
                return .none
            }
        }
    }
    
//    private func findIdRequest(state: State) {
//
//        Requests.request("/user/forgotId", .get, params: ["email": state.email], FindId.self, failure: {
//            print("못 찾았습니다.")
//        }) { data in
//
//        }
//    }
}

public struct IdData: Codable {
    
    let userId: String?
}
