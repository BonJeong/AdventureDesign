//
//  CustomSection.swift
//  AdventureDesign
//
//  Created by 구본정 on 11/5/24.
//

import SwiftUI

struct CustomSection: View {
    let title: String
    let backgroundColor: Color
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 20))
                .bold()
            Divider()
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(backgroundColor)
                .opacity(0.2)
                .shadow(radius: 5)
        )
    }
}
