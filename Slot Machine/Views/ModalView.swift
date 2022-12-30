//
//  ModalView.swift
//  Slot Machine
//
//  Created by Steven Vafadar on 2022-12-30.
//

import SwiftUI

struct ModalView: View {
    
    @State private var showingModal : Bool = false
    @State private var coins: Int = 100
    
    var body: some View {
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

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
