//
//  TabItem.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 11.09.24.
//

import Foundation
import SwiftUI

enum TabItem: Int, Codable, CaseIterable {
    
    case catalog = 1
    case myCourses = 2
    case profile = 3
    
    var selectedImage: Image {
        switch self {

        case .catalog:
            return Image("catalog.selected")
        case .myCourses:
            return Image("courses.selected")
            
        case .profile:
            return Image("courses.selected")
        }
    }
    
    var unselectedImage: Image {
        switch self {
        case .catalog:
            return Image("catalog.unselected")
        case .myCourses:
            return Image("courses.unselected")
        case .profile:
            return Image("courses.unselected")
        }
    }
}
