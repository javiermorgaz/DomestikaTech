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
                        .frame(width: .none, height: 440, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                        
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("Popular")
                                .font(.body)
                                .padding(.bottom, 20).padding(.leading, 20)
                                .frame(width: .none, height: 80, alignment: .bottom)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: rows, spacing: 20) {
                                    let lastIndex = viewModel.courseItemsViewModel.count - 1
                                    let gridCourses = viewModel.courseItemsViewModel[4...lastIndex]
                                    ForEach(gridCourses, id: \.id) { model in
                                        VStack(alignment: .center, spacing: 0, content: {
                                            CourseGridItemView(viewModel: model)
                                                .onAppear(perform: model.getImage)
                                        })
                                        .frame(width: 265)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .clipped()
                                    .padding(.bottom, 10)
                                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 3)
                                }
                                .padding(.leading, 20)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                            }
                            Spacer(minLength: 70)
                        })
                    } else {
                        AnyView(ProgressView())
                            .background(Color.red)
                            .frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                })
                .onAppear(perform: viewModel.getCourses)
            })
            .background(Color(red: 254 / 255, green: 255 / 255, blue: 255 / 255))
            .edgesIgnoringSafeArea(.top)
        }
    }
}
