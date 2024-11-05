//
//  MainView.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/19/24.
//

import SwiftUI

struct MainView: View {
    @State private var isSearching = false
    @State private var searchText = ""
    @State private var isDoorOpen = false
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true

    var body: some View {
        ZStack {
            if isDoorOpen || !isFirstLaunch {
                NavigationStack {
                    ScrollView(.vertical) {
                        VStack {
                            if isSearching {
                                SearchView(searchText: $searchText)
                            } else {
                                MainMenuView()
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.teal)
                                .opacity(0.2)
                                .shadow(radius: 5)
                        )
                    }
                    .scrollIndicators(.hidden)
                    .navigationTitle("냉장고")
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                withAnimation {
                                    isSearching.toggle()
                                }
                            }) {
                                Image(systemName: "magnifyingglass") 
                            }
                        }
                    }
                }
                .transition(.opacity)
            } else {
                RefrigeratorDoorView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeOut(duration: 1.0)) {
                                isDoorOpen = true
                                isFirstLaunch = false
                            }
                        }
                    }
            }
        }
    }
}

struct RefrigeratorDoorView: View {
    @State private var doorAngle: Double = 0

    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "refrigerator.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                
                Text("냉장고를 여는 중...")
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
            .rotation3DEffect(
                .degrees(doorAngle),
                axis: (x: 0, y: 1, z: 0)
            )
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    doorAngle = -90
                }
            }
        }
    }
}


struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            TextField("재료 이름을 입력하세요", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            if let destination = destinationView(for: searchText) {
                NavigationLink(destination: destination) {
                    Text("\(searchText)로 이동")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding()
            } else if !searchText.isEmpty {
                Text("일치하는 재료가 없습니다.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
    
    func destinationView(for text: String) -> AnyView? {
        switch text.lowercased() {
        case "돼지고기":
            return AnyView(ForkMain())
        case "소고기":
            return AnyView(View3())
        case "닭고기":
            return AnyView(View3())
        case "오리고기":
            return AnyView(View3())
        case "양고기":
            return AnyView(View3())
        case "계란":
            return AnyView(View3())
        case "두부":
            return AnyView(View3())
        case "조개":
            return AnyView(View3())
        case "빵":
            return AnyView(View3())
        case "연어":
            return AnyView(View3())
        case "갈치":
            return AnyView(View3())
        case "전복":
            return AnyView(View3())
        case "어묵":
            return AnyView(View3())
        case "김치":
            return AnyView(View3())
        case "떡":
            return AnyView(View3())
        case "고추장":
            return AnyView(View3())
        case "된장":
            return AnyView(View3())
        case "쌈장":
            return AnyView(View3())
        case "오징어":
            return AnyView(View3())
        case "콩나물":
            return AnyView(View3())
        case "시금치":
            return AnyView(View3())
        case "소면":
            return AnyView(View3())
        default:
            return nil
        }
    }
}

struct MainMenuView: View {
    var body: some View {
        VStack {
            MenuRow(items: [
                MenuItem(name: "돼지고기", image: "Pork", destination: AnyView(ForkMain())),
                MenuItem(name: "소고기", image: "Beef", destination: AnyView(View3())),
                MenuItem(name: "닭고기", image: "Chicken", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "오리고기", image: "Duck", destination: AnyView(View3())),
                MenuItem(name: "양고기", image: "LambMutton", destination: AnyView(View3())),
                MenuItem(name: "계란", image: "Egg", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "두부", image: "Tofu", destination: AnyView(View3())),
                MenuItem(name: "조개", image: "Bivalvia", destination: AnyView(View3())),
                MenuItem(name: "빵", image: "Bread", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "연어", image: "Salmon", destination: AnyView(View3())),
                MenuItem(name: "갈치", image: "LargeheadHairtail", destination: AnyView(View3())),
                MenuItem(name: "전복", image: "Abalone", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "어묵", image: "FishCake", destination: AnyView(View3())),
                MenuItem(name: "김치", image: "Kimchi", destination: AnyView(View3())),
                MenuItem(name: "떡", image: "RiceCake", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "고추장", image: "Gochujang", destination: AnyView(View3())),
                MenuItem(name: "된장", image: "Doenjang", destination: AnyView(View3())),
                MenuItem(name: "쌈장", image: "Ssamjang", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "오징어", image: "Squid", destination: AnyView(View3())),
                MenuItem(name: "콩나물", image: "SoybeanSprout", destination: AnyView(View3())),
                MenuItem(name: "시금치", image: "Spinach", destination: AnyView(View3()))
            ])
            
            MenuRow(items: [
                MenuItem(name: "소면", image: "Noodles", destination: AnyView(View3()))
            ])
        }
    }
}

struct MenuRow: View {
    let items: [MenuItem]
    
    var body: some View {
        HStack {
            ForEach(items, id: \.name) { item in
                NavigationLink(destination: item.destination) {
                    VStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                        Text(item.name)
                            .font(.system(size: 20))
                    }
                }
                .padding(.horizontal, 5)
            }
        }
        .padding(.vertical, 10)
    }
}

struct MenuItem {
    let name: String
    let image: String
    let destination: AnyView
}

#Preview {
    MainView()
}
