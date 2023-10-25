//
//  EditInfoCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import SwiftUI

public struct EditInfo: Reducer {
    
    public struct State: Equatable {
        
        @BindingState var profileImage: String = ""
        
        @BindingState var newName: String
        
        @BindingState var newStatusMessage: String
        
        @BindingState var isShowPhotoLibrary: Bool = false
        
        @BindingState var selectImage = UIImage()
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapSaveButton
        case onTapChangeProfileButton
    }
    
    @Dependency(\.sideEffect.editInfo) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapSaveButton:
                let newState = state
                Task {
                    await putUserNickname(state: newState)
                    await putUserNickStatusMessage(state: newState)
                    await putUserProfileImage(state: newState)
                }
                return .none
                
            case .onTapChangeProfileButton:
                state.isShowPhotoLibrary = true
                return .none
            }
        }
    }
    
    func putUserNickname(state: State) async {
        
        do {
            print(try await Service.request(API.user_nickname, .put, params: ["newNickname": state.newName]))
            await MainActor.run {
                sideEffect.onSuccessPutUserData()
            }
        } catch {
            await MainActor.run {
                sideEffect.onFailPutUserData("닉네임")
            }
        }
    }
    
    func putUserNickStatusMessage(state: State) async {
        
        do {
            print(try await Service.request(API.user_statusMessage, .put, params: ["statusMessage": state.newStatusMessage]))
            await MainActor.run {
                sideEffect.onSuccessPutUserData()
            }
        } catch {
            await MainActor.run {
                sideEffect.onFailPutUserData("상태 메시지")
            }
        }
    }
    
    func putUserProfileImage(state: State) async {
        
        do {
            print(try await Service.uploadImage(API.user_profileImage, .put, image: state.selectImage))
        } catch {
            await MainActor.run {
                sideEffect.onFailPutUserData("프로필 사진")
            }
        }
    }
}
