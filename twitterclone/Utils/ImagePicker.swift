//
//  ImagePicker.swift
//  twitterclone
//
//  Created by ed on 05/05/2021.
//

// Wrapper struct to enable us to use UIKit features ported to SwiftUI.
// We want to be able to use the UIKit imagePicker UIVIew and manage the
// selected photo in a SwiftUI View. We must create ur object as a
// UIViewconrollerrepresentable in order to extracts the View part.

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // blank as we will not update the
        // view controller however the func
        // is required in order for us to
        // ahere to the protocol.
    }
    
    // The communication interpretor between
    // a UIViewController and a SwiftUI View.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.image = image
            parent.mode.wrappedValue.dismiss()
        }
    }
    
    
}
