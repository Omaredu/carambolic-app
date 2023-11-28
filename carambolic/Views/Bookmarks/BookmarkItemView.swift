//
//  BookmarkItemView.swift
//  carambolic
//
//  Created by Omar Sánchez on 22/11/23.
//

import SwiftUI

struct BookmarkItemView: View {
    let bookmark: Bookmark
    
    var body: some View {
        HStack {
            Image(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.purple)
                .frame(width: 20, height: 20)
            VStack(alignment: .leading) {
                Text(bookmark.url.absoluteString)
                Text(bookmark.title)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BookmarkItemView(bookmark: Bookmark.mocks[0])
}
