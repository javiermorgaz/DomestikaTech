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
    
    init(viewModel: CourseItemViewModel) {
        self.viewModel = viewModel
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
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: DetailView()) {
                        Text("Watch")
                            .font(.callout)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 110, height: 35)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .cornerRadius(3)
                }
                Spacer()
                    .frame(width: 50)
            }
            .padding(.bottom, 50)
        }
    }
}
