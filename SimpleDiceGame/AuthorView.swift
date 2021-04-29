//
//  AuthorView.swift
//
//  Created by Kevin Kha on 3/11/21.
//

import SwiftUI

struct AuthorView: View {
    @State private var myAlert = false
    @Environment(\.horizontalSizeClass) var layoutMode
    
    var alert: Alert {
        Alert(title: Text("Just Kidding!"),
              message: Text("Hit the back button at the top left to go back."))
    }
    
    var body: some View {
        VStack {
            if layoutMode == .compact {
                Text("Hello, I am Kevin Kha")
                    .font(.largeTitle)
                Image("me")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.leading, 150)
                    .padding(.trailing, 150)
                
                Text("I am a M.S. student in Computer Science. I will graduate in May 2021. I have been to Syracuse University for my undergraduate and graduate studies.")
                //Button
                Button(action: {
                    myAlert = true
                }, label: {
                    Text("Close")
                        .bold()
                        .frame(width:120, height: 30, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(20)
                }).alert(isPresented: $myAlert,
                         content: { self.alert })
                Spacer()
            } else {
                Spacer()
                Text("Hello, I am Kevin Kha")
                    .font(.largeTitle)
                Image("me")
                    .resizable()
                    .frame(width: 125, height: 125)
                    //.padding(.leading, 150)
                    //.padding(.trailing, 150)
                HStack {
                    Spacer()
                    Text("I am a M.S. student in Computer Science. I will graduate in May 2021. I have been to Syracuse University for my undergraduate and graduate studies.")
                        .frame(width: 500, height: 100)
                    Spacer()
                }
                
                //Button
                Button(action: {
                    myAlert = true
                }, label: {
                    Text("Close")
                        .bold()
                        .frame(width:120, height: 30, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(10)
                }).alert(isPresented: $myAlert,
                         content: { self.alert })
                //Spacer()
            }
        }.background(Color.yellow.edgesIgnoringSafeArea(.all))
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
