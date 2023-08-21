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
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Button(action: {
                        viewStore.send(.onTapBackButton)
                    }) {
                        Image("Back")
                            .resizable()
                            .frame(width: 9, height: 15)
                    }
                    .frame(width: 42, height: 36)
                    .padding(.bottom, 6)
                    
                    Spacer()
                    
                    Text("정보 수정")
                        .setFont(18, .semibold)
                        .foregroundColor(Colors.white.color)
                        .padding(.bottom, 6)
                    
                    Spacer()
                    
                    Button(action: {
                        viewStore.send(.onTapChangeButton)
                    }) {
                        Text("저장")
                            .setFont(16, .semibold)
                            .foregroundColor(Colors.white.color)
                            .padding(.trailing, 10)
                    }
                    .frame(width: 42, height: 36)
                    .padding(.bottom, 6)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                
                EditInfoScrollView(viewStore: self.viewStore)
                
            }
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

extension EditInfoView {
    
    struct EditInfoScrollView: View {
        
        let viewStore: ViewStoreOf<EditInfo>
        
        init(viewStore: ViewStoreOf<EditInfo>) {
            self.viewStore = viewStore
        }
        
        var body: some View {
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 10) {
                    
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
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Text("이름")
                        .setFont(18, .medium)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(text: viewStore.$newName, isSecurable: false)
                    
                    Text("상태 메시지")
                        .setFont(18, .medium)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    CustomTextField(text: viewStore.$newStatusMessage, isSecurable: false)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
