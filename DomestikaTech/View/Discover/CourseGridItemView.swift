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
        
        NavigationLink(destination: DetailView()) {
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
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20).padding(.trailing, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer().frame(height: 8)
                    Text("de \(viewModel.teacherName)")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20).padding(.trailing, 20)
                    
                    Spacer(minLength: 20)
                })
                .frame(height: 90)
                
                Rectangle().fill(Color.gray.opacity(0.1))
                    .frame(height: 1)
                
                HStack {
                    Text("Ver curso")
                        .font(.caption)
                        .lineLimit(2)
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.gray)
                        .frame(width: 12, height: 12)
                        .padding(.trailing, 10)
                    
                }
                .frame(height: 45)
            })
        }
        .buttonStyle(PlainButtonStyle())
    }
}
