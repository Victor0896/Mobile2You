//
//  moviesScreenViewModel.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

class moviesScreenViewModel: ObservableObject {
    
    static func getMoviesList() -> moviesList {
        moviesList(id: 2,
                   listName: "The very best of Jhonny Depp",
                   numberOfLikes: "1.2k",
                   numberOfViews: "3 of 10",
                   listAuthor: "@TodoMoviesApp",
                   image: "camera",
                   movies: [movie(id: 1, movieName: "test"), movie(id: 2,movieName: "test")]
        )
    }
    
    @Published private(set) var moviesListData: moviesList = getMoviesList()
    
    
}
