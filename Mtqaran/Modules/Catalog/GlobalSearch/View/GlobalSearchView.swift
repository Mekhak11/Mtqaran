//
//  GlobalSearchView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import SwiftUI

struct GlobalSearchView<M: GlobalSearchViewModeling>: View {
    @ObservedObject var viewModel: M = GlobalSearchViewModel(globalSearchUseCase: GlobalSearchUseCase(catalogRepository: CatalogDefaultRepository())) as! M
    
    @State var searchText: String = ""
    
    @State var isAllCourses: Bool = false
    @State var isAllLecturers: Bool = false
    @State var isAllLectures: Bool = false
    
    @State var isCourseDetails: Bool = false
    @State var isLectureDetails: Bool = false
    
    @StateObject var audioPLayer = AudioPlayerManager()
    
    var body: some View {
        content
            .padding(.horizontal,14)
            .padding(.bottom, 0)
            .padding(.top, 0)
            .background(AppColors.Primary.backGround)
            .onLoad {
                viewModel.globalSearch(searchWord: "")
            }
            .onChange(of: searchText) { _ in
                viewModel.globalSearch(searchWord: searchText)
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
    }
}

extension GlobalSearchView {
    
    private var search: some View {
        HStack {
            CommonSearchBar(searchText: $searchText)
            Image("icon.filter")
                .resizable()
                .frame(width: 20,height: 20)
        }
    }
    
    private var content: some View {
        VStack {
            search
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24)  {
                    users
                    lecturerContent
                    courseContnet
                    lessonContent
                    Spacer()
                }
            }
//            Spacer()
        }
    }
    
    private var userConent: some View {
        VStack(spacing: 14) {
            userLabel
            users
        }
    }
    private var lecturerContent: some View {
        VStack(spacing: 14) {
            lecturerLabel
            lecturers
        }
    }
    private var lessonContent: some View {
        VStack(spacing: 14) {
            lessonLabel
            lessons
            
        }
    }
    private var courseContnet: some View {
        VStack(spacing: 14) {
            couresLabel
            courses
        }
    }
    
    
    private var lecturerLabel: some View {
        HStack {
            Text("Lecturers")
                .font(AppFonts.Normal.semiBoldXXLarge)
                .foregroundStyle(Color.black)
            
            Spacer()
            NavigationLink(destination: AllLecturersView(), isActive: $isAllLecturers)  {
                Button {
                    isAllLecturers = true
                } label: {
                    Text("See all")
                        .font(AppFonts.Normal.medium)
                        .foregroundStyle(AppColors.Primary.Orange)
                }
            }
        }
    }
    
    private var lecturers: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.searchResult.teachers ?? [] , id: \.id) { item in
                    LecturerCell(lecturer: item)
                }
            }
        }
    }
    private var userLabel: some View {
        HStack {
            Text("Users")
                .font(AppFonts.Normal.semiBoldXXLarge)
                .foregroundStyle(Color.black)
            Spacer()
            Button {
                print()
            } label: {
                Text("See all")
                    .font(AppFonts.Normal.medium)
                    .foregroundStyle(AppColors.Primary.Orange)
            }
        }
    }
    private var users: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.searchResult.users ?? [] , id: \.id) { item in
                    UserCell(user: item)
                }
            }
        }
    }
    private var couresLabel: some View {
        HStack {
            Text("Categories")
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
    
    private var courses: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.searchResult.courses ?? [] , id: \.id) { item in
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
    private var lessonLabel: some View {
        HStack {
            Text("Lectures")
                .font(AppFonts.Normal.semiBoldXXLarge)
                .foregroundStyle(Color.black)
            Spacer()
            NavigationLink(destination: AllLecturesView(), isActive: $isAllLectures) {
                Button {
                    isAllLectures = true
                } label: {
                    Text("See all")
                        .font(AppFonts.Normal.medium)
                        .foregroundStyle(AppColors.Primary.Orange)
                }
            }
        }
    }
    
    private var lessons: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.searchResult.lessons ?? [] , id: \.id) { lecture in
                    NavigationLink(destination: LectureDetailsView<LectureDetailsViewModel>(id: lecture.id ?? 0), isActive: $isLectureDetails) {
                        Button {
                            isLectureDetails = true
                        } label: {
                            LectureCell(lecture: lecture,isPlayable: true, audioPlayer: audioPLayer)
                        }
                        
                    }
                }
            }
        }
    }
    
    
}

#Preview {
    GlobalSearchView<GlobalSearchViewModel>()
}
