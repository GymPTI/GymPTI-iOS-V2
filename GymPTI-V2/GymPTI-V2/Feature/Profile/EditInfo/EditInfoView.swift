//
//  EditInfoView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct EditInfoView {
    
    private let store: StoreOf<EditInfo>
    @ObservedObject var viewStore: ViewStoreOf<EditInfo>
    
    public init(store: StoreOf<EditInfo>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension EditInfoView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            CustomNavigationBar(title: "프로필 정보 수정", leadingButtonAction: {
                viewStore.send(.onTapBackButton)
            }, trailingButtonTitle: "저장") {
                viewStore.send(.onTapSaveButton)
            }
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    ZStack(alignment: .bottomTrailing) {
                        
                        if viewStore.selectImage == UIImage() {
                            AsyncImage(url: URL(string: viewStore.profileImage)) { image in
                                image
                                    .resizable()
                                    .frame(width: 108, height: 108)
                                    .clipShape(Circle())
                            } placeholder: {
                                Image("user")
                                    .resizable()
                                    .frame(width: 108, height: 108)
                                    .clipShape(Circle())
                            }
                        } else {
                            Image(uiImage: viewStore.selectImage)
                                .resizable()
                                .frame(width: 108, height: 108)
                                .clipShape(Circle())
                        }
                        
                        Button {
                            viewStore.send(.onTapChangeProfileButton)
                        } label: {
                            HStack {
                                Image("Edit")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                            .frame(width: 36, height: 36)
                            .background(Colors.main.color)
                            .cornerRadius(28)
                            .overlay(RoundedRectangle(cornerRadius: 28)
                                .strokeBorder(Colors.black.color, lineWidth: 4))
                            .padding(.bottom, -4)
                            .padding(.trailing, -4)
                        }
                        .sheet(isPresented: viewStore.$isShowPhotoLibrary) {
                            ImagePickerView(result: viewStore.$profileImage, selectedImage: viewStore.$selectImage, sourceType: .photoLibrary)
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Text("이름")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(text: viewStore.$newName, isSecurable: false)
                    
                    Text("상태 메시지")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    CustomTextField(text: viewStore.$newStatusMessage, isSecurable: false)
                    
                    Spacer()
                }
                .padding()
            }
            
        }
        .setBackground()
    }
}
