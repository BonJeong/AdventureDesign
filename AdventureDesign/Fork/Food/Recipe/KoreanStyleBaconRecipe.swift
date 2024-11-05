//
//  KoreanStyleBaconRecipe.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/31/24.
//

import SwiftUI

struct KoreanStyleBaconRecipe: View {
    var body: some View {
        RecipeStepView(
            title: "1. 삼겹살 밑간하기",
            imageName: "KoreanStyleBaconR1",
            instruction: "준비된 후추와 소금을 삼겹살에 골고루 뿌려주세요.",
            timerDuration: 20,
            nextView: AnyView(KoreanStyleBaconRecipe2())
        )
    }
}

struct KoreanStyleBaconRecipe2: View {
    var body: some View {
        RecipeStepView(
            title: "2. 팬 예열하기",
            imageName: "KoreanStyleBaconR2",
            instruction: "팬을 센 불로 1분 동안 예열해주세요.",
            timerDuration: 60,
            nextView: AnyView(KoreanStyleBaconRecipe3())
        )
    }
}

struct KoreanStyleBaconRecipe3: View {
    var body: some View {
        RecipeStepView(
            title: "3. 굽기",
            imageName: "KoreanStyleBaconR3",
            instruction: "3분 동안 한 면을 구워주세요.",
            timerDuration: 180,
            nextView: AnyView(KoreanStyleBaconRecipe4())
        )
    }
}

struct KoreanStyleBaconRecipe4: View {
    var body: some View {
        RecipeStepView(
            title: "4. 뒤집기",
            imageName: "KoreanStyleBaconR4",
            instruction: "뒤집어 반대쪽을 4분 동안 구워주세요.",
            timerDuration: 240,
            nextView: AnyView(RecipeFinalStep())
        )
    }
}


#Preview {
    KoreanStyleBaconRecipe()
}
