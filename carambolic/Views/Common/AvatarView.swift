//
//  AvatarView.swift
//  carambolic
//
//  Created by Omar Sánchez on 20/11/23.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        Image("Avatar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 32, height: 32)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AvatarView()
}
