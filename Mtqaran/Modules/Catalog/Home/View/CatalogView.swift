//
//  CatalogView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import SwiftUI

struct CatalogView<M: CatalogViewModeling>: View {
    @ObservedObject var viewModel:M = CatalogViewModel(getCatalogUseCase: GetCatalogUseCase(catalogRepository: CatalogDefaultRepository() )) as! M
    
    
    
    @State var searchViewActivated: Bool = false
    @State var isAllCategories: Bool = false
    @State var isAllCourses: Bool = false
    
    @State var isCourseDetails: Bool = false
    
    var body: some View {
//        NavigationView {
            
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }else {
                    VStack(spacing: 16) {
                        searchBar
                        Divider()
                        categories
                        courses
                        Spacer()
                    }
                    .background(Color.clear)
                    .padding(.horizontal,18)
                    .padding(.vertical,0)
                    
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Mtqaran")
                                .font(.title)
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            Image("app.icon")
                        }
                    }
                }
            }
            .padding(0)
            .background(AppColors.Primary.backGround)
            .background(ignoresSafeAreaEdges: .all)
            .onLoad {
                viewModel.getCatalog()
            }
            
     
        }
    }


extension CatalogView {
    
    
    private var searchBar: some View {
        NavigationLink(destination: GlobalSearchView<GlobalSearchViewModel>(), isActive: $searchViewActivated) {
            Button {
                searchViewActivated = true
            } label: {
                CommonSearchBar(searchText: .constant(""), disabled: true)
            }
        }.padding(.top, -20)
    }
    
    private var categories: some View {
        VStack(spacing: 15) {
            categoryLabel
            categoryList
        }
    }
    
    //TODO: - Need to make a logic of is filled later:):):)
    
    private var categoryList: some View {
        ScrollView(.horizontal) {
             HStack {
                 ForEach(viewModel.catalogItems.categories ?? [], id: \.id) { item in
                     CategoryCell(isFilled: true , model: item)
                 }
            }
        }
    }
    
    private var categoryLabel: some View {
        HStack {
            Text("Categories")
                .font(AppFonts.Normal.semiBoldXXLarge)
                .foregroundStyle(Color.black)
            Spacer()
            NavigationLink(destination: AllCategoriesView(), isActive: $isAllCategories) {
                Button {
                    isAllCategories = true
                } label: {
                    Text("See all")
                        .font(AppFonts.Normal.medium)
                        .foregroundStyle(AppColors.Primary.Orange)
                }
            }
        }
    }
    
    private var courses: some View {
        VStack(spacing: 15) {
            couresLabel
            courseList
        }
    }
    
    private var courseList: some View {
        ScrollView(.horizontal) {
             HStack {
                 ForEach(viewModel.catalogItems.courses ?? [], id: \.id) { item in
                     NavigationLink(destination: CourseDetailsView<CourseDetailsViewModel>(id: item.id ?? 0), isActive: $isCourseDetails) {
                         Button {
                             isCourseDetails = true
                         } label: {
                             CourseCell(course: item,isTaken: true)
                             
                         }
                     }
                 }
            }
        }
    }
    
    private var couresLabel: some View {
        HStack {
            Text("Courses")
                .font(AppFonts.Normal.semiBoldXXLarge)
                .foregroundStyle(Color.black)
            Spacer()
            
            NavigationLink(destination: AllCoursesView<AllCoursesViewModel>(), isActive: $isAllCourses) {
                Button {
                    isAllCourses = true
                } label: {
                    Text("See all")
                        .font(AppFonts.Normal.medium)
                        .foregroundStyle(AppColors.Primary.Orange)
                }
            }
        }
    }
    
}

#Preview {
    CatalogView<CatalogViewModel>()
}
