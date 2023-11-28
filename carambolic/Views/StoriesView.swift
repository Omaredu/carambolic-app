//
//  StoriesView.swift
//  carambolic
//
//  Created by Omar Sánchez on 20/11/23.
//

import SwiftUI

struct StoriesView: View {
    @ObservedObject var service: StoriesService = StoriesService()
    @State private var search: String = ""
    @State private var selectedStory: Story?
    @State private var cardOffset: CGSize = .zero
    @Namespace private var animationNamespace
    
    let stories: [Story]
    
    init(stories: [Story] = []) {
        self.stories = stories
    }
    
    var body: some View {
        NavigationStack {
            List(service.stories) { story in
                StoryItemView(story: story, namespace: animationNamespace)
                    .onTapGesture {
                        withAnimation(.spring(duration: 0.4)) {
                            self.selectedStory = story
                        }
                    }
            }
            .listStyle(.plain)
            .navigationTitle("My Stories")
            .searchable(text: $search, prompt: "Search...")
        }
        .onAppear() {
            service.listStories()
        }
        .overlay {
            if let selectedStory = self.selectedStory {
                StoryView(story: selectedStory, onEnd: {
                    withAnimation {
                        self.selectedStory = nil
                        cardOffset = .zero
                    }
                })
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .matchedGeometryEffect(id: selectedStory.id, in: animationNamespace)
                    .padding()
                    .shadow(radius: 10)
                    .offset(cardOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let resistance: CGFloat = 0.4
                                cardOffset = CGSize(width: value.translation.width * resistance, height: value.translation.height * resistance)
                                if value.translation.height > 500 {
                                    withAnimation {
                                        self.selectedStory = nil
                                        cardOffset = .zero
                                    }
                                }
                            }
                            .onEnded { value in
                                if value.translation.height > 100{
                                    withAnimation {
                                        self.selectedStory = nil
                                        cardOffset = .zero
                                    }
                                } else {
                                    withAnimation {
                                        cardOffset = .zero
                                    }
                                }
                            }
                    )
                    .background(.thinMaterial)
            }
        }
    }
}

#Preview {
    StoriesView(stories: Story.mocks)
}
