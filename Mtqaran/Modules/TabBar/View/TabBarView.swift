//
//  TabBarView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 11.09.24.
//

import SwiftUI
import Combine

struct TabBarView: View {
    
    
    @State var activeTab: TabItem = .catalog
    @State var cancelables = Set<AnyCancellable>()
    
    var body: some View {
        tabView
            .onLoad {
                configureTabbar()
            }
    }
}

// MARK: - Components

private extension TabBarView {
    
    private var tabView: some View {
        TabView(selection: $activeTab) {
            catalogTab
                .tabItem { TabViewTab(activeTab: $activeTab, tab: .catalog) }
                .tag(TabItem.catalog)
            
            coursesTab
                .tabItem { TabViewTab(activeTab: $activeTab, tab: .myCourses) }
                .tag(TabItem.myCourses)
            
            profileTab
                .tabItem { TabViewTab(activeTab: $activeTab, tab: .profile) }
                .tag(TabItem.profile)
        }
    }
//    
    private func configureTabbar() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
}




// MARK: - Tabs

private extension TabBarView {
    
    var catalogTab: some View {
        NavigationView {
                CatalogView<CatalogViewModel>()
            }
        .navigationViewStyle(.stack)
    }
    
    var coursesTab: some View {
        NavigationView {
                Text("Courses")
        }
        .navigationViewStyle(.stack)
        
    }
    
    var profileTab: some View {
        NavigationView {
            Text("Profile")
        }.navigationViewStyle(.stack)
    }
    
}
#Preview {
    TabBarView()
}
