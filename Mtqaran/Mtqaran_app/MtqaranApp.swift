//
//  MtqaranApp.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import SwiftUI

@main
struct MtqaranApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .navigationViewStyle(.stack)
                .onAppear(perform: {
                    let navigationBarAppearance = UINavigationBarAppearance()
                    let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
                    backButtonAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
                    backButtonAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
                    backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
                    backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
                    navigationBarAppearance.backButtonAppearance = backButtonAppearance
                    let titleFont = UIFont(name: "Raleway-VariableFont_wght", size: 18) ?? UIFont.systemFont(ofSize: 18) // Change to your desired font and size
                    navigationBarAppearance.titleTextAttributes = [
                        .foregroundColor: UIColor.black, // Change to your desired color
                        .font: titleFont
                    ]
                    
                    UIBarButtonItem.appearance().tintColor = .black
                    UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.backward")
                    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.backward")
                    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                })
            
        }
    }
}
