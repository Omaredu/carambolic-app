//
//  StoriesService.swift
//  carambolic
//
//  Created by Omar Sánchez on 27/11/23.
//

import Foundation
import Apollo

class StoriesService: ObservableObject {
    @Published public var stories: [Story]
    @Published public var loading: Bool
    private let client: ApolloClient
    
    init(client: ApolloClient = CarambolicClient.client) {
        self.client = client
        self.stories = []
        self.loading = false
    }
    
    func listStories() {
        self.loading = true
        client.fetch(query: CarambolicSchema.GetAllStoriesQuery()) { result in
            self.loading = false
            guard let data = try? result.get().data else { return }
            self.stories = data.stories.compactMap { story in
                guard let bookmarkId = story.bookmark?.id,
                      let bookmarkThumbnail = story.bookmark?.thumbnail,
                      let bookmarkUrl = story.bookmark?.url,
                      let bookmarkTitle = story.bookmark?.title,
                      let bookmarkSummary = story.bookmark?.summary else {
                    return nil
                }
                let bookmark = Bookmark(id: bookmarkId, thumbnail: bookmarkThumbnail, url: bookmarkUrl, title: bookmarkTitle, summary: bookmarkSummary, check: story.bookmark!.isTrue!)

                let acts = story.acts?.compactMap { act -> Act? in
                    guard let image = act.image,
                          let title = act.title,
                          let body = act.body else {
                        return nil
                    }
                    return Act(image: image, title: title, body: body)
                } ?? []

                guard let storyTitle = story.title else {
                    return nil
                }

                return Story(id: story.id, title: storyTitle, bookmark: bookmark, acts: acts)
            }
        }
    }
    
    func createStory(bookmark: Bookmark) {
        self.loading = true
        client.perform(mutation: CarambolicSchema.StoryCreateMutation(input: .init(storyInput: .init(isPublic: false, bookmarkId: bookmark.id)))) { result in
            self.loading = false
        }
    }
}
