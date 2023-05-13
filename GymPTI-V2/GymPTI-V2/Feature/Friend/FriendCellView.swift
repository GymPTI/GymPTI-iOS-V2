//
//  FriendCellView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

struct FriendCellView: View {
    
    let name: String
    let id: String
    
    @State var isTapButon: Bool = false
    
    init(name: String,
         id : String)
    {
        self.name = name
        self.id = id
    }
    
    var body: some View {
        
        Button(action: {
            isTapButon.toggle()
        }) {
            if !isTapButon {
                
                HStack(alignment: .center, spacing: 6) {
                    
                    Image("Profile")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(.leading, 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(name)")
                            .setFont(16, .semibold)
                            .foregroundColor(Colors.white.color)
                        
                        Text("\(id)")
                            .setFont(10, .light)
                            .foregroundColor(Colors.gray.color)
                    }
                    .padding(.leading, 4)
                    
                    Spacer()
                }
                .frame(height: 64)
                .frame(maxWidth: .infinity)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
            } else {
                
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center, spacing: 6) {
                        
                        Image("Profile")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .padding(.leading, 20)
                        
                        VStack(alignment: .leading) {
                            
                            Text("\(name)")
                                .setFont(16, .semibold)
                                .foregroundColor(Colors.white.color)
                            
                            Text("\(id)")
                                .setFont(10, .light)
                                .foregroundColor(Colors.gray.color)
                        }
                        .padding(.leading, 4)
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    Text("친구의 더 상세한 정보")
                        .setFont(14, .medium)
                        .foregroundColor(Colors.gray.color)
                        .padding()
                    
                    Spacer()
                }
                .frame(height: 144)
                .frame(maxWidth: .infinity)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
            }
            
        }
        
    }
    
}
