//
//  DiscoverView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI
import AVKit
import Combine

struct DiscoverView: View {
    
    @ObservedObject var viewModel: DiscoverViewModel
    
    init(viewModel: DiscoverViewModel) {
        self.viewModel = viewModel
    }
    
    let rows = [GridItem(),]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .center, spacing: 0, content: {
                    if !viewModel.courseItemsViewModel.isEmpty {
                        coursesTabView
                        
                        VStack(alignment: .leading, spacing: 0, content: {
                            coursesGridHeaderView
                            coursesGridView
                            Spacer(minLength: 20)
                        })
                    } else {
                        discoverEmptyView
                    }
                })
                .onAppear(perform: viewModel.getCourses)
            })
            .edgesIgnoringSafeArea(.top)
            .navigationBarItems(leading:
                                Button(action: {
                                    print("Domestika button was tapped")
                                }) {
                                    Image("Brand")
                                        .renderingMode(.original)
                                        .frame(width: 30, height: 30)
                                        .padding(.leading, 4).padding(.bottom, 5)
                                }
                                .buttonStyle(PlainButtonStyle()),
                                trailing:
                                    Button(action: {
                                        print("Search button was tapped")
                                    }) {
                                        Image("Search")
                                            .renderingMode(.original)
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 4).padding(.bottom, 5)
                                    }
                                    .buttonStyle(PlainButtonStyle())
            )
        }
    }
}

extension DiscoverView {
    
    var discoverEmptyView: some View {
        AnyView(ProgressView())
            .frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
    var coursesTabView: some View {
        TabView{
            let tabCourses = viewModel.courseItemsViewModel[0...3]
            ForEach(tabCourses, id: \.id) { model in
                CourseTabItemView(viewModel: model)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: .none, height: 440)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
    }
    
    var coursesGridHeaderView: some View {
        Text(LocalizedStringKey("popular"))
            .font(.body)
            .foregroundColor(Color.darkTextColor)
            .fontWeight(.medium)
            .padding(.bottom, 20).padding(.leading, 20)
            .frame(width: .none, height: 80, alignment: .bottom)
    }
    
    var coursesGridView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                let lastIndex = viewModel.courseItemsViewModel.count - 1
                let gridCourses = viewModel.courseItemsViewModel[4...lastIndex]
                ForEach(gridCourses, id: \.id) { model in
                    NavigationLink(destination: getDetailView(course: model.course)) {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                            CourseGridItemView(viewModel: model)
                                .frame(width: 265)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .background(Color.backgroundColor)
                .cornerRadius(5)
                .clipped()
                .padding(.bottom, 30)
                .shadow(color: Color.gray.opacity(0.1), radius: 20, x: 0, y: 0)
            }
            .padding(.leading, 20).padding(.trailing, 20)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
        }
    }
    
    private func getDetailView(course: Course) -> DetailView {
        return AppServiceLocator.shared.detail.provideDetailView(course: course)
    }
}
