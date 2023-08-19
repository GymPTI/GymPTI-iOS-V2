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
import Shimmer

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
        
        ZStack {
            
            VStack(alignment: .center) {
                
                HStack {
                    
                    Button(action: {
                        viewStore.send(.onTapBackButton)
                    }) {
                        Image("Back")
                            .resizable()
                            .frame(width: 10, height: 18)
                    }
                    .frame(width: 32, height: 24)
                    
                    Spacer()
                    
                    Text("프로필 수정")
                        .setFont(18, .semibold)
                        .foregroundColor(Colors.white.color)
                    
                    Spacer()
                    
                    Button(action: {
                        if viewStore.newName.count >= 2 {
                            viewStore.send(.onSuccessEditProfile(true))
                            viewStore.send(.onTapChangeButton)
                        }
                    }) {
                        Text("완료")
                            .setFont(18, .medium)
                            .foregroundColor(Colors.white.color)
                    }
                    .disabled(!viewStore.newName.regex("[a-zA-Z0-9가-힣]{0,10}") && !viewStore.newStatusMessage.regex("[a-zA-Z0-9가-힣!@#$%^&*()<>?.,;:'\"]{0,30}"))
                    .frame(width: 32, height: 32)
                }
                
                ZStack(alignment: .bottomTrailing) {
                    
                    if viewStore.selectedImageData == nil {
                        
                        KFImage(URL(string: viewStore.profileImage))
                            .placeholder {
                                Image("Profile")
                                    .resizable()
                                    .frame(width: 86, height: 86)
                                    .clipShape(Circle())
                            }
                            .resizable()
                            .frame(width: 108, height: 108)
                            .clipShape(Circle())
                    } else {
                        
                        Image(uiImage: UIImage(data: viewStore.selectedImageData!)!)
                            .resizable()
                            .frame(width: 108, height: 108)
                            .clipShape(Circle())
                    }
                    
                    PhotosPicker(
                        selection: viewStore.$selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            
                            HStack {
                                Image("Edit")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                            }
                            .frame(width: 40, height: 40)
                            .background(Colors.main.color)
                            .cornerRadius(28)
                            .overlay(RoundedRectangle(cornerRadius: 28)
                                .strokeBorder(Colors.black.color, lineWidth: 6))
                            .padding(.bottom, -4)
                            .padding(.trailing, -4)
                        }
                        .onChange(of: viewStore.selectedItem) { item in
                            
                            Task {
                                if let data = try? await    item?.loadTransferable(type: Data.self) {
                                    viewStore.send(.onChangeProfileImage(data))
                                }
                            }
                        }
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                Text("이름")
                    .setFont(18, .medium)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
                CustomTextField(text: viewStore.$newName)
                
                Text("상태 메시지")
                    .setFont(18, .medium)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top], 10)
                
                CustomTextField(text: viewStore.$newStatusMessage)
                
                Spacer()
                
            }
            .padding()
            .setBackground()
            .onAppear {
                print(viewStore.newName, viewStore.profileImage)
            }
            
            if viewStore.successEditProfile {
                LoadingView()
            }
        }
    }
}
