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
            
            VStack(spacing: 0) {
                
                Image("\(influencerImageURL)")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 206)
                
                HStack(spacing: 10) {
                    
                    AsyncImage(url: URL(string: "\(influencerProfileURL)")) { image in
                        image
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                    } placeholder: {
                        Image("user")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                    }
                    .padding(.leading, 15)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("\(title)")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        HStack(spacing: 4) {
                            
                            Image("\(platform)")
                                .resizable()
                                .frame(width: 12, height: 12)
                            
                            Text("\(subTitle)")
                                .setFont(12, .medium)
                                .foregroundColor(Colors.white.color)
                        }
                        .padding(.top, 4)
                    }
                    
                    Spacer()
                }
                .padding(.top, 15)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 296)
            .background(Colors.darkGray.color)
            .cornerRadius(10)
        }
    }
}
