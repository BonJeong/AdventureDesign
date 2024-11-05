//
//  KoreanStyleBacon.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/31/24.
//

import SwiftUI

struct KoreanStyleBacon: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Image("KoreanStyleBacon")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.teal, lineWidth: 3)
                            )
                        VStack(alignment: .leading) {
                            Text("삼겹살 구이")
                                .font(.system(size: 30))
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.bottom, 20)
                    
                    CustomSection(
                        title: "정보",
                        backgroundColor: .mint,
                        items: [
                            " - 칼로리 : 933kcal",
                            " - 탄수화물 : 1.4g",
                            " - 단백질 : 45.1g",
                            " - 지방 : 83.4g"
                        ]
                    )
                    
                    CustomSection(
                        title: "재료",
                        backgroundColor: .teal,
                        items: [
                            " 1. 삼겹살 200g(1인분)",
                            " 2. 후추",
                            " 3. 소금"
                        ]
                    )
                    
                    CustomSection(
                        title: "레시피",
                        backgroundColor: .pink,
                        items: [
                            " 1. 삼겹살 밑간하기",
                            " 2. 예열",
                            " 3. 굽기",
                            " 4. 뒤집기"
                        ]
                    )
                    
                    NavigationLink(destination: KoreanStyleBaconRecipe()) {
                        Text("요리 시작 버튼")
                    }
                    .frame(width: 200, height: 40)
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    KoreanStyleBacon()
}
