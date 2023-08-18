//
//  CustomSecureField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

//import SwiftUI
//
//struct CustomSecureField: View {
//
//    let title: String
//    let text: Binding<String>
//
//    @State var isEditing: Bool = false
//    @State var strokeBorderOpacity: CGFloat = 0.3
//
//    @State var isTouchEyes: Bool = false
//
//    init(_ title: String,
//         text: Binding<String>)
//    {
//        self.title = title
//        self.text = text
//    }
//
//    var body: some View {
//
//        VStack(alignment: .leading) {
//
//            HStack {
//
//                if !isTouchEyes {
//
//                    TextField(title, text: text) { isEditing in
//                        if isEditing {
//                            strokeBorderOpacity = 1
//                        } else {
//                            strokeBorderOpacity = 0.3
//                        }
//                    }
//                    .setFont(14, .medium)
//                    .textContentType(.password)
//                    .foregroundColor(Colors.white.color)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                    .autocapitalization(.none)
//                    .autocorrectionDisabled(true)
//                    .padding(.leading, 20)
//                } else {
//                    TextField(title, text: text) { isEditing in
//                        if isEditing {
//                            strokeBorderOpacity = 1
//                        } else {
//                            strokeBorderOpacity = 0.3
//                        }
//                    }
//                    .setFont(14, .medium)
//                    .foregroundColor(Colors.white.color)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .autocapitalization(.none)
//                    .autocorrectionDisabled(true)
//                    .padding(.leading, 20)
//                }
//
//                Button(action: {
//                    isTouchEyes.toggle()
//                }) {
//                    if !isTouchEyes {
//                        Image(systemName: "eye")
//                            .foregroundColor(Colors.main.color.opacity(0.3))
//                    } else {
//                        Image(systemName: "eye.fill")
//                            .foregroundColor(Colors.main.color)
//                    }
//                }
//                .padding(.trailing, 10)
//
//            }
//            .frame(height: 52)
//            .background(Colors.black.color)
//            .overlay(RoundedRectangle(cornerRadius: 10)
//                .strokeBorder(Colors.main.color.opacity(strokeBorderOpacity), lineWidth: 2))
//        }
//    }
//}
