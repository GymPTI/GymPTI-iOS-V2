//
//  EditInfoCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import _PhotosUI_SwiftUI

public struct EditInfo: Reducer {
    
    public struct State: Equatable {
        
        var profileImage: String = ""
        
        @BindingState var newName: String
        
        @BindingState var newStatusMessage: String
        
//        @BindingState var selectedItem: PhotosPickerItem? = nil
        
        var selectedImageData: Data? = nil
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapSaveButton
        case onChangeProfileImage(Data)
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
                }
                return .none
                
            case .onChangeProfileImage(let data):
                state.selectedImageData = data
                return .none
            }
        }
    }
    
    func putUserNickname(state: State) async {
        
        do {
            print(try await Service.request("/user/nickname", .put, params: ["newNickname": state.newName]))
            await MainActor.run {
                sideEffect.onSuccessPutUserData()
            }
        } catch {
            await MainActor.run {
                sideEffect.onFailPutUserData()
            }
        }
    }
    
    func putUserNickStatusMessage(state: State) async {
        
        do {
            print(try await Service.request("/user/statusMessage", .put, params: ["statusMessage": state.newStatusMessage]))
            await MainActor.run {
                sideEffect.onSuccessPutUserData()
            }
        } catch {
            await MainActor.run {
                sideEffect.onFailPutUserData()
            }
        }
    }
}
