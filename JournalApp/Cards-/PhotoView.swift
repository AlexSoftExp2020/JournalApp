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
                        getImg(imageState: imageState)
                            .scaledToFill()
                            .frame(minWidth: 20, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
                    }
                }
                .onChange(of: imageSelection) { newItem in
                    // TODO: - updateImageState(newItem: newItem)
                    // updateImageState(newItem: newItem)
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
    
    private func updateImageState(newItem: PhotosPickerItem?) {
        Task {
            do {
                imageState = .loading
                // TODO: - PhotoFile
                guard let photoFile = try await newItem?.loadTransferable(type: PhotoFile.self),
                      let url = try FileManager.default.copyItemToDocumentDirectory(from: photoFile.url) else {
                    imageState = .empty
                    return
                }
                print("image saved to: \(url)")
                value.fileName = url.lastPathComponent
                print("image file name: \(url.lastPathComponent)")
                imageState = .success(url)
                
            } catch {
                print("Image download failed with error \(error.localizedDescription)")
                imageState = .failure(error)
            }
        }
    }
}

#Preview {
    PhotoView(value: .constant(ImageModel()), isEditing: true, fontStyle: .font1)
        .background(CardBackground())
}
