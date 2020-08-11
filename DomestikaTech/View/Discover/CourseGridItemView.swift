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
        VStack(alignment: .center, spacing: 0, content: {
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 125)
                .clipped()
            Rectangle().fill(Color.orange)
                .frame(width: .none, height: 75)
            Rectangle().fill(Color.gray)
                .frame(width: .none, height: 45)
        })
        .cornerRadius(5)
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
