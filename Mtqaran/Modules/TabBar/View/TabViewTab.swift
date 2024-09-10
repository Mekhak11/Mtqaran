//
//  TabViewTab.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 11.09.24.
//

import SwiftUI

struct TabViewTab: View {
    
    @Binding var activeTab: TabItem
    var tab: TabItem
    
    var body: some View {
        activeTab == tab ? tab.selectedImage : tab.unselectedImage
    }
}


// MARK: - Preview
#Preview {
    TabViewTab(activeTab: .constant(.catalog), tab: .catalog)
}
