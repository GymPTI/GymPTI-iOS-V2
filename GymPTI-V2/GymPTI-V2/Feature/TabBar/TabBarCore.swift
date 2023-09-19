//
//  TabBarCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/09.
//

import ComposableArchitecture
import Combine

public struct TabBar: Reducer {
    
    public struct State: Equatable {
        
        var selected: String = "home"

        var isUnconnected: Bool = false
    }
    
    public enum Action: Equatable {
        
        case selectTab(tabName: String)
        case isWifiUnconnected
    }
    
    @Dependency(\.sideEffect.tabbar) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .selectTab(let tabName):
                state.selected = tabName
                return .none
                
            case .isWifiUnconnected:
                state.isUnconnected = true
                sideEffect.isWifiUnconnected()
                return .none
            }
        }
    }
}
