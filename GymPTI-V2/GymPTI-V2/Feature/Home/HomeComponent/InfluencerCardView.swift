//
//  InfluencerCardView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/10.
//

import SwiftUI

struct InfluencerCardView: View {
    
    let rinkURL: String
    let influencerImageURL: String
    let influencerProfileURL: String
    let title: String
    let platform: String
    let subTitle: String
    @State var isLong: Bool = false
    
    init(rinkURL: String,
         influencerImageURL: String,
         influencerProfileURL: String,
         title: String,
         platform: String,
         subTitle: String) {
        
        self.rinkURL = rinkURL
        self.influencerImageURL = influencerImageURL
        self.influencerProfileURL = influencerProfileURL
        self.title = title
        self.platform = platform
        self.subTitle = subTitle
    }
    
    var body: some View {
        
        Button {
            
            if let youtubeURL = URL(string: "\(rinkURL)") {
                
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
            }
        } label : {
            
            ZStack(alignment: .bottom) {
                
                Image("\(influencerImageURL)")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 240)
                
                HStack(alignment: .center, spacing: 15) {
                    
                    AsyncImage(url: URL(string: "\(influencerProfileURL)")) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                    } placeholder: {
                        Image("user")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                    }
                    .padding(.leading, 15)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        
                        Text("\(title)")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        HStack(spacing: 4) {
                            
                            Image("\(platform)")
                                .resizable()
                                .frame(width: 12, height: 12)
                            
                            Text("\(subTitle)")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 78)
                .background(Colors.darkGray.color.opacity(0.6))
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 240)
            .cornerRadius(10)
        }
        .scaledButtonStyle()
    }
}
