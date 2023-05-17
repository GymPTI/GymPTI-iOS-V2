//
//  ProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import Combine
import PhotosUI

public struct Profile: ReducerProtocol {
    
    public struct State: Equatable {
        
        var data: User?
        
        var name: String {
            data?.nickname ?? "ㅤㅤㅤ"
        }
        var email: String {
            data?.email ?? ""
        }
        var message: String {
            data?.statusMessage ?? ""
        }
        var profileImage: String {
            data?.profileImage ?? "Profile"
        }
        
        @BindingState var selectedImageData: Data? = nil
    }
    
    public enum Action: Equatable {
        
        case onTapEditInfoButton
        case onTapEditAccountButton
        case onTapSettingButton
        case onAppearProfile
        case userDataReceived(User)
    }
    
    @Dependency(\.sideEffect.profile) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapEditInfoButton:
                sideEffect.onTapEditInfoButton(state.name, state.message, state.profileImage)
                return .none
                
            case .onTapEditAccountButton:
                sideEffect.onTapEditAccountButton()
                return .none
                
            case .onTapSettingButton:
                sideEffect.onTapSettingButton()
                return .none
                
            case .onAppearProfile:
                return getUserData()
                    .map(Profile.Action.userDataReceived)
                    .eraseToEffect()
                
            case .userDataReceived(let user):
                state.data = user
                return .none
            }
        }
    }
    
    private var userDataSubject = PassthroughSubject<User, Never>()
    
    private func getUserData() -> EffectPublisher<User, Never> {
        Effect.run { subscriber in
            Requests.request(
                "/user/my", .get, User.self,
                failure: { data in
                    print(data)
                },
                completion: { data in
                    subscriber.send(data)
                    subscriber.send(completion: .finished)
                }
            )
            
            return AnyCancellable {}
        }
    }
    
}

public struct User: Codable, Equatable {
    
    let userId, nickname, email, profileImage, statusMessage: String?
}
