//
//  BookmarkView.swift
//  carambolic
//
//  Created by Omar Sánchez on 26/11/23.
//

import SwiftUI

struct BookmarkView: View {
    @Namespace var animationNamespace
    @Environment(\.openURL) var openURL
    @State private var isHeaderShown = false
    @State private var selectedIndex: Int?
    @State private var rotation: Double = 20
    let bookmark: Bookmark
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                VStack {
                    if !isHeaderShown {
                        BookmarkThumbnailView(image: bookmark.thumbnail)
                            .matchedGeometryEffect(id: "thumbnail", in: animationNamespace, properties: [.size, .position])
                            .frame(width: 200, height: 200)
                        
                        VStack {
                            HStack {
                                Text(bookmark.title)
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .lineLimit(1)
                                    .fontDesign(.rounded)
                                    .matchedGeometryEffect(id: "title", in: animationNamespace)
                                BookmarkCheckView(bookmark.check)
                                    .frame(width: 20)
                                    .matchedGeometryEffect(id: "mark", in: animationNamespace)
                            }
                            
                            Text(bookmark.url.absoluteString)
                                .multilineTextAlignment(.center)
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .matchedGeometryEffect(id: "url", in: animationNamespace)
                        }
                        .padding()
                    }
                    
                    Button(action: { openURL(bookmark.url) }, label: {
                        Label("Abrir bookmark", systemImage: "link")
                            .fontWeight(.medium)
                            .padding()
                    })
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    
                    Button(action: {}, label: {
                        Label("Convertir en historia", systemImage: "point.bottomleft.forward.to.point.topright.scurvepath")
                            .fontWeight(.medium)
                            .padding()
                    })
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear() {
                    withAnimation {
                        isHeaderShown = false
                    }
                }
                .onDisappear() {
                    withAnimation {
                        isHeaderShown = true
                    }
                }
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Resumen".uppercased())
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Text(bookmark.summary)
                            .padding()
                            .background(.thickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.bottom)
                    VStack(alignment: .leading) {
                        Text("Fact checking".uppercased())
                            .font(.caption)
                            .foregroundStyle(.gray)
                        HStack(alignment: .top) {
                            BookmarkCheckView(bookmark.check)
                                .frame(width: 15)
                                .padding(3)
                            Text(bookmark.check ? "Parece que el contenido de este bookmark, es verídico" : "Es probable que el contenido de este bookmark sea falso")
                                .foregroundStyle(bookmark.check ? .blue : .red)
                                .frame(width: .infinity)
                        }
                    }
                    .padding(.bottom)
                }
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear() {
                    withAnimation {
                        isHeaderShown = true
                    }
                }
                .onDisappear() {
                    withAnimation {
                        isHeaderShown = false
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .tabViewStyle(PageTabViewStyle())
            //.on
            .overlay {
                if isHeaderShown {
                    VStack {
                        HStack {
                            BookmarkThumbnailView(image: bookmark.thumbnail)
                                .matchedGeometryEffect(id: "thumbnail", in: animationNamespace)
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(bookmark.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .lineLimit(1)
                                        .fontDesign(.rounded)
                                        .matchedGeometryEffect(id: "title", in: animationNamespace)
                                    BookmarkCheckView(bookmark.check)
                                        .frame(width: 15)
                                        .matchedGeometryEffect(id: "mark", in: animationNamespace)
                                }
                                
                                Text(bookmark.url.absoluteString)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                    .lineLimit(1)
                                    .matchedGeometryEffect(id: "url", in: animationNamespace)
                            }
                            .padding(.leading, 5)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    BookmarkView(bookmark: Bookmark.mocks[2])
}
