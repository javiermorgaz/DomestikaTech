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
            WebImage(url: viewModel.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
            
            VStack(alignment: .leading, spacing: 0, content: {
                Spacer().frame(height: 20)
                Text(viewModel.title)
                    .font(.subheadline)
                    .foregroundColor(Color.darkTextColor)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20).padding(.trailing, 20)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer().frame(height: 8)
                Text(viewModel.teacherName)
                    .font(.caption)
                    .foregroundColor(Color.lightTextColor)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20).padding(.trailing, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 20)
            })
            .frame(height: 90)
            
            Rectangle().fill(Color.separatorColor)
                .frame(height: 1)
            
            HStack {
                Text(LocalizedStringKey("verCurso"))
                    .font(.caption)
                    .foregroundColor(Color.darkTextColor)
                    .lineLimit(2)
                    .padding(.leading, 20)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Image("main-disclosure")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .padding(.trailing)
            }
            .frame(height: 45)
        })
    }
}
