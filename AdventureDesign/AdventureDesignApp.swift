//
//  AdventureDesignApp.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/19/24.
//

import SwiftUI

@main
struct AdventureDesignApp: App {
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true

    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    if !isFirstLaunch {
                        DispatchQueue.main.async {
                            isFirstLaunch = true
                        }
                    }
                }
        }
    }
}
