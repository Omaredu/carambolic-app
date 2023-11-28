//
//  ProgressBarView.swift
//  carambolic
//
//  Created by Omar Sánchez on 25/11/23.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .background(.thickMaterial)
                Rectangle().frame(width: min(CGFloat(self.progress)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 45))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProgressBarView(progress: .constant(0.1))
        .frame(height: 10)
}
