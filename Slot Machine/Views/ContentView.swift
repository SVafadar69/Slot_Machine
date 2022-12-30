//
//  ContentView.swift
//  Slot Machine
//
//  Created by Steven Vafadar on 2022-12-29.
//

import SwiftUI

struct ContentView: View {
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    @State private var highScore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView : Bool = false
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    @State private var showingModal: Bool = false
    
    
    //MARK: FUNCTIONS
    
    //MARK: SPIN THE REELS
    
    func spinReels() {
        //reels[0] = Int.random(in: 0...symbols.count-1) //random //int from 0->2
        //reels[1] = Int.random(in: 0...symbols.count-1)
        //reels[2] = Int.random(in: 0...symbols.count-1)
        
        reels = reels.map({_ in
            Int.random(in: 0...symbols.count-1) //returns random array of 0-2 between
        })
    }
    
    
    
    //MARK: CHECK THE WINNING
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[0] == reels[2] {
            
            playerWins() //increasing coins by 10x
            //MARK: NEW HIGH SCORE
            if coins > highScore { //if coins increase from previous func
                //condition is checked first
                newHighScore()
            }
            
        } else {
            
            playerLoses() //decreasing coins  by betAmount
        }
    }
    
    //MARK: PLAYER WINS
    func playerWins() {
        coins += betAmount * 10
    }
    
    func newHighScore() {
        highScore = coins
    }
    //MARK: PLAYER LOSES
    func playerLoses() {
        coins -= betAmount
    }
    
    func activateBet20 () {
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    func activateBet10() {
        betAmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
    }
    
    //MARK: GAME IS OVER

    func gameOver() {
        if coins <= 0 {
            showingModal = true
            coins = 100
        }
    }
    


    
    var body: some View {
        
        ZStack {
            
                LinearGradient(gradient: Gradient(colors: [Color("Colorpink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                
                VStack(alignment: .center, spacing: 5)
            {
                LogoView()
                
                Spacer()
                
                
                //MARK: - SCORE
                
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased()).scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    Spacer() //horizontal spacing in hstack
                    
                    HStack {
                        Text("\(highScore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased()).scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                        
                    }
                    .modifier(ScoreContainerModifier())
                    
                }
                //MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0) {
                    //MARK: REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]]) //index symbols with int of reels
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    //MARK: REEL #2
                    HStack(alignment: .center, spacing: 0) {
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        //MARK: REEL #3
                        
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        
                    }
                    .frame(maxWidth: 500)
                    //MARK: SPIN BUTTON
                    
                    Button(action: {
                        self.spinReels() //spiins the reels
                        
                        //MARK: CHECK WINNING FUNC
                        self.checkWinning()
                        self.gameOver()
                    }) {
                        Image("gfx-spin") // button that has image gfx-spin
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }
                //MARK: SLOT MACHINE
                .layoutPriority(2)
                
                //        //MARK: - FOOTER
                //
                Spacer()
                
                HStack {
                    //MARK: BET 20
                    
                    HStack(alignment: .center, spacing: 10){
                        Button(action: {
                            self.activateBet20()
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color.yellow : Color.white)
                                .modifier(ShadowButtonModifier())
                            
                        }
                        .background(
                            Capsule()
                            
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("Colorpink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom))
                        )
                        .padding(3)
                        .background(Capsule()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("Colorpink"), Color("ColorPurple")]), startPoint: .bottom, endPoint: .top))
                        )
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .scaledToFit()
                            .frame(height: 64)
                            .animation(.default)
                            .modifier(ShadowModifier())
                    }
                    
                    Spacer(minLength: 1)
                    
                    HStack(alignment: .center, spacing: 10){
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0) //will slide chips to respective amount
                            .scaledToFit()
                            .frame(height: 64)
                            .animation(.default)
                            .modifier(ShadowModifier())
                        
                        Button(action: {
                            self.activateBet10()
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color.yellow : Color.white) //if active, choose 1 color > other with :
                                .modifier(ShadowButtonModifier())
                            
                        }
                        .background(
                            Capsule()
                            
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("Colorpink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom))
                        )
                        .padding(3)
                        .background(Capsule()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("Colorpink"), Color("ColorPurple")]), startPoint: .bottom, endPoint: .top))
                        )
                        
                    }
                }
                
               
            }
            
            
            //MARK: BUTTONS
           
                .overlay(
                    
                    //INFO
                    Button(action: {
                        self.showingInfoView = true //get info about the app -> redirected to infoview
                    }) {
                        Image(systemName: "info.circle")
                    }
                        .modifier(ButtonModifier()),
                    alignment: .topLeading
                )
                
                .padding()
                .frame(maxWidth: 720)
            
            //MARK: CODE TO GO IN AND OUT OF MODAL VIEW 
                .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false) //if false, not blurred. else blurred
            
            //MARK: POPUP
            if $showingModal.wrappedValue {
               
                ZStack{
                    Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
                    
                    //MARK: MODAL
                    VStack(spacing: 0) {
                        //MARK: TITLE
                        
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .padding()
                            .fontWeight(.heavy)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("Colorpink"))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! You lost all your coins.\nLet's play again.")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                self.showingModal = false
                                self.coins = 100
                            }) {
                                Text("New Game".uppercased()) //button with text new game
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color("Colorpink"))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor((Color("Colorpink")))
                                    ) //capsule with pink border around
                                
                            }
                            
                            
                        }
                        
                        Spacer()
                        
                    }.frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
                }
                
                
            }
            
        }
        //MARK: ZSTACK
        //will pull up InfoView when showInfoView is toggled true (which binding does)
        .sheet(isPresented: $showingInfoView) {
            InfoView ()
        }
    }
    
   
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
