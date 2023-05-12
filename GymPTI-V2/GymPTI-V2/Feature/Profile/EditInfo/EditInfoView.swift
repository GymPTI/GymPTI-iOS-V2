//
//  EditInfoView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture
import Kingfisher
import PhotosUI

public struct EditInfoView {
    
    private let store: StoreOf<EditInfo>
    @ObservedObject var viewStore: ViewStoreOf<EditInfo>
    
    public init(store: StoreOf<EditInfo>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension EditInfoView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            ZStack(alignment: .bottom) {
                
                KFImage(URL(string: viewStore.profileImage))
                    .placeholder {
                        Image("Profile")
                            .resizable()
                            .frame(width: 108, height: 108)
                            .clipShape(Circle())
                    }
                    .resizable()
                    .frame(width: 108, height: 108)
                    .clipShape(Circle())
                
                PhotosPicker(
                    selection: viewStore.binding(\.$selectedItem),
                    matching: .images,
                    photoLibrary: .shared()) {
                        
                        HStack {
                            Image("Edit")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .frame(width: 42, height: 42)
                        .background(Color.accentColor)
                        .cornerRadius(28)
                        .overlay(RoundedRectangle(cornerRadius: 28)
                            .strokeBorder(Color("BackgroundColor"), lineWidth: 6))
                        .padding(.bottom, -20)
                    }
            }
            .padding(.bottom, 20)
            
            AuthTextfield("바꿀 닉네임을 입력해주세요.", text: viewStore.binding(\.$newNickname))
            
            AuthButton("닉네임 변경", disabled: false) {
                viewStore.send(.onTapChangeButton)
            }
        }
        .padding(.horizontal, 20)
        .setBackground()
        .navigationBarItems(
            trailing:
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image(systemName: "pencil")
                }
        )
    }
}
