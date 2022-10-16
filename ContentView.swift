//
//  ContentView.swift
//  Shared
//
//  Created by student on 9/29/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiData:APIData = APIData(PokemonID: 1)
    @State var pokemonID: Int = 1
    @State var pokemonName: String = "Bulbsaur"
    @State var base_exp: Int = 64
    @State var base_happiness: Int = 70
    @State var capture_rate: Int = 45
    @State var pokemonNameArray: [String] = []
    @State private var selectedString: String?
    
    var body: some View {
        VStack{
            let pokemonId_string = String(format: %03d, self.pokemonID)
            Image(pokemon_string)
            
            
        }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
