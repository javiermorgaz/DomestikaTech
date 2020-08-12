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
                            Spacer(minLength: 70)
                        })
                    } else {
                        discoverEmptyView
                    }
                })
                .onAppear(perform: viewModel.getCourses)
            })
            .background(Color(red: 254 / 255, green: 255 / 255, blue: 255 / 255))
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
    }
}

extension DiscoverView {
    
    var discoverEmptyView: some View {
        AnyView(ProgressView())
            .frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
    var coursesTabView: some View {
        ZStack(alignment: .top) {
            TabView{
                let tabCourses = viewModel.courseItemsViewModel[0...3]
                ForEach(tabCourses, id: \.id) { model in
                    CourseTabItemView(viewModel: model)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width: .none, height: 440)
            .background(Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 38, height: 38)
                    .padding(.leading, 15)
                Spacer()
                Button(action: {
                    print("Search button was tapped")
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 38, height: 38)
                .background(Color.white)
                .cornerRadius(19)
                .padding(.trailing, 15)
            }
            .padding(.top, 50)
        }
    }
    
    var coursesGridHeaderView: some View {
        Text("Popular")
            .font(.body)
            .padding(.bottom, 20).padding(.leading, 20)
            .frame(width: .none, height: 80, alignment: .bottom)
    }
    
    var coursesGridView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                let lastIndex = viewModel.courseItemsViewModel.count - 1
                let gridCourses = viewModel.courseItemsViewModel[4...lastIndex]
                ForEach(gridCourses, id: \.id) { model in
                    VStack(alignment: .center, spacing: 0, content: {
                        CourseGridItemView(viewModel: model)
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
    }
}
