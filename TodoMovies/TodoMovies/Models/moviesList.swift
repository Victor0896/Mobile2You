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
    var numberOfLikes: Int
    var numberOfViews: String
    var postAuthor: String
    var image: String
    
    private(set) var movies: Array<movie>
    

}


