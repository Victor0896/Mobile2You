//
//  moviesList.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

struct moviesList: Identifiable, Codable {
    var id: Int
    var listName: String
    var numberOfLikes: Double
    var numberOfViews: Int
    //var listAuthor: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case listName = "title"
        case numberOfLikes = "popularity"
        case numberOfViews = "vote_count"
        case image = "backdrop_path"
    }
}
