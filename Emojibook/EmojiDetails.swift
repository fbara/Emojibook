//
//  EmojiDetails.swift
//  Emojibook
//
//  Created by Frank Bara on 5/14/21.
//

import Foundation

public struct EmojiDetails {
    public let emoji: String
    public let name: String
    public let description: String
    public let url: URL?
    
    init(emoji: String, name: String, description: String) {
        // include a url handler so we can deeplink into the app to launch a specific emoji
        self.emoji = emoji
        self.name = name
        self.description = description
        self.url = URL(string: "emoji://\(name.filter { !$0.isWhitespace })")
    }
}

// MARK: Identifiable

// The Identifiable extension is necessary to be able to identify each EmojiDetails element when we add them to our list with the ForEach struct.
// Since we will display different emoji, the emoji string itself can be used as the id.
extension EmojiDetails: Identifiable {
    public var id: String {
        emoji
    }
}
