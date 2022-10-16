//
//  APIData.swift
//  FetchAPI
//
//  Created by student on 9/29/22.
//

import Foundation

class APIData: ObservableObject{
    var pokemonName: String = ""
    var base_exp: Int = -1
    var base_happiness: Int = -1
    var capture_rate: Int = -1
    var data = [PokemonData]()
    var pokemonNameArray: [String] = ["Bulbsaur"]
    var height: Int = -1
    
    init(PokemonID: Int){
        fetchAPIData(completionHandler: {(PokemonData) in
            self.pokemonName = PokemonData.name
            self.base_exp = PokemonData.base_experience
            self.base_happiness = PokemonData.base_happiness
            self.capture_rate = PokemonData.capture_rate
            
        }, pokemonID: PokemonID)
        
        fetchAPIData{(PokemonData) in
            self.pokemonNameArray = PokemonData.stringArray
        }
    }
    
    func returnPokemonNameArray () -> [String] {
        return self.pokemonNameArray
    }
    
    func fetchNew (PokemonID: Int) -> Void{
        
        fetchAPIData(completionHandler: {(PokemonData) in
            self.pokemonName = PokemonData.name
            self.base_exp = PokemonData.base_experience
            self.base_happiness = PokemonData.base_happiness
            self.capture_rate = PokemonData.capture_rate
            
        }, pokemonID: PokemonID)
    }
        
    func fetchAPIData(completionHandler: @escaping (MyModel) -> Void, pokemonID: Int) {
        
        let url = URL(string: "https://king-prawn-app-zx6tp.ondigitalocean.app/pokemon/api/v1.0/pokemon_id/1" +
            String(pokemonID))!
        var task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data else { return }
            do{
                let pokemonData = try JSONDecoder().decode(MyModel.self, from: data)
                completionHandler(pokemonData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
            
            
        }).resume()
        
        
    }
    
    
    
}
