//
//  AllLecturesView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import SwiftUI

struct AllLecturesView<M: AllLecturesViewModel>: View {
    @ObservedObject var viewModel:M = AllLecturesViewModel(getLecturesUseCase: GetLecturesUseCase(catalogRepository: CatalogDefaultRepository())) as! M

    @State var searchWord: String = ""
    @State var isLectureDetails: Bool = false
    @StateObject var audioPlayer = AudioPlayerManager()
    
    var body: some View {
//        ZStack {
//            AppColors.Primary.backGround
//                .ignoresSafeArea(.all)
            categories
                .onLoad {
                    viewModel.getLectures(searchWord: "", page: 0)
                }
                .background(AppColors.Primary.backGround)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Lectures")
                
//        }
    }
}

extension AllLecturesView {
    private var categories: some View {
        VStack {
        CommonSearchBar(searchText: $searchWord)
                .padding(.horizontal,12)
            Divider()
                .ignoresSafeArea(.all)
            ScrollView {
               
                    ForEach(viewModel.lectures, id: \.id) { lecture in
                        NavigationLink(destination: LectureDetailsView<LectureDetailsViewModel>(id: lecture.id ?? 0), isActive: $isLectureDetails) {
                            Button {
                                isLectureDetails = true
                            } label: {
                                LectureCell(lecture: lecture,isPlayable: true, audioPlayer: audioPlayer)
                            }
                            
                        }
                }
            }.padding(.horizontal,12)
                .padding(.vertical,0)
            Spacer()
            }
        }
    }
    

#Preview {
    AllLecturesView()
}
