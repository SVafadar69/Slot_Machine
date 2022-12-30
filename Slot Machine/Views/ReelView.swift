//
//  ReelView.swift
//  Slot Machine
//
//  Created by Steven Vafadar on 2022-12-29.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier()) //passing in modifier to style image property
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
            .previewLayout(.fixed(width: 220, height: 220))
    }
}
