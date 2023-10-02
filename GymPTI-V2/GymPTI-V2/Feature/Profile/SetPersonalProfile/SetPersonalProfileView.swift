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
        
        VStack(spacing: 0) {
            
            CustomNavigationBar(title: "신체 프로필 설정", leadingButtonAction: {
                viewStore.send(.onTapBackButton)
            }, trailingButtonTitle: "저장") {
                
            }
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("신체 정보를 입력해주세요")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        Text("*모든 신체 정보는더욱 정확한 루틴을 만들기 위해 필요하며 그 외 어떠한 곳에도 사용되지 않습니다.")
                            .setFont(14, .regular)
                            .foregroundColor(Colors.white.color)
                            .padding(.trailing, 28)
                    }
                    
                    Text("성별")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .padding(.top, 10)
                    
                    HStack(spacing: 15) {
                        
                        Button{
                            viewStore.send(.onTapMaleButton)
                        } label: {
                            Text("남성")
                                .setFont(16, .bold)
                                .foregroundColor(Colors.white.color)
                                .padding(15)
                                .background(
                                    Rectangle()
                                        .fill(viewStore.sex == "male" ? Colors.main.color : Colors.darkGray.color)
                                        .frame(width: 64, height: 34)
                                        .cornerRadius(15)
                                )
                        }
                        .scaledButtonStyle()
                        
                        Button{
                            viewStore.send(.onTapFemaleButton)
                        } label: {
                            Text("여성")
                                .setFont(16, .bold)
                                .foregroundColor(Colors.white.color)
                                .padding(15)
                                .background(
                                    Rectangle()
                                        .fill(viewStore.sex == "female" ? Colors.main.color : Colors.darkGray.color)
                                        .frame(width: 64, height: 34)
                                        .cornerRadius(15)
                                )
                        }
                        .scaledButtonStyle()
                        
                        Text("나이")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                        
                        Button{
                            viewStore.send(.onTapAgeButton)
                        } label: {
                            Text("\(viewStore.age)")
                                .setFont(16, .bold)
                                .foregroundColor(Colors.white.color)
                                .padding(15)
                                .background(
                                    Rectangle()
                                        .fill(viewStore.sex == "female" ? Colors.main.color : Colors.darkGray.color)
                                        .frame(width: 64, height: 34)
                                        .cornerRadius(15)
                                )
                        }
                        .scaledButtonStyle()
                    }
                    
                    Picker(selection: viewStore.$age, label: Text("")) {
                        
                        ForEach(1..<100) { i in
                            Text("\(i)")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .padding()
            }
            
        }
        .setBackground()
    }
}
