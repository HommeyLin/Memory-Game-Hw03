//
//  ContentView.swift
//  Memory Game Hw03

//  Created by saruttaya attramongkol on 18/10/2566 BE.
//

import SwiftUI

let halloween: Array<String> = ["🎃", "👻", "💀", "☠️", "💩", "🤡", "👹", "😈", "🎃", "👻", "💀", "☠️", "💩", "🤡", "👹", "😈"]

let animals:Array<String> = ["🐶", "🐻", "🦊", "🐸", "🐥", "🐢", "🐨", "🐰", "🐶", "🐻", "🦊", "🐸", "🐥", "🐢", "🐨", "🐰"]

let sports:Array<String> = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🎱", "🥏", "⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🎱", "🥏"]


struct ContentView: View {
    
    @State var currentTheme = [halloween, animals, sports]
    @State var cardCount = 16
    
    @State var theme:Array<String> = halloween.shuffled()
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            cards
            cardTheme
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: theme[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardTheme: some View {
        HStack {
            Spacer()
            themeHalloween
            Spacer()
            themeAnimals
            Spacer()
            themeSports
            Spacer()
        }
        .imageScale(.small)
        .font(.system(size: 15))
//        .dynamicTypeSize(.large)
    }
    
    func cardThemeAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            theme = currentTheme[offset].shuffled()
        }) {
            Image(symbol).resizable().frame(width: 50, height: 50)
        }
    }
    
    var themeHalloween: some View{
        VStack{
            cardThemeAdjuster(by: 0, symbol: "12553098")
            Text("Halloween")
        }
    }
    var themeAnimals: some View{
        VStack{
            cardThemeAdjuster(by: 1, symbol: "12552881")
            Text("Animals")
        }
    }
    var themeSports: some View{
        VStack{
            cardThemeAdjuster(by: 2, symbol: "3311579")
            Text("Sports")
        }
    }
}



struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
