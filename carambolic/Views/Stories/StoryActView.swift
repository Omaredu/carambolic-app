//
//  StoryActView.swift
//  carambolic
//
//  Created by Omar Sánchez on 25/11/23.
//

import SwiftUI

struct StoryActView: View {
    let act: Act
    
    @Binding var zoom: Float
    @State private var imageURL: URL?
    @State private var cardOffsetY: Float = 10
    @State private var cardOpacity: Double = 0
    let onLoad: () -> Void
    
    init(act: Act, zoom: Binding<Float> = .constant(0), onLoad: @escaping () -> Void = {}) {
        self.act = act
        self._zoom = zoom
        self.onLoad = onLoad
        self.cardOffsetY = cardOffsetY
        self.cardOpacity = cardOpacity
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .scaleEffect(1.0 + (CGFloat(zoom) / 3))
                        .onAppear() {
                            onLoad()
                            withAnimation {
                                cardOffsetY = 0
                                cardOpacity = 1.0
                            }
                        }
                        .onDisappear() {
                            withAnimation {
                                cardOffsetY = 20
                                cardOpacity = 0
                            }
                        }
                } placeholder: {
                    VStack {
                        ProgressView()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(.background)
                }
                .frame(width: geometry.size.width)
                .onAppear() {
                    imageURL = act.image
                }
                .id(act.id)
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Acto III")
                            .font(.headline)
                        Text(act.title)
                            .fontDesign(.rounded)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(act.body)
                            .padding(.top)
                            .fontDesign(.rounded)
                    }
                    .padding(20)
                    .background(.background)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .offset(y: CGFloat(cardOffsetY))
                    .opacity(cardOpacity)
                }
                .padding()
            }
        }
    }
}

#Preview {
    StoryActView(act: Act.mocks[0])
}
