//
//  RulesView.swift
//
//  Created by Kevin Kha on 3/11/21.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.horizontalSizeClass) var layoutMode
    var body: some View{
        VStack {
            if layoutMode == .compact {
                HStack {
                    Text("Instructions")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .padding(.leading, 25)
                    Spacer()
                    
                    NavigationLink(destination: AuthorView(), label: {
                        Text("Author")
                            .bold()
                            .frame(width:80, height: 30, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.trailing, 25)
                    })
                }
                Text("This is a simple dice game with two dices for each player.")
                    .padding(20)
                    .background(Color.green)
                Text("1. Move the slider to choose how much money to bet.\n2. Hit the roll button to roll the dices on each side.\n3. You will win or gain money upon the following conditions: ")
                    //.background(Color.blue)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                Text("a. Win the amount bet if you roll higher.\nb. Lose the amount bet if you roll lower.\nc. No gain/lost upon a tie roll.")
                    //.background(Color.red)
                    .padding(.leading, 80)
                    .padding(.trailing, 50)
                Spacer()
            } else {
                HStack {
                    Spacer()
                    Text("Instructions")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .padding(.leading, 25)
                    Spacer()
                    
                    NavigationLink(destination: AuthorView(), label: {
                        Text("Author")
                            .bold()
                            .frame(width:80, height: 30, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.trailing, 25)
                    })
                    Spacer()
                }
                Text("This is a simple dice game with two dices for each player.")
                    .padding(20)
                    .background(Color.green)
                Text("1. Move the slider to choose how much money to bet.\n2. Hit the roll button to roll the dices on each side.\n3. You will win or gain money upon the following conditions: ")
                    //.background(Color.blue)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                Text("a. Win the amount bet if you roll higher.\nb. Lose the amount bet if you roll lower.\nc. No gain/lost upon a tie roll.")
                    //.background(Color.red)
                    .padding(.leading, 80)
                    .padding(.trailing, 50)
                Spacer()
            }
        }.background(Color.yellow.edgesIgnoringSafeArea(.all))
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
