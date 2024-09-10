//
//  AllCategoriesView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import SwiftUI

struct AllCategoriesView<M: AllCategoriesViewModel>: View {
    @ObservedObject var viewModel:M = AllCategoriesViewModel(getCategoriesUseCase: GetCategoriesUseCase(catalogRepository: CatalogDefaultRepository())) as! M
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var searchWord: String = ""
    
    var body: some View {
//        ZStack {
//            AppColors.Primary.backGround
//                .ignoresSafeArea(.all)
            categories
                .onLoad {
                    viewModel.getCategories(searchWord: "", page: 0)
                }
                .background(AppColors.Primary.backGround)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Categories")
                
//        }
    }
}

extension AllCategoriesView {
    private var categories: some View {
        VStack {
        CommonSearchBar(searchText: $searchWord)
                .padding(.horizontal,12)
            Divider()
                .ignoresSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.categories, id: \.id) { category in
                       CategoryCell(isFilled: false, model: category)
                    }
                }
            }.padding(.horizontal,12)
            Spacer()
            }
        }
    }
    




#Preview {
    AllCategoriesView()
}
