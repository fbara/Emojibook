//
//  EmojiWidgetView.swift
//  Emojibook WidgetExtension
//
//  Created by Frank Bara on 5/15/21.
//

import SwiftUI

// define the UI of the widget
struct EmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                Text(emojiDetails.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding([.leading, .trailing])
                    .foregroundColor(.white)
            }
        }
    }
}
