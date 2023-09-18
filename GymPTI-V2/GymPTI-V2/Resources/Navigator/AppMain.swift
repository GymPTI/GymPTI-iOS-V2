//
//  AppMain.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import Dependencies
import LinkNavigator

// MARK: - AppMain

@main
struct AppMain {
    
    @Dependency(\.sideEffect) var sideEffect
}

// MARK: App

extension AppMain {
    
    var navigator: LinkNavigator {
        sideEffect.linkNavigator as! LinkNavigator
    }
}

extension AppMain: App {
    
    var body: some Scene {
        
        WindowGroup {
            navigator
                .launch(paths: ["launch"], items: [:], prefersLargeTitles: false)
                .ignoresSafeArea(edges: .vertical)
        }
    }
}
