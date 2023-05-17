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
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapChangeButton
        case onChangeProfileImage(Data)
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
            }
        }
    }
    
    private func editProfileRequest(state: State) {
        
        Requests.simple("/user/nickname", .put, params: ["newNickname": state.newName], failure: { message in
            
            print(message)
        }) {
            print("닉네임 변경 성공")
            sideEffect.onTapBackButton()
        }
        
        Requests.simple("/user/statusMessage", .put, params: ["statusMessage": state.newStatusMessage], failure: { message in
            
            print(message)
        }) {
            print("상태 메시지 변경 성공")
            sideEffect.onTapBackButton()
        }
        
        Requests.simple("/user/profileImage", .put, params: ["profileImage": state.selectedImageData!], failure: { message in
            
            print(message)
        }) {
            print("프로필 사진 변경 성공")
            sideEffect.onTapBackButton()
        }
    }
}
