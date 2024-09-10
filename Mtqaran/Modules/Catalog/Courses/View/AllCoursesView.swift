//
//  AllCoursesView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import SwiftUI

struct AllCoursesView<M: AllCoursesViewModel>: View {
    @ObservedObject var viewModel:M = AllCoursesViewModel(getCoursesUseCase: GetCoursesUseCase(catalogRepository: CatalogDefaultRepository())) as! M
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var searchWord: String = ""
    
    @State var isCourseDetails: Bool = false
    
    var body: some View {
//        ZStack {
//            AppColors.Primary.backGround
//                .ignoresSafeArea(.all)
            courses
                .onLoad {
                    viewModel.getCourses(searchWord: "", page: 0)
                }
                .background(AppColors.Primary.backGround)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Courses")
                
//        }
    }
}

extension AllCoursesView {
    private var courses: some View {
        VStack {
        CommonSearchBar(searchText: $searchWord)
                .padding(.horizontal,12)
            Divider()
                .ignoresSafeArea(.all)
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.courses, id: \.id) { course in
                        NavigationLink(destination: CourseDetailsView<CourseDetailsViewModel>(id: course.id ?? 0), isActive: $isCourseDetails) {
                            Button {
                                isCourseDetails = true
                            } label: {
                                CourseCell(course: course, isTaken: true)
                            }
                           
                        }
                    }
                }
            }.padding(.horizontal,12)
            Spacer()
            }
        }
    }
    




#Preview {
    AllCoursesView()
}
