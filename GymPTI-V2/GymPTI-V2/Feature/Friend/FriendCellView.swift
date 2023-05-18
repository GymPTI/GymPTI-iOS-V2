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
    
    init(name: String,
         id : String)
    {
        self.name = name
        self.id = id
    }
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .center, spacing: 6) {
                
                Image("Profile")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    
                    Text("푸쉬업1000개")
                        .setFont(16, .semibold)
                        .foregroundColor(Colors.white.color)
                    
                    Text("nowTryPushUp1000")
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
        }
    }
    
}
