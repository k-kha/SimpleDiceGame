//
//  MainPageView.swift
//
//  Created by Kevin Kha on 3/10/21.
//

import SwiftUI


struct MainPageView: View {
    @State var round: Int = 0
    @State var totalMoney: Int = 500
    @State var dice0: Int = 1
    @State var dice1: Int = 1
    @State var dice2: Int = 1
    @State var dice3: Int = 1
    @State private var resetAlert = false
    @State private var loseAlert = false
    @State private var bet = 50.0
    @Environment(\.horizontalSizeClass) var layoutMode
    
    var playerSum: Int {
        get {
            return self.dice0 + self.dice1
        }
    }
    
    var compSum: Int {
        get {
            return self.dice2 + self.dice3
        }
    }
    
    var alert: Alert {
        Alert(title: Text("Game Reset!"),
              message: Text("Total money and round numbers have been reset."))
    }
    
    var alert2: Alert {
        Alert(title: Text("Game Over!"),
              message: Text("You have run out of money! The game will reset."))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if layoutMode == .compact {
                    HStack {
                        Image("Dices")
                        Text("Simple Dice Game")
                            .bold()
                            .font(.title)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width:250, height:30, alignment: .center)
                            
                        NavigationLink(destination: RulesView()) {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color.blue)
                        }
                    }
                    
                    HStack {
                        Text("Round: \(round)")
                            .padding()
                            .frame(width: 150, height: 30, alignment: .trailing)
                        Text("Total Money: \(totalMoney)")
                            .frame(width: 170, height: 30, alignment: .leading)
                        .frame(width: 200, height: 50)
                    }
                        .foregroundColor(.black)
                        .background(Color.green)
                        
                    .padding()
                    HStack {
                        VStack {
                            Text("Player")
                                .bold()
                                .padding()
                            Image("Dice\(dice0)")
                                .padding()
                            Image("Dice\(dice1)")
                            Text("\(playerSum)")
                                .font(.title)
                                .fontWeight(.heavy)
                                .frame(width: 100, height: 100)
                        }.background(Color.blue)
                        //.padding()
                        VStack{
                            Text("Computer")
                                .bold()
                                .padding()
                            Image("Dice\(dice2)")
                                .padding()
                            Image("Dice\(dice3)")
                            
                            Text("\(compSum)")
                                .font(.title)
                                .fontWeight(.heavy)
                                .frame(width: 100, height: 100)
                        }.background(Color.red)
                        
                    }
                    
                    Slider(value: $bet, in: 0...100, step: 5)
                        .padding(.leading, 50)
                        .padding(.trailing, 50)
                    HStack {
                        Text("Amount to bet: ")
                            .padding(.bottom, 20)
                        Text("\(Int(bet))")
                            .foregroundColor(.red)
                            .padding(.bottom, 20)
                    }
                    
