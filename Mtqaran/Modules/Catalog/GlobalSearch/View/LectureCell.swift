//
//  LectureCell.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import SwiftUI

struct LectureCell: View {
    @State var lecture: LectureDTO
    @State var isPlayable: Bool
    
    @StateObject  var audioPlayer: AudioPlayerManager
    
    @State var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
            HStack(alignment: .top) {
                    ZStack {
                        RemoteImageView(urlString: lecture.image ?? "", width: 86, height: 82, cornerRadius: 8)
                        Circle()
                            .foregroundStyle(Color.white)
                            .frame(width: 32,height: 32)
                        if isPlayable {
                            Button {
                                DispatchQueue.main.async {
                                    if isPlaying {
                                        audioPlayer.stop()
                                        isPlaying = false
                                    } else {
                                        audioPlayer.setupPlayer(with: lecture.voice ?? "")
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
                        } else {
                            Image("lecture.microphone")
                        }
                        
                    }

                VStack(alignment: .leading) {
                    Text(lecture.name ?? "")
                        .font(AppFonts.Normal.boldMedium)
                        .foregroundStyle(isPlayable ? AppColors.Primary.Orange : Color.black)
                    Text(extractText(from:lecture.desc ?? ""))
                        .font(AppFonts.Normal.semiBoldMedium)
                        .foregroundStyle(Color.black)
                    Spacer()
                    if isPlaying {
                        ProgressView(value: audioPlayer.currentTime, total: audioPlayer.duration)
                                        .progressViewStyle(LinearProgressViewStyle())
                                        .padding()
                    } else {
                        HStack(spacing: 4) {
                            
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 12,height: 12)
                                .padding(6,6,0,6)
                            
                            Text(lecture.voice_duration ?? "0:00")
                                .font(AppFonts.Normal.small)
                                .foregroundStyle(AppColors.Secondary.dark)
                                .padding(0,6,6,6)
                            
                        }
                        .background(AppColors.Primary.Orange.opacity(0.36))
                        .cornerRadius(8)
                    }

                }
                Spacer()
                
                    Button {
                        
                    } label: {
                        Image("icon.save")
                            .resizable()
                            .frame(width: 11,height: 14)
                    }

            }.padding(12)
        }
            .frame(maxHeight: 90)
            .cornerRadius(8)
    }
}


struct Padding: ViewModifier {
    
    typealias Edges = (leading: CGFloat?, top: CGFloat?, trailing: CGFloat?, bottom: CGFloat?)
    
    var edges: Edges
    func body(content: Content) -> some View {
        content
            .padding(.leading, edges.leading)
            .padding(.top, edges.top)
            .padding(.trailing, edges.trailing)
            .padding(.bottom, edges.bottom)
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

extension View {
    func padding(_ leading: CGFloat? = nil, _ top: CGFloat? = nil, _ trailing: CGFloat? = nil, _ bottom: CGFloat? = nil) -> some View {
        self.modifier(Padding(edges: Padding.Edges(leading: leading, top: top, trailing: trailing, bottom: bottom)))
    }
    func padding(_ leadingTrailing: CGFloat?, _ topBottom: CGFloat?) -> some View {
        return self.modifier(Padding(edges: Padding.Edges(leading: leadingTrailing, top: topBottom, trailing: leadingTrailing, bottom: topBottom)))
    }
}
