//
//  ContentView.swift
//  Emojibook
//
//  Created by Frank Bara on 5/14/21.
//

import SwiftUI

struct EmojibookListView: View {
    
    let emojiData: [EmojiDetails] = EmojiProvider.all()
    
    // boolean to determine if the sheet should be visible or not
    @State private var showingDetail: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiData, content: { emojiDetails in
                    // handle taps on the row
                    Button(action: {
                        showingDetail.toggle()
                    }, label: {
                        EmojiItemView(emoji: emojiDetails.emoji, emojiName: emojiDetails.name)
                    })
                    // show the sheet with the emoji details
                    .sheet(isPresented: $showingDetail) {
                        EmojiDetailsView(emojiDetails: emojiDetails)
                    }
                })
            }
            
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Emojibook")
        }
        
    }
}

// Reusable view that will be used for each row of our List.
struct EmojiItemView: View {
    let emoji: String
    let emojiName: String
    
    var body: some View {
        Text("\(emoji) \(emojiName)")
            .font(.largeTitle)
            .padding([.top, .bottom])
    }
}

struct EmojiDetailsView: View {
    var emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            // background color
            Color(UIColor.systemIndigo).edgesIgnoringSafeArea(.all)
            
            // emoji data
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(emojiDetails.emoji) \(emojiDetails.name)")
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding()
                    
                    Text(emojiDetails.description)
                        .padding([.leading, .trailing, .bottom])
                        .font(.title)
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct EmojibookListView_Previews: PreviewProvider {
    static var previews: some View {
        EmojibookListView()
    }
}
