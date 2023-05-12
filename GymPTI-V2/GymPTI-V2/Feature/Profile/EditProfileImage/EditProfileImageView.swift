//
//  EditProfileImageView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var image: UIImage?
    @State private var showPhotoPicker: Bool = false

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("No Image Selected")
            }

            Button("Select Image") {
                self.showPhotoPicker.toggle()
            }
            .sheet(isPresented: $showPhotoPicker) {
                PhotoPicker(image: $image)
            }
        }
    }
}
