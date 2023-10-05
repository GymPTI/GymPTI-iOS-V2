//
//  SetPersonalProfileView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/24.
//

import SwiftUI
import ComposableArchitecture

public struct SetPersonalProfileView {
    
    private let store: StoreOf<SetPersonalProfile>
    @ObservedObject var viewStore: ViewStoreOf<SetPersonalProfile>
    
    public init(store: StoreOf<SetPersonalProfile>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SetPersonalProfileView: View {
    
    public var body: some View {
        
        ZStack(alignment: .center) {
            
            VStack(spacing: 0) {
                
                CustomNavigationBar(title: "신체 프로필 설정", leadingButtonAction: {
                    viewStore.send(.onTapBackButton)
                }, trailingButtonTitle: "저장") {
                    
                }
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("신체 정보를 입력해주세요")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        Text("모든 신체 정보는 더욱 정확한 루틴을 만들기 위해\n필요하며 그 외 어떠한 곳에도 사용되지 않습니다.")
                            .setFont(14, .regular)
                            .foregroundColor(Colors.white.color)
                            .padding(.trailing, 28)
                        
                        HStack(alignment: .center, spacing: 8) {
                            
                            Text("성별")
                                .setFont(20, .bold)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 80, alignment: .leading)
                            
                            Button{
                                viewStore.send(.onTapMaleButton)
                            } label: {
                                Text("남성")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .padding(15)
                                    .background(
                                        Rectangle()
                                            .fill(viewStore.gender == "MALE" ? Colors.main.color : Colors.darkGray.color)
                                            .frame(width: 64, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
                            .scaledButtonStyle()
                            .frame(width: 64, height: 34)
                            
                            Button{
                                viewStore.send(.onTapFemaleButton)
                            } label: {
                                Text("여성")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .padding(15)
                                    .background(
                                        Rectangle()
                                            .fill(viewStore.gender == "FEMALE" ? Colors.main.color : Colors.darkGray.color)
                                            .frame(width: 64, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
                            .scaledButtonStyle()
                            .frame(width: 64, height: 34)
                        }
                        .padding(.top, 15)
                        
                        HStack(alignment: .center, spacing: 8) {
                            
                            Text("나이")
                                .setFont(20, .bold)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 80, alignment: .leading)
                            
                            Button{
                                viewStore.send(.onTapAgeButton)
                            } label: {
                                Text("\(viewStore.age)")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .background(
                                        Rectangle()
                                            .fill(Colors.darkGray.color)
                                            .frame(width: 64, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
                            .scaledButtonStyle()
                            .frame(width: 64, height: 34)
                            
                            Text("살")
                                .setFont(14, .bold)
                                .foregroundColor(Colors.white.color)
                        }
                        .padding(.top, 15)
                        
                        HStack(alignment: .center, spacing: 8) {
                            
                            Text("키")
                                .setFont(20, .bold)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 80, alignment: .leading)
                            
                            Button{
                                viewStore.send(.onTapHeightButton)
                            } label: {
                                Text("\(viewStore.height)")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .background(
                                        Rectangle()
                                            .fill(Colors.darkGray.color)
                                            .frame(width: 64, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
                            .scaledButtonStyle()
                            .frame(width: 64, height: 34)
                            
                            Text("cm")
                                .setFont(14, .bold)
                                .foregroundColor(Colors.white.color)
                        }
                        .padding(.top, 15)
                        
                        HStack(alignment: .center, spacing: 8) {
                            
                            Text("몸무게")
                                .setFont(20, .bold)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 80, alignment: .leading)
                            
                            Button{
                                viewStore.send(.onTapWeightButton)
                            } label: {
                                Text("\(viewStore.weight)")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .background(
                                        Rectangle()
                                            .fill(Colors.darkGray.color)
                                            .frame(width: 64, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
                            .scaledButtonStyle()
                            .frame(width: 64, height: 34)
                            
                            Text("kg")
                                .setFont(14, .bold)
                                .foregroundColor(Colors.white.color)
                        }
                        .padding(.top, 15)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                }
            }
            
            if viewStore.isTapAgeButton {
                CustomWheelPicker("나이", value: viewStore.$age) {
                    viewStore.send(.onTapBackground)
                }
            } else if viewStore.isTapHeightButton {
                CustomWheelPicker("키", value: viewStore.$height) {
                    viewStore.send(.onTapBackground)
                }
            } else if viewStore.isTapWeightButton {
                CustomWheelPicker("몸무게", value: viewStore.$weight) {
                    viewStore.send(.onTapBackground)
                }
            }
        }
        .setBackground()
    }
}

fileprivate struct CustomWheelPicker: View {
    
    let title: String
    let value: Binding<Int>
    let onTapAction: () -> Void
    
    init(_ title: String, value: Binding<Int>, action: @escaping () -> Void) {
        self.title = title
        self.value = value
        self.onTapAction = action
    }
    
    var body: some View {
    
        VStack(spacing: 0) {
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                
                Rectangle()
                    .fill(Colors.darkGray.color)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                
                Text("\(title)")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
            }
            Picker(selection: value, label: Text("")) {
                
                if title == "나이" {
                    ForEach(0..<100) { i in
                        Text("\(i)")
                    }
                } else {
                    ForEach(0..<200) { i in
                        Text("\(i)")
                    }
                }
            }
            .pickerStyle(.wheel)
            .background(Colors.darkGray.color)
        }
        .background(.black.opacity(0.66))
        .onTapGesture {
            onTapAction()
        }
    }
}
