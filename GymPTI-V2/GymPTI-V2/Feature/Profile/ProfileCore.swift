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
        
        var user: User? = nil
        
        @BindingState var selectedImageData: Data? = nil
    }
    
    public enum Action: Equatable {
        
        case onTapNotificationButton
        case onTapSettingButton
        case onTapEditInfoButton
        case onTapSetPersonalProfileButton
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
                sideEffect.onTapEditInfoButton(state.user?.nickname ?? "",
                                               state.user?.statusMessage ?? "",
                                               state.user?.profileImage ?? "profile")
                return .none
                
            case .onTapSetPersonalProfileButton:
                sideEffect.onTapSetPersonalProfileButton(state.user?.gender ?? "MALE",
                                                         String(state.user?.age ?? 0),
                                                         String(state.user?.weight ?? 0),
                                                         String(state.user?.height ?? 0))
                return .none
                
            case .onAppearProfile:
                return .run { send in
                    
                    await send(.userDataReceived(
                        TaskResult { try await
                            getUserData()
                        })
                    )
                }
                
            case let .userDataReceived(.success(response)):
                state.user = response
                return .none
                
            case .userDataReceived(.failure):
                return .none
            }
        }
    }
    
    func getUserData() async throws -> User {
        
        do {
            let response = try await Service.request(API.user_my, .get, DataResponse<User>.self)
            return response.data
        } catch let error {
            throw(error)
        }
    }
}

public struct User: Codable, Equatable {
    
    let userId, nickname, email, profileImage, statusMessage, gender: String?
    let height, weight, age: Int
}
