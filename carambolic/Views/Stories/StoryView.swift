//
//  StoryView.swift
//  carambolic
//
//  Created by Omar Sánchez on 25/11/23.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    @State private var currentAct: Int = 0
    @State private var currentActProgress: Float = 0.0
    @State private var storyLoaded = false
    let onEnd: () -> Void
    
    init(story: Story, onEnd: @escaping () -> Void = {}) {
        self.story = story
        self.onEnd = onEnd
    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            HStack {
                StoryActView(act: story.acts[currentAct], zoom: $currentActProgress, onLoad: {
                    storyLoaded = true
                })
            }
            .clipped()
            .onChange(of: currentAct) {
                storyLoaded = false
            }

            VStack {
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: 100)
                Spacer()
            }
            .clipped()
            
            VStack {
                HStack {
                    ForEach(Array(story.acts.enumerated()), id: \.element) { index, act in
                        ProgressBarView(progress: index == currentAct 
                                        ? $currentActProgress : index < currentAct
                                        ? .constant(1) : .constant(0))
                    }
                }
                .frame(height: 3)
                .padding()
                Spacer()
            }
            .onReceive(timer) { _ in
                if currentActProgress >= 1.0 {
                    showNextStory()
                }
                withAnimation {
                    if storyLoaded {
                        currentActProgress += 1.0 / 100.0
                    }
                }
            }
            
            HStack {
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showPreviousStory()
                    }
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showNextStory()
                    }
            }
        }
    }
    
    func showNextStory() {
        withAnimation {
            currentActProgress = 0
        }
        currentAct += 1
        if currentAct >= story.acts.count {
            currentAct = 0
            onEnd()
        }
    }
    
    func showPreviousStory() {
        withAnimation {
            currentActProgress = 0
        }
        currentAct -= 1
        if currentAct <= 0 {
            currentAct = 0
        }
    }
}

#Preview {
    StoryView(story: Story.mocks[1])
}
