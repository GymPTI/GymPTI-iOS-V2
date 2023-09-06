//
//  ProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import Combine
import PhotosUI

public struct Profile: Reducer {
    
    public struct State: Equatable {
        
        var name: String = "Roading..."
        
        var id: String = "Roading..."
        
        var message: String = "Roading..."
        
        var profileImage: String = "Profile"
        
        @BindingState var selectedImageData: Data? = nil
    }
    
    public enum Action: Equatable {
        
        case onTapNotificationButton
        case onTapSettingButton
        case onTapEditInfoButton
        case onAppearProfile
        case userDataReceived(TaskResult<User>)
    }
    
    @Dependency(\.sideEffect.profile) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapNotificationButton:
                sideEffect.onTapNotificationButton()
                return .none
                
            case .onTapSettingButton:
                sideEffect.onTapSettingButton()
                return .none
                
            case .onTapEditInfoButton:
                sideEffect.onTapEditInfoButton(state.name, state.message, state.profileImage)
                return .none
                
            case .onAppearProfile:
                return .run { send in
                    
                    await send(.userDataReceived(
                        TaskResult { try await
                            ProfileAPIManagement.getUserData()
                        })
                    )
                }
                
            case let .userDataReceived(.success(response)):
                state.name = response.nickname!
                state.id = response.userId!
                state.message = response.statusMessage!
                state.profileImage = response.profileImage!
                return .none
                
            case .userDataReceived(.failure):
                return .none
            }
        }
    }
}

public struct User: Codable, Equatable {
    
    let userId, nickname, email, profileImage, statusMessage: String?
}

fileprivate class ProfileAPIManagement {
    
    static func getUserData() async throws -> User {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            Requests.request("/user/my", .get, User.self) { error in
                print("에러: \(error)")
            } completion: { user in
                continuation.resume(returning: user)
            }
        }
    }

}
