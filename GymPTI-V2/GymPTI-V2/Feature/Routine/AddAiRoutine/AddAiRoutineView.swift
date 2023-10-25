//
//  AddAiRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import SwiftUI
import ComposableArchitecture

public struct AddAiRoutineView {
    
    private let store: StoreOf<AddAiRoutine>
    @ObservedObject var viewStore: ViewStoreOf<AddAiRoutine>
    
    public init(store: StoreOf<AddAiRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension AddAiRoutineView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "ai 루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("운동할 부위를 최대 3개까지 선택해주세요")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    HStack(spacing: 15) {
                        MucsleCardView("가슴", isSelect: viewStore.isSelectChestMuscle) {
                            viewStore.send(.onSelectChestMuscle)
                        }
                        
                        MucsleCardView("등", isSelect: viewStore.isSelectBackMuscle) {
                            viewStore.send(.onSelectBackMuscle)
                        }
                    }
                    
                    HStack(spacing: 15) {
                        MucsleCardView("팔", isSelect: viewStore.isSelectArmMuscle) {
                            viewStore.send(.onSelectArmMuscle)
                        }
                        
                        MucsleCardView("하체", isSelect: viewStore.isSelectLegsMuscle) {
                            viewStore.send(.onSelectLegsMuscle)
                        }
                    }
                    
                    HStack(spacing: 15) {
                        MucsleCardView("어깨", isSelect: viewStore.isSelectShoulderMuscle) {
                            viewStore.send(.onSelectShoulderMuscle)
                        }
                        
                        MucsleCardView("복근", isSelect: viewStore.isSelectAbsMuscle) {
                            viewStore.send(.onSelectAbsMuscle)
                        }
                    }
                    
                    CustomButton("다음", disabled: !viewStore.isSelectMuscle) {
//                        viewStore.send(.onTapBackButton)
                        print(viewStore.selectMuscle)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 100)
                    
                    /**
                     if viewStore.isSelectMuscle {
                     
                     VStack(alignment: .leading, spacing: 2) {
                     
                     Text("이런 운동은 어때요?")
                     .setFont(20, .bold)
                     .foregroundColor(Colors.white.color)
                     
                     Text("반드시 고를 필요는 없어요, 하지만 루틴 생성에 도움이 돼요!")
                     .setFont(12, .regular)
                     .foregroundColor(Colors.white.color)
                     }
                     
                     CustomButton("다음", disabled: !viewStore.isSelectExercise) {
                     viewStore.send(.onTapBackButton)
                     }
                     .padding(.top, 40)
                     .padding(.horizontal, 100)
                     }
                     */
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .setBackground()
    }
}

struct MucsleCardView: View {
    
    let muscle: String
    let isSelect: Bool
    let action: () -> Void
    
    init(_ muscle: String, isSelect: Bool, action: @escaping () -> Void)
    {
        self.muscle = muscle
        self.isSelect = isSelect
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label : {
            ZStack(alignment: .bottom) {
                Image("\(muscle)")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("\(muscle) 근육")
                        .setFont(14, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    Text("\(getTargetMuscle(muscle))")
                        .setFont(10, .medium)
                        .foregroundColor(Colors.white.color)
                }
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 42)
                .background(Colors.darkGray.color.opacity(0.6))
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .foregroundColor(isSelect ? .clear : .black.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .cornerRadius(10)
        }
        .scaledButtonStyle()
    }
    
    private func getTargetMuscle(_ muscle: String) -> String {
        switch muscle {
        case "가슴": return "대흉근 소흉근";
        case "등": return "광배근 승모근 기립근";
        case "하체": return "대퇴근 둔근 비복근";
        case "팔": return "이두근 삼두근 전완근";
        case "어깨": return "전면 측면 후면 삼각근";
        case "복근": return "복직근 외복사근 내복사근";
        default: return "해당하는 근육이 없습니다.";
        }
    }
}
