//
//  MyModel.swift
//  FetchAPI
//
//  Created by student on 9/29/22.
//

import Foundation

struct MyModel: Decodable{
    let firstString: String
    let stringArray: [String]
    
    init(from decoder: Decoder) throws{
        var container = try decoder.unkeyedContainer()
        firstString = try container.decode(String.self)
        stringArray = try container.decode([String].self)
        
    }
    
    //api calls
    var base_happiness: Int
    var base_experience: Int
    var capture_rate: Int
    var name: String
}
