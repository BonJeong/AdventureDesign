//
//  ForkMain.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/31/24.
//

import SwiftUI

struct ForkMain: View {
    @State private var searchText = ""

    private let dishes = [
        ("삼겹살 구이", AnyView(KoreanStyleBacon())),
        ("돼지국밥", AnyView(View4())),
        ("제육볶음", AnyView(View4())),
        ("동파육", AnyView(View4())),
        ("감자탕", AnyView(View4())),
        ("돼지갈비", AnyView(View4())),
        ("탕수육", AnyView(View4())),
        ("족발", AnyView(View4())),
        ("돼지두루치기", AnyView(View4())),
        ("보쌈", AnyView(View4())),
        ("수육", AnyView(View4())),
        ("오삼불고기", AnyView(View4())),
        ("슈바인스학세", AnyView(View4())),
        ("햄버그 스테이크", AnyView(View4())),
        ("돈까스", AnyView(View4())),
        ("가츠동", AnyView(View4()))
    ]

    private var filteredDishes: [(String, AnyView)] {
        if searchText.isEmpty {
            return dishes
        } else {
            return dishes.filter { $0.0.contains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                TextField("요리 이름을 검색하세요", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                List {
                    ForEach(filteredDishes, id: \.0) { dish in
                        HStack {
                            Image(systemName: "circle")
                                .foregroundStyle(Color.pink)
                            NavigationLink(destination: dish.1) {
                                Text(dish.0)
                            }
                        }
                    }
                }
                .navigationTitle("돼지고기 요리")
            }
        }
    }
}

#Preview {
    ForkMain()
}
