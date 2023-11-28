//
//  BookmarkThumbnailView.swift
//  carambolic
//
//  Created by Omar Sánchez on 22/11/23.
//

import SwiftUI

struct StoryThumbnailView: View {
    let thumbnail: URL
    
    init(_ thumbnail: URL) {
        self.thumbnail = thumbnail
    }
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: thumbnail) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: geometry.size.width, height: geometry.size.height)
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoryThumbnailView(Story.mocks[0].thumbnail)
}
