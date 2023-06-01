//
//  LoadingView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.4))
    }
}
