//
//  ProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct Profile: ReducerProtocol {
    
    public struct State: Equatable {
        
        var name: String = ""
        var email: String = ""
        var message: String = ""
        var profileImage: String = "profile"
    }
    
    public enum Action: Equatable {
        
        case onTapEditInfoButton
        case onTapEditAccountButton
        case onTapSettingButton
        case onAppearProfile
    }
    
    @Dependency(\.sideEffect.profile) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapEditInfoButton:
                sideEffect.onTapEditInfoButton()
                return .none
                
            case .onTapEditAccountButton:
                sideEffect.onTapEditAccountButton()
                return .none
                
            case .onTapSettingButton:
                sideEffect.onTapSettingButton()
                return .none
                
            case .onAppearProfile:
                getUserData()
                return .none
            }
        }
    }
    
    private func getUserData() {
        
        Requests.request("/user/my", .get, User.self, failure: {
            print("겟 실패")
        }) { response in
            print(response)
        }
    }
    
    
}

struct User: Codable {
    
    let userId, nickname, email, profileImage, statusMessage: String?
}
