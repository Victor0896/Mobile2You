//
//  moviesList.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

struct moviesList: Identifiable {
    var id: Int
    var listName: String
    var numberOfLikes: String
    var numberOfViews: String
    var listAuthor: String
    var image: String
    
    private(set) var movies: Array<movie>
}


