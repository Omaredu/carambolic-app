//
//  BookmarksView.swift
//  carambolic
//
//  Created by Omar Sánchez on 20/11/23.
//

import SwiftUI

struct BookmarksView: View {
    @State private var search = ""
    @State private var selectedBookmark: Bookmark?
    let bookmarks: [Bookmark]
    
    init(bookmarks: [Bookmark] = []) {
        self.bookmarks = bookmarks
    }
    
    var body: some View {
        NavigationStack {
            List(bookmarks) { bookmark in
                BookmarkItemView(bookmark: bookmark)
                    .onTapGesture {
                        selectedBookmark = bookmark
                    }
            }
            .searchable(text: $search)
            .navigationTitle("My Bookmarks")
        }
        .sheet(item: $selectedBookmark) { bookmark in
            BookmarkView(bookmark: bookmark)
        }
    }
}

#Preview {
    BookmarksView(bookmarks: Bookmark.mocks)
}
