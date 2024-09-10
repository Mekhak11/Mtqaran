//
//  LectureDetailsView.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 10.09.24.
//

import SwiftUI

struct LectureDetailsView<M: LectureDetailsViewModeling>: View {
    var id: Int
    @ObservedObject var viewModel:M = LectureDetailsViewModel(getLectureDetailsUseCase: GetLectureDetailsUseCase(catalogRepository: CatalogDefaultRepository())) as! M
    var audioPlayer = AudioPlayerManager()
    @State var isPlaying: Bool = false
    @State private var option: ViewOptions = .info
    @State var isLectureDetails: Bool = false
    
    
    var body: some View {
        content
            .background(AppColors.Primary.backGround)
            .onLoad {
                viewModel.getLectureDetails(id: id)
            }
    }
}

extension LectureDetailsView {
    
    private var content: some View {
        ScrollView {
            VStack {
                image
                header
                picker
                Spacer()
                switch option {
                case .info:
                    infoView
                case .files:
                    fileView
                case .tests:
                    testView
                case .reviews:
                    reviews
                }
            }.padding(12)
        }
    }
    
    private var image: some View {
        ZStack {
            RemoteImageView(urlString: viewModel.lecture?.image ?? "", width: 120, height: 120, cornerRadius: 16)
                .frame(maxWidth: .infinity, maxHeight: 150)
            player
            
        }
    }
    
    private var player: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    DispatchQueue.main.async {
                        if isPlaying {
                            audioPlayer.stop()
                            isPlaying = false
                        } else {
                            audioPlayer.setupPlayer(with: viewModel.lecture?.voice ?? "")
                            audioPlayer.play()
                            isPlaying = true
                        }
                    }
                 
                } label: {
                    if audioPlayer.isPlaying {
                        Image("icon.pause")
                    } else {
                        Image("icon.play")
                    }
                }
                ProgressView(value: audioPlayer.currentTime, total: audioPlayer.duration)
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(.black)
                Text(viewModel.lecture?.voice_duration ?? "0:00")
                    .foregroundStyle(Color.black)
                    .font(AppFonts.Normal.medium)
                    
            }
        }
    }
    private var likeSection: some View {
        HStack(spacing: 6) {
            HStack(spacing: 3) {
                Image("details.like")
                    .padding(.leading,2)
//                    .resizable()
//                    .frame()
                Text("\(viewModel.lecture?.like ?? 0)")
                    .font(AppFonts.Normal.medium)
                    .foregroundStyle(AppColors.Secondary.dark)
            }.padding(4)
            Divider()
            HStack(spacing: 3) {
                Image("details.disLike")
//                    .resizable()
                Text("\(viewModel.lecture?.dislike ?? 0)")
                    .font(AppFonts.Normal.medium)
                    .foregroundStyle(AppColors.Secondary.dark)
                    .padding(.trailing,2)
            }.padding(4)
        }.background(AppColors.Secondary.lightGrey)
            .cornerRadius(15)
    }
    
    private var header: some View {
        HStack {
            Text("\(viewModel.lecture?.views ?? 0) views")
                .foregroundStyle(AppColors.Secondary.dark)
                .font(AppFonts.Normal.small)
            Spacer()
            Text("\(viewModel.lecture?.date ?? "") ago")
                .foregroundStyle(AppColors.Secondary.dark)
                .font(AppFonts.Normal.small)
            Spacer()
            likeSection
            Spacer()
            ZStack {
                Image("icon.save")
                    .padding(4)
                    
            }.background(AppColors.Secondary.lightGrey)
            .cornerRadius(15)
        }
    }
    
    private var picker: some View {
        Picker( "", selection: $option) {
            Text("Info").tag(ViewOptions.info)
            Text("Files").tag(ViewOptions.files)
            Text("Tests").tag(ViewOptions.tests)
            Text("Reviews").tag(ViewOptions.reviews)
        }
        .pickerStyle(.segmented)
        .background(AppColors.Primary.Orange.opacity(0.36))
    }
    
    private enum ViewOptions: String, CaseIterable {
        case info = "Info", files = "Files", tests = "Tests", reviews = "Reviews"
    }
    
    private var infoView: some View {
        
        VStack {
            HStack {
                Text(viewModel.lecture?.desc ?? "")
                    .font(AppFonts.Normal.medium)
                    .foregroundStyle(Color.gray)
                Spacer()
            }
            HStack {
                
                Text("Teacher - \(viewModel.lecture?.teacher?.name ?? "")")
                    .underline(color: AppColors.Primary.Orange)
                    .font(AppFonts.Normal.small)
                    .foregroundStyle(AppColors.Primary.Orange)
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("Next Lectures")
                    Spacer()
                }
                ScrollView {
                    ForEach(viewModel.lecture?.lessons ?? [], id: \.id) { lecture in
                        NavigationLink(destination: LectureDetailsView<LectureDetailsViewModel>(id: lecture.id ?? 0), isActive: $isLectureDetails) {
                            Button {
                                isLectureDetails = true
                            } label: {
                                LectureCell(lecture: lecture,isPlayable: true, audioPlayer: audioPlayer)

                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    private var fileView: some View {
        VStack {
            Text(viewModel.lecture?.desc ?? "")
                .font(AppFonts.Normal.medium)
                .foregroundStyle(Color.gray)
            Text("Teacher - \(viewModel.lecture?.teacher?.name ?? "")")
                .underline(color: AppColors.Primary.Orange)
                .font(AppFonts.Normal.small)
                .foregroundStyle(AppColors.Primary.Orange)
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                ForEach(viewModel.lecture?.files ?? [], id: \.self) { file in
                    RemoteImageView(urlString: file, width: 77, height: 77, cornerRadius: 8)
                }
            }
        }
    }
    
    private var testView: some View {
        VStack {
            Spacer()
            CommonButton(title: "Start Test")
        }
    }
    
    private var reviews: some View {
        Text("Reviews")
    }
}
