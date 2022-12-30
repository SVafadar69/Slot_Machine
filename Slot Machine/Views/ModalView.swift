//
//  ModalView.swift
//  Slot Machine
//
//  Created by Steven Vafadar on 2022-12-30.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        ZStack{
            Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
            
            //MARK: MODAL
            VStack(spacing: 0) {
                //MARK: TITLE
                
                Text("Game Over")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
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
