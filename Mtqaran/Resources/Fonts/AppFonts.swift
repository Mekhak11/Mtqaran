//
//  AppFonts.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import SwiftUI

struct AppFonts {
    static let name = "Raleway-VariableFont_wght"
    
    struct Normal {
        static let xSmall = Font.custom(name, size: 10).weight(.regular)
        static let lightXSmall = Font.custom(name, size: 10).weight(.light)
        static let boldXSmall = Font.custom(name, size: 10).weight(.bold)
        
        static let small = Font.custom(name, size: 12).weight(.regular)
        static let lightSmall = Font.custom(name, size: 12).weight(.light)
        static let boldSmall = Font.custom(name, size: 12).weight(.bold)

        static let medium = Font.custom(name, size: 14).weight(.regular)
        static let lightMedium = Font.custom(name, size: 14).weight(.light)
        static let boldMedium = Font.custom(name, size: 14).weight(.bold)
        static let semiBoldMedium = Font.custom(name, size: 14).weight(.semibold)

        static let large = Font.custom(name, size: 16).weight(.regular)
        static let lightLarge = Font.custom(name, size: 16).weight(.light)
        static let boldLarge = Font.custom(name, size: 16).weight(.bold)

        static let xLarge = Font.custom(name, size: 18).weight(.regular)
        static let lightXLarge = Font.custom(name, size: 18).weight(.light)
        static let boldXLarge = Font.custom(name, size: 18).weight(.bold)

        static let xxLarge = Font.custom(name, size: 20).weight(.regular)
        static let lightXXLarge = Font.custom(name, size: 20).weight(.light)
        static let boldXXLarge = Font.custom(name, size: 20).weight(.bold)
        static let semiBoldXXLarge = Font.custom(name, size: 20).weight(.semibold)

    }
}
