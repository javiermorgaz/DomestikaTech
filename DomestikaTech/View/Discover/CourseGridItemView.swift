//
//  CourseGridItemView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI

struct CourseGridItemView: View {
    
    @ObservedObject var viewModel: CourseItemViewModel
    
    init(viewModel: CourseItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Image(uiImage: viewModel.image ?? UIImage())
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
}

struct CourseGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            let course = Course(courseId: "12", thumbnail: "", title: "", trailer: "", description: "", location: "", teacher: Teacher(name: "", avatar: ""), reviews: Reviews(positive: 0, total: 0), lessonsCount: 0, students: 0, audio: "", subtitles: [String](), level: "")
            
            CourseGridItemView(viewModel: CourseItemViewModel(course: course, getImageUseCase: GetImage(coursesRepository: CoursesFetcherRepository(restClient: RestClient(baseUrl: Constants.baseURL)))))
        }
    }
}
