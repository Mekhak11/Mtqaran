//
//  AppColors.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation
import SwiftUI

struct AppColors {
    public struct Primary {
        public static var Orange: Color {
            return Color("app.orange")
        }
        
        public static var backGround: Color {
            return Color("app.background")
        }
    }
    public struct Secondary {
        public static var grey: Color {
            return Color("secondary.gray")
        }
        public static var dark: Color {
            return Color("secondary.dark")
        }
        public static var text: Color {
            return Color("secondary.text")
        }
        public static var lightGrey: Color {
            return Color("secondary.lightGray")
        }
    }
}
