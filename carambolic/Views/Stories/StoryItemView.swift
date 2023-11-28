//
//  StoryItemView.swift
//  carambolic
//
//  Created by Omar Sánchez on 20/11/23.
//

import SwiftUI

struct StoryItemView: View {
    let story: Story
    let namespace: Namespace.ID?
    
    init(story: Story, namespace: Namespace.ID? = nil) {
        self.story = story
        self.namespace = namespace
    }
    
    var body: some View {
        HStack {
            if namespace != nil {
                StoryThumbnailView(story.thumbnail)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .matchedGeometryEffect(id: story.id, in: namespace!, properties: [.position, .size], anchor: .center)
                    .frame(width: 50, height: 50)
                    .zIndex(5)
            } else {
                StoryThumbnailView(story.thumbnail)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(story.title)
                    .lineLimit(1)
                Text(story.bookmark.url.absoluteString)
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoryItemView(story: Story.mocks[0])
}
