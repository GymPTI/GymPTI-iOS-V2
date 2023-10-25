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
                let newState = state
                Task {
                    try await print(findIdRequest(state: newState))
                    
                }
                return .none
            }
        }
    }
    
    func findIdRequest(state: State) async throws -> IdData {
        
        let params = ["email": state.email]
        
        do {
            let response = try await Service.request(API.url, .get, params: params, IdData.self)
            return response
        } catch {
            return IdData(userId: "none")
        }
    }
}

public struct IdData: Codable {
    let userId: String?
}
