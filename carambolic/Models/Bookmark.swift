//
//  Bookmark.swift
//  carambolic
//
//  Created by Omar Sánchez on 22/11/23.
//

import Foundation

struct Bookmark: Identifiable, Hashable {
    let id: String
    let thumbnail: URL
    let url: URL
    let title: String
    let summary: String
    let createdAt: Date
    let updatedAt: Date
    let check: Bool
    
    init(
        id: String = UUID().uuidString,
        thumbnail: String,
        url: String,
        title: String,
        summary: String,
        check: Bool = false,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.thumbnail = URL(string: thumbnail)!
        self.url = URL(string: url)!
        self.title = title
        self.summary = summary
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.check = check
    }
    
    static let mocks: [Bookmark] = [
        Bookmark(
            thumbnail: "https://cnn.com/favicon.ico",
            url: "https://edition.cnn.com/middleeast/live-news/israel-hamas-war-gaza-news-11-27-23",
            title: "Hamas-Israel truce enters fourth day as aid reaches Gaza",
            summary: "As the truce between Hamas and Israel enters its fourth and final day Monday, both parties have discussed the possibility of extending it, a move which has the support of key nations, including the US and Qatar.", 
            check: true
        ),
        Bookmark(
            thumbnail: "https://bbc.com/favicon.ico",
            url: "https://www.bbc.com/mundo/articles/c729q62vgvzo",
            title: "Los rusos que sueñan con conseguir un pasaporte ucraniano",
            summary: "El Banco Nacional de Ucrania restringió los servicios financieros para todos los ciudadanos rusos y bielorrusos tras la invasión del país ordenada en febrero de 2022 por el presidente ruso, Vladímir Putin, aunque afirma que aquellos con un permiso de residencia no se ven afectados por la medida.", 
            check: false
        ),
        Bookmark(
            thumbnail: "https://www.gatesnotes.com/img/gatesnotes_badge.ico",
            url: "https://www.gatesnotes.com/Holiday-list-2023",
            title: "Great books, courses, and music for the holidays",
            summary: "At the end of the year, it’s always fun to look back on some of the best books I read. For 2023, three came to mind right away, each of them deeply informative and well written. I’ve also included economics courses by a phenomenal lecturer that I watched more than a decade ago but am still recommending to friends and family today. Just for fun, I threw in a playlist of great holiday songs from past and present, and from the U.S. and around the world.", 
            check: true
        )
    ]

}
