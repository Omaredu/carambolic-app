//
//  BookmarksService.swift
//  carambolic
//
//  Created by Omar Sánchez on 27/11/23.
//

import Foundation
import Apollo

class BookmarksService: ObservableObject {
    @Published public var bookmarks: [Bookmark]
    private let client: ApolloClient
    
    init(client: ApolloClient = CarambolicClient.client) {
        self.client = client
        self.bookmarks = []
    }
    
    func listBookmarks() {
        client.fetch(query: CarambolicSchema.GetAllBookmarksQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.bookmarks = data.bookmarks.compactMap { bookmark -> Bookmark? in
                guard let summary = bookmark.summary,
                      let thumbnail = bookmark.thumbnail,
                      let url = bookmark.url,
                      let title = bookmark.title else {
                    return nil
                }
                return Bookmark(id: bookmark.id, thumbnail: thumbnail, url: url, title: title, summary: summary, check: bookmark.isTrue!)
            }
        }
    }
}
