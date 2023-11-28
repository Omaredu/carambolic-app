//
//  BookmarkCheck.swift
//  carambolic
//
//  Created by Omar Sánchez on 26/11/23.
//

import SwiftUI

struct BookmarkCheckView: View {
    let checked: Bool
    
    init(_ checked: Bool = false) {
        self.checked = checked
    }
    
    var body: some View {
        Image(systemName: checked ? "checkmark.circle.fill" : "exclamationmark.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(checked ? .blue : .red)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BookmarkCheckView()
        .frame(width: 30)
}
