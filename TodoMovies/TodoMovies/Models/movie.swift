//
//  movie.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

struct movie: Identifiable {
    var id: Int
    var movieName: String
    var movieDate: Int
    var movieImagePreview: String
    var movieGenres: Array<genres>
    
    struct genres: Identifiable {
        var id: Int
        var genre: String
    }
}
