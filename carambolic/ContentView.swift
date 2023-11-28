//
//  ContentView.swift
//  carambolic
//
//  Created by Omar Sánchez on 23/10/23.
//

import SwiftUI
	
struct ContentView: View {
    var body: some View {
        TabView {
            BookmarksView(bookmarks: Bookmark.mocks)
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.square")
                }
            StoriesView(stories: Story.mocks)
                .tabItem {
                    Label("Stories", systemImage: "point.bottomleft.forward.to.point.topright.scurvepath")
                }
        }
    }
}

#Preview {
    ContentView()
}
