//
//  AllLecturersView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import SwiftUI

struct AllLecturersView<M: AllLecturersViewModel>: View {
    @ObservedObject var viewModel:M = AllLecturersViewModel(getLectureresUseCase: GetLecturersUseCase(catalogRepository: CatalogDefaultRepository())) as! M
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var searchWord: String = ""
    
    var body: some View {
//        ZStack {
//            AppColors.Primary.backGround
//                .ignoresSafeArea(.all)
            courses
                .onLoad {
                    viewModel.getLecturers(searchWord: "", page: 0)
                }
                .background(AppColors.Primary.backGround)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Lecturers")
                
//        }
    }
}

extension AllLecturersView {
    private var courses: some View {
        VStack {
        CommonSearchBar(searchText: $searchWord)
                .padding(.horizontal,12)
            Divider()
                .ignoresSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.lecturers, id: \.id) { lecturer in
                        LecturerCell(lecturer: lecturer)
                    }
                }
            }.padding(.horizontal,12)
            Spacer()
            }
        }
    }

#Preview {
    AllLecturersView()
}
