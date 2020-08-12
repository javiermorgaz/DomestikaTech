//
//  DetailView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 12/08/2020.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                                        print("Back button was tapped")
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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
