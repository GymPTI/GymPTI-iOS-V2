//
//  TipCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/16.
//

import ComposableArchitecture
import Combine
import Foundation

public struct Tip: ReducerProtocol {
    
    public struct State: Equatable {
        
        var url: String = ""
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
    }
    
    @Dependency(\.sideEffect.tip) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
}
