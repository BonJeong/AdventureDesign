//
//  KoreanStyleBacon.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/31/24.
//

import SwiftUI

struct View4: View {
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
                                    .stroke(Color.teal,
                                            lineWidth: 3)
                            )
                        VStack(alignment: .leading) {
                            Text("...")
                                .font(.system(size: 30))
                        }
                        .padding(.leading, 20)
                        
                    }
                    .padding(.bottom, 20)
                    VStack(alignment: . leading, spacing: 10) {
                        Text("정보")
                            .font(.system(size: 20))
                            .bold()
                        Divider()
                        Text(" - 칼로리 : ...")
                        Text(" - 탄수화물 : ...")
                        Text(" - 단백질 : ...")
                        Text(" - 지방 : ...")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.mint)
                            .opacity(0.2)
                            .shadow(radius: 5)
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        Text("재료")
                            .font(.system(size: 20))
                            .bold()
                        Divider()
                        HStack(alignment: .top, spacing: 30) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(" 1. ...")
                                Text(" 2. ...")
                                Text(" 3. ...")
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.teal)
                            .opacity(0.2)
                            .shadow(radius: 5)
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        Text("레시피")
                            .font(.system(size: 20))
                            .bold()
                        Divider()
                        HStack(alignment: .top, spacing: 30) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(" 1. ...")
                                Text(" 2. ...")
                                Text(" 3. ...")
                                Text(" 4. ...")
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.pink)
                            .opacity(0.2)
                            .shadow(radius: 5)
                    )
                    
                    NavigationLink(destination: View5()) {
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

struct ImageDog: View {
    var ImageName: String
    var borderColor: Color
    
    var body: some View {
        Image(ImageName)
            .resizable()
            .frame(width: 160, height: 160)
            .overlay(
                Rectangle()
                    .stroke(borderColor, lineWidth: 4)
            )
    }
}

#Preview {
    View4()
}
