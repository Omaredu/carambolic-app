//
//  BookmarkThumbnailView.swift
//  carambolic
//
//  Created by Omar Sánchez on 26/11/23.
//

import SwiftUI

struct BookmarkThumbnailView: View {
    let image: URL
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            } placeholder: {
                Text(image.absoluteString)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()
            .cornerRadius(10)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BookmarkThumbnailView(image: Bookmark.mocks[0].thumbnail)
        .frame(width:250, height: 250)
}
