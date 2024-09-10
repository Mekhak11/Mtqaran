//
//  CourseDetailsView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import SwiftUI

struct CourseDetailsView<M: CourseDetailsViewModeling>: View {
    @ObservedObject var viewModel: M = CourseDetailsViewModel(getCourseDetailsUseCase: GetCourseDetailsUseCase(catalogRepository: CatalogDefaultRepository())) as! M
    
    @State private var option: ViewOptions = .lectures
    let id: Int
    
    @StateObject var audioPlayer = AudioPlayerManager()
    
    @State var isLecureDetails:Bool = false
    
    var body: some View {
        content
            .background(AppColors.Primary.backGround)
            .onLoad {
                viewModel.getCourseDetails(id: id)
            }
    }
}

extension CourseDetailsView {
    
    private var content: some View {
        
        VStack(spacing: 20)  {
            ScrollView {
                image
                Spacer()
                header
                Spacer()
                subHeader
                Spacer()
                picker
                Spacer()
                switch option {
                case .info:
                    infoView
                case .lectures:
                    lecturesView
                case .tests:
                    testView
                }
            }.padding(.horizontal, 16)
                .padding(.top, 12)
        }
    }
    
    private var image: some View {
        RemoteImageView(urlString: viewModel.course?.image ?? "", width: 340, height: 136, cornerRadius: 8)
    }
    
    private var name: some View {
        Text(viewModel.course?.name ?? "")
            .underline(color: AppColors.Primary.Orange)
            .font(AppFonts.Normal.boldLarge)
            .foregroundStyle(AppColors.Primary.Orange)
        
    }
    
    private var likeSection: some View {
        HStack(spacing: 6) {
            HStack(spacing: 3) {
                Image("details.like")
                    .padding(.leading,2)
                //                    .resizable()
                //                    .frame()
                Text("\(viewModel.course?.like ?? 0)")
                    .font(AppFonts.Normal.medium)
                    .foregroundStyle(AppColors.Secondary.dark)
            }.padding(4)
            Divider()
            HStack(spacing: 3) {
                Image("details.disLike")
                //                    .resizable()
                Text("\(viewModel.course?.dislike ?? 0)")
                    .font(AppFonts.Normal.medium)
                    .foregroundStyle(AppColors.Secondary.dark)
                    .padding(.trailing,2)
            }.padding(4)
        }.background(AppColors.Secondary.lightGrey)
            .cornerRadius(15)
    }
    
    private var saveButton: some View {
        ZStack {
            Image("icon.save")
                .padding(4)
            
        }.background(AppColors.Secondary.lightGrey)
            .cornerRadius(15)
        
    }
    
    private var header: some View {
        HStack(spacing: 12) {
            name
            Spacer()
            likeSection
            saveButton
        }
    }
    
    private var desc: some View {
        Text(viewModel.course?.desc ?? "")
            .font(AppFonts.Normal.medium)
            .foregroundStyle(Color.black)
    }
    
    private var lectures: some View {
        HStack(spacing: 5) {
            Image(systemName: "graduationcap")
            Text("\(viewModel.course?.lessons_count ?? 0) lectures")
                .font(AppFonts.Normal.small)
        }
    }
    
    private var lecturerName: some View {
        Text(viewModel.course?.teacher?.name ?? "")
            .font(AppFonts.Normal.small)
            .foregroundStyle(AppColors.Secondary.text)
    }
    
    private var subHeader: some View {
        HStack {
            VStack(spacing: 4) {
                lectures
                lecturerName
            }
            Spacer()
            RoundedProgressBar(percentage: Double(viewModel.course?.percent ?? 0))
                .frame(width: 40,height: 40)
                .padding(10)
        }
    }
    
    private var infoView: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.course?.teacher?.name ?? "")
                        .font(AppFonts.Normal.boldXLarge)
                    
                    Text(viewModel.course?.teacher?.desc ?? "")
                        .font(AppFonts.Normal.medium)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                Spacer()
                
                RemoteImageView(urlString: viewModel.course?.teacher?.image ?? "", width: 120, height: 100, cornerRadius: 8)
            }
            Spacer()
            CommonButton(action: {
                print("Start")
            }, title: "Start")
        }
    }
    
    private var lecturesView: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.course?.lessons ?? [], id: \.id) { lecture in
                    NavigationLink(destination: LectureDetailsView<LectureDetailsViewModel>(id: lecture.id ?? 0), isActive: $isLecureDetails) {
                        Button {
                            isLecureDetails = true
                        } label: {
                            LectureCell(lecture: lecture,isPlayable: true, audioPlayer: audioPlayer)
                        }
                        
                    }
                  }
                }
            }
        }
    
    
    private var testView: some View {
        Text("Tests")
    }
    
    private var bottomView: some View {
        ZStack {
            
        }
    }
    
    private var picker: some View {
        Picker( "", selection: $option) {
            Text("Info").tag(ViewOptions.info)
            Text("Lectures").tag(ViewOptions.lectures)
            Text("Tests").tag(ViewOptions.tests)
        }
        .pickerStyle(.segmented)
        .background(AppColors.Primary.Orange.opacity(0.36))
    }
    
    private enum ViewOptions: String, CaseIterable {
        case info = "Info", lectures = "Lectures", tests = "Tests"
    }
    
}
