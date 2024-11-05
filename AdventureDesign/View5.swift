//
//  KoreanStyleBaconRecipe.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/31/24.
//

import SwiftUI

struct View5: View {
    var body: some View {
        RecipeStepView(
            title: "1. ...",
            imageName: "KoreanStyleBaconR1",
            instruction: "테스트",
            timerDuration: 5,
            nextView: AnyView(View5_2())
        )
    }
}

struct View5_2: View {
    var body: some View {
        RecipeStepView(
            title: "2. ...",
            imageName: "KoreanStyleBaconR2",
            instruction: "테스트2",
            timerDuration: 10,
            nextView: AnyView(View5_3())
        )
    }
}

struct View5_3: View {
    var body: some View {
        RecipeStepView(
            title: "3. ...",
            imageName: "KoreanStyleBaconR3",
            instruction: "테스트3",
            timerDuration: 180,
            nextView: AnyView(View5_4())
        )
    }
}

struct View5_4: View {
    var body: some View {
        RecipeStepView(
            title: "4. ...",
            imageName: "KoreanStyleBaconR4",
            instruction: "테스트4",
            timerDuration: 240,
            nextView: AnyView(RecipeFinalStep())
        )
    }
}


#Preview {
    View5()
}
