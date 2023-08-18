//
//  EditInfoCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import _PhotosUI_SwiftUI

public struct EditInfo: ReducerProtocol {
    
    @available(iOS 16.0, *)
    public struct State: Equatable {
        
        @BindingState var profileImage: String = ""
        @BindingState var newName: String
        @BindingState var newStatusMessage: String
        
        @BindingState var selectedItem: PhotosPickerItem? = nil
        @BindingState var selectedImageData: Data? = nil
        
        @BindingState var successEditProfile: Bool = false
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapChangeButton
        case onChangeProfileImage(Data)
        case onSuccessEditProfile(Bool)
    }
    
    @Dependency(\.sideEffect.editInfo) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapChangeButton:
                editProfileRequest(state: state)
                return .none
                
            case .onChangeProfileImage(let data):
                state.selectedImageData = data
                return .none
                
            case .onSuccessEditProfile(let success):
                state.successEditProfile = success
                return .none
            }
        }
    }
    
    private func editProfileRequest(state: State) {
        
        if let image = state.selectedImageData {
            
            Requests.uploadImage("/user/profileImage", image: image) {
                sideEffect.onTapBackButton()
            }
        } else {
            
            Requests.simple("/user/nickname", .put, params: ["newNickname": state.newName], failure: { _ in
                sideEffect.onTapBackButton()
            }) {
                print("닉네임 변경 성공")
            }
            
            Requests.simple("/user/statusMessage", .put,
                            params: ["statusMessage": state.newStatusMessage],
                            failure: { _ in
                sideEffect.onTapBackButton()
            }) {
                print("상태 메시지 변경 성공")
                sideEffect.onTapBackButton()
            }
        }
    }
}
