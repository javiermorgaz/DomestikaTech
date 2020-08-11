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
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            VStack(alignment: .center, spacing: 0, content: {
                if !viewModel.courseItemsViewModel.isEmpty {
                    TabView{
                        let tabCourses = viewModel.courseItemsViewModel[0...3]
                        ForEach(tabCourses, id: \.id) { model in
                            CourseTabItemView(viewModel: model)
                                .onAppear(perform: model.getImage)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(width: .none, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                } else {
                    AnyView(ProgressView())
                        .frame(width: .none, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                VStack(alignment: .leading, spacing: 0, content: {
                    if !viewModel.courseItemsViewModel.isEmpty {
                        Text("Popular")
                            .frame(width: .none, height: 55, alignment: .bottom)
                            .padding(.bottom).padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: rows, spacing: 16) {
                                let lastIndex = viewModel.courseItemsViewModel.count - 1
                                let gridCourses = viewModel.courseItemsViewModel[4...lastIndex]
                                ForEach(gridCourses, id: \.id) { model in
                                    VStack(alignment: .center, spacing: 0, content: {
                                        CourseGridItemView(viewModel: model)
                                            .onAppear(perform: model.getImage)
                                    })
                                    .frame(width: 230, height: 245)
                                }
                                .cornerRadius(5)
                            }
                            .padding(.horizontal)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                        }
                        Spacer(minLength: 70)
                    } else {
                        AnyView(ProgressView())
                            .frame(width: .none, height: 370, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                })
            })
            .onAppear(perform: viewModel.getCourses)
        })
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiscoverView(
                viewModel: DiscoverViewModel(
                    getCoursesUseCase: GetCourses(coursesRepository: CoursesFetcherRepository(restClient: RestClient(baseUrl: ""))),
                    getImageUseCase: GetImage(coursesRepository: CoursesFetcherRepository(restClient: RestClient(baseUrl: ""))))
            )
        }
    }
}
