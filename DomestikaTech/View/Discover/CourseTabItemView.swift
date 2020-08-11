//
//  CourseTabItemView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI

struct CourseTabItemView: View {

    @ObservedObject var viewModel: CourseItemViewModel
    
    init(viewModel: CourseItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(uiImage: viewModel.image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }

            HStack {
                Spacer()
                    .frame(width: 50)
                VStack(spacing: 16) {
                    Spacer()
                    Text(viewModel.title)
                        .font(.title2)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                    Button("Watch") {

                    }
                }
                Spacer()
                    .frame(width: 50)
            }
            .padding(.bottom, 50)
        }
    }
}

struct CourseTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            let course = Course(courseId: "12", thumbnail: "", title: "Introduction to Adobe Photoshop", trailer: "", description: "", location: "", teacher: Teacher(name: "", avatar: ""), reviews: Reviews(positive: 0, total: 0), lessonsCount: 0, students: 0, audio: "", subtitles: [String](), level: "")
            
            CourseTabItemView(viewModel: CourseItemViewModel(course: course, getImageUseCase: GetImage(coursesRepository: CoursesFetcherRepository(restClient: RestClient(baseUrl: Constants.baseURL)))))
            
        }
    }
}
