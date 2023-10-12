//
//  SetPersonalProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/27.
//

import ComposableArchitecture

public struct SetPersonalProfile: Reducer {
    
    public struct State: Equatable {
        
        var gender: String = ""
        var isTapAgeButton: Bool = false
        var isTapHeightButton: Bool = false
        var isTapWeightButton: Bool = false
        @BindingState var age: Int = 20
        @BindingState var height: Int = 170
        @BindingState var weight: Int = 60
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapMaleButton
        case onTapFemaleButton
        case onTapAgeButton
        case onTapHeightButton
        case onTapWeightButton
        case onTapBackground
        case onTapSaveButton
    }
    
    @Dependency(\.sideEffect.setPesronalProfile) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapMaleButton:
                state.gender = "MALE"
                return .none
                
            case .onTapFemaleButton:
                state.gender = "FEMALE"
                return .none
                
            case .onTapAgeButton:
                state.isTapAgeButton.toggle()
                return .none
                
            case .onTapHeightButton:
                state.isTapHeightButton.toggle()
                return .none
                
            case .onTapWeightButton:
                state.isTapWeightButton.toggle()
                return .none
                
            case .onTapBackground:
                state.isTapAgeButton = false
                state.isTapHeightButton = false
                state.isTapWeightButton = false
                return .none
                
            case .onTapSaveButton:
                let newState = state
                Task {
                    await putBodyInfoData(state: newState)
                }
                return .none
            }
        }
    }
    
    func putBodyInfoData(state: State) async {
        
        let params: [String : Any] = [
            "gender": state.gender,
            "height": state.height,
            "weight": state.weight,
            "age": state.age
        ]
        
        do {
            print(try await Service.request("/user/bodyInfo", .put, params: params))
            await MainActor.run {
                sideEffect.onSuccessPutBodyInfoData()
            }
        } catch {
            await MainActor.run {
                sideEffect.onFailPutBodyInfoData()
            }
        }
    }
}
