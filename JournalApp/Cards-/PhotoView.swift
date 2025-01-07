//
//  PhotoView.swift
//  JournalApp
//
//  Created by Oleksii on 07.01.2025.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    @Binding var value: ImageModel
    @State private var imageState: ImageState = .empty
    @State private var imageSelection: PhotosPickerItem?
    var isEditing: Bool
    var fontStyle: JournalFont
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 10)
                    .frame(minHeight: 100, maxHeight: 200)
                    .foregroundColor(.clear)
                
                Image(systemName: "photo.fill")
                    .foregroundColor(.darkBrown)
                    .font(.system(size: 30))
            }
            .opacity(isEditing ? 0 : 1)
            VStack {
                PhotosPicker(selection: $imageSelection, matching: .images, photoLibrary: .shared()) {
                    if isEditing {
                        // TODO: - getImg(imageState: imageState)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoView()
}
