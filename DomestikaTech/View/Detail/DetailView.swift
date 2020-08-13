//
//  DetailView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 12/08/2020.
//

import SwiftUI
import AVKit
import SDWebImageSwiftUI

struct DetailView: View {
    
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    @Environment(\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VideoPlayer(player: AVPlayer(url: viewModel.trailer)) {
            }
            .frame(height: 210)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 6, content: {
                    Spacer().frame(height: 25)
                    Text(viewModel.title)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.darkTextColor)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(viewModel.description)
                        .font(.caption)
                        .foregroundColor(Color.lightTextColor)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer().frame(height: 25)
                    HStack(alignment: .top, spacing: nil, content: {
                        VStack(alignment: .leading, spacing: 6, content: {
                            Text(viewModel.teacherName)
                                .font(.headline)
                                .foregroundColor(Color.darkTextColor)
                                .fontWeight(.medium)
                            Text(viewModel.location)
                                .font(.caption)
                                .foregroundColor(Color.lightTextColor)
                        })
                        Spacer()
                        WebImage(url: viewModel.avatar)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .cornerRadius(22.5)
                            .padding(.top, 8)
                    })
                    Spacer().frame(height: 30)
                    
                })
                
                Rectangle().fill(Color.separatorColor)
                    .frame(height: 1)
                
                VStack(alignment: .leading, spacing: 15, content: {
                    Spacer().frame(height: 20)
                    PropertiesView(icon: "like", property: viewModel.positive)
                    PropertiesView(icon: "lesson", property: viewModel.lessons)
                    PropertiesView(icon: "students", property: viewModel.students)
                    PropertiesView(icon: "audio", property: viewModel.audio)
                    PropertiesView(icon: "cc", property: viewModel.subtitles)
                    PropertiesView(icon: "level", property: "Nivel",
                                   level: viewModel.level)
                    Spacer().frame(height: 10)
                })
            }
            .padding(.leading, 20).padding(.trailing, 20)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image("Back")
                                        .renderingMode(.original)
                                }
            .buttonStyle(PlainButtonStyle())
                                .frame(width: 30, height: 30),
                            trailing:
                                Button(action: {
                                    print("Share button was tapped")
                                }) {
                                    Image("Share")
                                        .renderingMode(.original)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: 30, height: 30)
        )
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }))
    }
}

struct PropertiesView: View {
    
    private let icon: String
    private let property: String
    private let level: String?
    
    init(icon: String, property: String, level: String? = nil) {
        self.icon = icon
        self.property = property
        self.level = level
    }
    
    var body: some View {
        HStack(spacing: 10, content: {
            Image(icon)
                .renderingMode(.original)
                .clipped()
            Text(property)
                .font(.caption)
                .foregroundColor(Color.darkTextColor)
            if let level = level {
                Text(level)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .padding(5)
                    .background(Color.begginerColor)
                    .cornerRadius(25)
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let course = Course(courseId: "2", thumbnail: "http://mobile-assets.domestika.org/challenge/404-original.jpg", title: "Content Creation and Editing for Instagram Storie", trailer: "", description: "Discover the secrets of photography and video to find success on Instagram", location: "Sevilla, Spain", teacher: Teacher(name: "Mina Barrio", avatar: "http://mobile-assets.domestika.org/challenge/499833-original.jpg"), reviews: Reviews(positive: 2156, total: 2200), lessonsCount: 22, students: 74685, audio: "Spanish", subtitles: ["English","Spanish","Portuguese"], level: "Advanced")
        
        DetailView(viewModel: DetailViewModel(course: course))
    }
}
