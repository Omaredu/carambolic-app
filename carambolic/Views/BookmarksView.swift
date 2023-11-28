//
//  BookmarksView.swift
//  carambolic
//
//  Created by Omar Sánchez on 20/11/23.
//

import SwiftUI

struct BookmarksView: View {
    @ObservedObject var service: BookmarksService = BookmarksService()
    @ObservedObject var storiesService: StoriesService = StoriesService()
    @State private var search = ""
    @State private var selectedBookmark: Bookmark?
    let bookmarks: [Bookmark]
    
    init(bookmarks: [Bookmark] = []) {
        self.bookmarks = bookmarks
    }
    
    var body: some View {
        NavigationStack {
            List(service.bookmarks) { bookmark in
                BookmarkItemView(bookmark: bookmark)
                    .onTapGesture {
                        selectedBookmark = bookmark
                    }
            }
            .searchable(text: $search)
            .navigationTitle("My Bookmarks")
        }
        .sheet(item: $selectedBookmark) { bookmark in
            BookmarkView(bookmark: bookmark, onStoryCreate: {
                storiesService.createStory(bookmark: bookmark)
                selectedBookmark = nil
            })
        }
        .onAppear() {
            service.listBookmarks()
        }
    }
}

#Preview {
    BookmarksView(bookmarks: Bookmark.mocks)
}