                    HStack {
                        
                        Button(action: {
                            self.round = self.round + 1
                            self.dice0 = Int.random(in: 1...6)
                            self.dice1 = Int.random(in: 1...6)
                            self.dice2 = Int.random(in: 1...6)
                            self.dice3 = Int.random(in: 1...6)
                            if (playerSum > compSum){
                                self.totalMoney = self.totalMoney + Int(bet)
                            }
                            else if (playerSum < compSum) {
                                self.totalMoney = self.totalMoney - Int(bet)
                            }
                            if (self.totalMoney <= 0) {
                                loseAlert = true
                                self.round = 0
                                self.totalMoney = 500
                                self.dice0 = 1
                                self.dice1 = 1
                                self.dice2 = 1
                                self.dice3 = 1
                                self.bet = 50.0
                            }
                        }, label: {
                            HStack {
                                Image("Roll")
                                Text("Roll")
                                    .bold()
                            }
                                .frame(width:120, height: 30, alignment: .center)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.trailing, 10)
                        }).alert(isPresented: $loseAlert,
                                 content: { self.alert2 })
                        Button(action: {
                            self.round = 0
                            self.totalMoney = 500
                            self.dice0 = 1
                            self.dice1 = 1
                            self.dice2 = 1
                            self.dice3 = 1
                            self.bet = 50.0
                            resetAlert = true
                        }, label: {
                            Text("Reset")
                                .bold()
                                .frame(width:120, height: 30, alignment: .center)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.leading, 10)
                        }).alert(isPresented: $resetAlert,
                                 content: { self.alert })
                    }
                    Spacer()
                } else {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Player")
                                .bold()
                                .padding()
                            Image("Dice\(dice0)")
                                .padding()
                            Image("Dice\(dice1)")
                            Text("\(playerSum)")
                                .font(.title)
                                .fontWeight(.heavy)
                                .frame(width: 100, height: 80)
                            
                        }
                            .padding(.top, -10)
                            .padding(.bottom, -10)
                            .background(Color.blue)
                        
                        VStack {
                            HStack {
                                Image("Dices")
                                Text("Simple Dice Game")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .frame(width:250, height:30, alignment: .center)
                                NavigationLink(destination: RulesView()) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(Color.blue)
                                }
                            }
                            
                            HStack {
                                Text("Round: \(round)")
                                    .padding()
                                    .frame(width: 150, height: 30, alignment: .trailing)
                                Text("Total Money: \(totalMoney)")
                                    .frame(width: 170, height: 30, alignment: .leading)
                                .frame(width: 200, height: 50)
                            }
                                .foregroundColor(.black)
                                .background(Color.green)
                            Spacer()
                            Slider(value: $bet, in: 0...100, step: 5)
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            HStack {
                                Text("Amount to bet: ")
                                    .padding(.bottom, 20)
                                Text("\(Int(bet))")
                                    .foregroundColor(.red)
                                    .padding(.bottom, 20)
                            }
                            
                            HStack {
                                
                                Button(action: {
                                    self.round = self.round + 1
                                    self.dice0 = Int.random(in: 1...6)
                                    self.dice1 = Int.random(in: 1...6)
                                    self.dice2 = Int.random(in: 1...6)
                                    self.dice3 = Int.random(in: 1...6)
                                    if (playerSum > compSum){
                                        self.totalMoney = self.totalMoney + Int(bet)
                                    }
                                    else if (playerSum < compSum) {
                                        self.totalMoney = self.totalMoney - Int(bet)
                                    }
                                    if (self.totalMoney <= 0) {
                                        loseAlert = true
                                        self.round = 0
                                        self.totalMoney = 500
                                        self.dice0 = 1
                                        self.dice1 = 1
                                        self.dice2 = 1
                                        self.dice3 = 1
                                        self.bet = 50.0
                                    }
                                }, label: {
                                    HStack {
                                        Image("Roll")
                                        Text("Roll")
                                            .bold()
                                    }
                                        .frame(width:120, height: 30, alignment: .center)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .padding(.trailing, 10)
                                }).alert(isPresented: $loseAlert,
                                         content: { self.alert2 })
                                Button(action: {
                                    self.round = 0
                                    self.totalMoney = 500
                                    self.dice0 = 1
                                    self.dice1 = 1
                                    self.dice2 = 1
                                    self.dice3 = 1
                                    self.bet = 50.0
                                    resetAlert = true
                                }, label: {
                                    Text("Reset")
                                        .bold()
                                        .frame(width:120, height: 30, alignment: .center)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .padding(.leading, 10)
                                }).alert(isPresented: $resetAlert,
                                         content: { self.alert })
                                
                            }
                            //.frame(width: 200, height: 50)
                            Spacer()
                        }
                        .padding()
                        VStack{
                            Text("Computer")
                                .bold()
                                .padding()
                            Image("Dice\(dice2)")
                                .padding()
                            Image("Dice\(dice3)")
                            
                            Text("\(compSum)")
                                .font(.title)
                                .fontWeight(.heavy)
                                .frame(width: 100, height: 80)
                        }
                            .padding(.top, -10)
                            .padding(.bottom, -10)
                            .background(Color.red)
                        Spacer()
                    }
                }
            }.background(Color.yellow.edgesIgnoringSafeArea(.all))
            //.navigationBarTitle("Main Game")
            .navigationBarHidden(true)
            //.background(SwiftUI.Color.yellow.edgesIgnoringSafeArea(.all))
            //WelcomeView()
        }
        .phoneOnlyStackNavigationView()
            
    }
    
    
}

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
