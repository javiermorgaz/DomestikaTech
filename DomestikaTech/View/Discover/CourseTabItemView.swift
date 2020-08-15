//
//  CourseTabItemView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseTabItemView: View {

    @ObservedObject var viewModel: CourseItemViewModel

    private var router: DiscoverRouter

    init(viewModel: CourseItemViewModel,
         router: DiscoverRouter) {
        self.viewModel = viewModel
        self.router = router
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                WebImage(url: viewModel.image)
                    .renderingMode(.original)
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
                        .fontWeight(.medium)
                        .foregroundColor(Color.backgroundColor)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    router.navigationView(route: .detailView(course: viewModel.course)) {
                        Text(LocalizedStringKey("watch"))
                            .font(.callout)
                            .foregroundColor(Color.darkTextColor)
                            .fontWeight(.medium)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 110, height: 35)
                    .foregroundColor(Color.darkTextColor)
                    .background(Color.backgroundColor)
                    .cornerRadius(3)
                }
                Spacer()
                    .frame(width: 50)
            }
            .padding(.bottom, 50)
        }
    }
    
    private func getDetailView(course: Course) -> DetailView {
        return AppServiceLocator.shared.detail.provideDetailView(course: course)
    }
}
