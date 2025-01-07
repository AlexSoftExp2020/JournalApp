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
    
    @ViewBuilder
    private func getImg(imageState: ImageState) -> some View {
        switch imageState {
        case .success(let url):
            AsyncImage(url: url) { image in
                image
                    .resizable()
            } placeholder: {
                Text("Loading Image...")
                    .modifier(FontStyle(size: 12))
            }
        case .loading:
            Text("Loading Image...")
                .modifier(FontStyle(size: 12))
        case .empty:
            Image(systemName: "plus")
                .font(.system(size: 30))
        case .failure(_):
            Image("errorloadingimage")
                .resizable()
                .scaledToFit()
                .frame(height: 35)
        }
    }
}

#Preview {
    PhotoView()
}
