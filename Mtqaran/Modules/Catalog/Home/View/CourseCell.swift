//
//  CourseCell.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import SwiftUI

struct CourseCell: View {
    var course: CourseDTO
    var isTaken: Bool

    var body: some View {
        content
    }
}

extension CourseCell {
    private var image: some View {
        RemoteImageView(urlString: course.image ?? "", width: 156, height: 81, cornerRadius: 8)
    }
    
    private var texts: some View {
        HStack {
            VStack(alignment: .leading,spacing: 10) {
                if isTaken {
                    HStack {
                        Text(course.name ?? "")
                            .font(AppFonts.Normal.boldMedium)
                            .foregroundStyle(.black)
                        Spacer()
                        RoundedProgressBar(percentage: Double(course.percent ?? 0))
                            .frame(maxWidth: 40)
                    }
                }
                
                HStack {
                    Image(systemName: "graduationcap")
                        .foregroundStyle(Color.black)
                    Text("\(course.lessonsCount ?? "0") lectures")
                        .font(AppFonts.Normal.small)
                        .foregroundStyle(Color.black)
                }
                Text(extractText(from:course.desc ?? ""))
                    .font(AppFonts.Normal.small)
                    .foregroundStyle(Color.gray)
            }
            Spacer()
        }
    }
    
    private var content: some View {
        VStack(spacing: 10) {
            image
                .padding(.horizontal, 11)
                .padding(.top, 9)
            texts
                .padding(.horizontal, 11)
                .padding(.bottom, 9)
        }.background(Color.white)
            .cornerRadius(8)
    }
}

func extractText(from htmlString: String) -> String {
    guard let data = htmlString.data(using: .utf8) else { return "" }
    
    if let attributedString = try? NSAttributedString(data: data,
                                                      options: [.documentType: NSAttributedString.DocumentType.html,
                                                                .characterEncoding: String.Encoding.utf8.rawValue],
                                                      documentAttributes: nil) {
        return attributedString.string
    }
    
    return ""
}

