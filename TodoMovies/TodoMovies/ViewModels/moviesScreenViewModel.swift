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
                   numberOfLikes: 100,
                   numberOfViews: "3 of 10 Watched",
                   postAuthor: "@TodoMoviesApp",
                   image: "image",
                   movies: [movie(movieName: "test"), movie(movieName: "test")]
        )
    }
    
    @Published private(set) var moviesListData: moviesList = getMoviesList()
    
    
}
