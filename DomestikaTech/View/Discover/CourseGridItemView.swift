//
//  CourseGridItemView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseGridItemView: View {
    
    @ObservedObject var viewModel: CourseItemViewModel
    
    init(viewModel: CourseItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0, content: {
            CourseImage
            VStack(alignment: .leading, spacing: 0, content: {
                Spacer().frame(height: 20)
                Title
                Spacer().frame(height: 8)
                Teacher
                Spacer(minLength: 20)
            })
            .frame(height: 90)
            
            Rectangle().fill(Color.separatorColor)
                .frame(height: 1)
            HStack {
                CourseButton
                Spacer()
                DisclosureImage
            }
            .frame(height: 45)
        })
    }
}

extension CourseGridItemView {
    
    var CourseImage: some View {
        WebImage(url: viewModel.image)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .clipped()
    }
    
    var Title: some View {
        Text(viewModel.title)
            .font(.subheadline)
            .foregroundColor(Color.darkTextColor)
            .fontWeight(.medium)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding(.leading, 20).padding(.trailing, 20)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var Teacher: some View {
        Text(viewModel.teacherName)
            .font(.caption)
            .foregroundColor(Color.lightTextColor)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding(.leading, 20).padding(.trailing, 20)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var CourseButton: some View {
        Text(LocalizedStringKey("verCurso"))
            .font(.caption)
            .foregroundColor(Color.darkTextColor)
            .lineLimit(2)
            .padding(.leading, 20)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var DisclosureImage: some View {
        Image("main-disclosure")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 12, height: 12)
            .padding(.trailing)
    }
}
