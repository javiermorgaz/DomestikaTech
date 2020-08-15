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
    
    @State var player = AVPlayer()
    @State var isplaying = true
    @State var showControls = false
    @State var timeObserver: Any? = nil
    
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        player.replaceCurrentItem(with: AVPlayerItem(url: viewModel.trailer))
    }
    
    @Environment(\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack{
                VPlayerView(player: $player)
                    .frame(height: 210)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear() {
                        stopPlayer()
                    }
                    .onTapGesture {
                        showControls = true
                    }
                
                if showControls {
                    VPlayerControlsView(player: $player, isplaying: $isplaying, showControls: $showControls, timeObserver: $timeObserver)
                }
            }
            
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
                    PropertiesView(icon: "level", property: NSLocalizedString("level", comment: ""),
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
    
    func stopPlayer() {
        player.pause()
        player.replaceCurrentItem(with: nil)
        if let timeObserver = timeObserver {
            player.removeTimeObserver(timeObserver)
            self.timeObserver = nil
        }
    }
}

struct PropertiesView: View {
    
    private let icon: String
    private let property: String
    private let level: (description: String, color: Color)?
    
    init(icon: String, property: String, level: (description: String, color: Color)? = nil) {
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
                Text(level.description)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(.top, 3).padding(.bottom, 3).padding(.leading, 6).padding(.trailing, 6)
                    .background(level.color)
                    .cornerRadius(25)
            }
        })
    }
}
