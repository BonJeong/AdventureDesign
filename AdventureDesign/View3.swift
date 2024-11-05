
//
//  View3.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/29/24.
//

import SwiftUI

struct View3: View {
    @State private var searchText = ""  // 검색어 저장

    // 요리 항목 데이터
    private let dishes = [
        ("요리1", AnyView(View4())),
        ("요리2", AnyView(View4())),
        ("요리3", AnyView(View4())),
        ("요리4", AnyView(View4())),
        ("요리5", AnyView(View4())),
        ("요리6", AnyView(View4())),
        ("요리7", AnyView(View4())),
        ("요리8", AnyView(View4())),
        ("요리9", AnyView(View4())),
        ("요리10", AnyView(View4())),
        ("요리11", AnyView(View4())),
        ("요리12", AnyView(View4())),
        ("요리13", AnyView(View4())),
        ("요리14", AnyView(View4())),
        ("요리15", AnyView(View4())),
        ("요리16", AnyView(View4()))
    ]

    // 검색어에 맞는 요리 항목 필터링
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
                // 검색창
                TextField("요리 이름을 검색하세요", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // 필터링된 리스트
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
                .navigationTitle("... 요리")
            }
        }
    }
}

#Preview {
    View3()
}
