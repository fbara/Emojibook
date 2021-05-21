//
//  EmojiWidgetView.swift
//  Emojibook WidgetExtension
//
//  Created by Frank Bara on 5/15/21.
//

import SwiftUI
import WidgetKit

struct EmojiWidgetView: View {
    
    // We can access our widget’s widgetFamily by using the Environment property wrapper. This allows us to read the widget’s widgetFamily value directly from our EmojiWidgetView’s environment.
    @Environment(\.widgetFamily) var family: WidgetFamily
    let emojiDetails: EmojiDetails
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallEmojiWidgetView(emojiDetails: emojiDetails)
        case .systemMedium:
            MediumEmojiWidgetView(emojiDetails: emojiDetails)
        case .systemLarge:
            LargeEmojiWidgetView(emojiDetails: emojiDetails)
        @unknown default:
            EmptyView()
        }
    }
}

struct EmojiWidgetPlaceholderView: View {
    var body: some View {
        Color(UIColor.systemIndigo)
    }
}


// define the UI of the widget
struct SmallEmojiWidgetView: View {
    
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
        // pass the specific emoji the deeplink url from the small widget
        .widgetURL(emojiDetails.url)
    }
}

// UI for the medium size widget
struct MediumEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            HStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                    .padding()
                VStack(alignment: .leading) {
                    Text(emojiDetails.name)
                        .font(.headline)
                    Text(emojiDetails.description)
                }
                .foregroundColor(.white)
                .padding([.top, .bottom, .trailing])
            }
        }
    }
}

// UI for a large size widget
struct LargeEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.name)
                    .bold()
                    .font(.title)
                Text(emojiDetails.emoji)
                    .font(.system(size: 60))
                    .padding()
                Text(emojiDetails.description)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}
