//
//  PhotoPicker.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }

    class Coordinator: PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let itemProvider = results.first?.itemProvider,
               itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                    } else if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self?.parent.image = image
                            self?.parent.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}
