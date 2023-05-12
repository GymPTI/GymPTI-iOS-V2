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
        
        var profileImage: String = ""
        
        @BindingState var newNickname: String = ""
        
        @available(iOS 16.0, *)
        @BindingState var selectedItem: PhotosPickerItem? = nil
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapChangeButton
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
                chageNickName(state: state)
                return .none
            }
        }
    }
    
    private func chageNickName(state: State) {
        
        Requests.simple("/user/nickname", .put, params: ["newNickname": state.newNickname], failure: {
            print("닉네임 변경 실패")
        }) {
            print("닉네임 변경 성공")
        }
    }
}
