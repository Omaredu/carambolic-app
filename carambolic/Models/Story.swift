//
//  Story.swift
//  carambolic
//
//  Created by Omar Sánchez on 25/11/23.
//

import Foundation

struct Story: Identifiable, Hashable {
    let id: String
    let title: String
    let bookmark: Bookmark
    let thumbnail: URL
    let acts: [Act]
    
    init(id: String = UUID().uuidString, title: String, bookmark: Bookmark, acts: [Act]) {
        self.id = id
        self.title = title
        self.bookmark = bookmark
        self.acts = acts
        self.thumbnail = acts[0].image
    }
    
    public static let mocks = [
        Story(title: "La gallina de los huevos de oro", 
              bookmark: Bookmark.mocks[0],
              acts: [Act.mocks[0], Act.mocks[1], Act.mocks[2], Act.mocks[3]]),
        Story(title: "El tenebroso monitor de quemadores",
              bookmark: Bookmark.mocks[1],
              acts: [Act.mocks[3], Act.mocks[4], Act.mocks[5]])
    ]
}
