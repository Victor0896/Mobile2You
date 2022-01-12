//
//  moviesScreenViewModel.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

class moviesScreenViewModel: ObservableObject {
    
    static func getMoviesList() -> moviesList {                                             //testMovieList
        moviesList(id: 2,
                   listName: "The very best of Jhonny Depp",
                   numberOfLikes: "1.2k",
                   numberOfViews: "3 of 10",
                   listAuthor: "@TodoMoviesApp",
                   image: "camera",
                   movies: [movie(id: 1, movieName: "test", movieDate: 1992, movieImagePreview: "camera", movieGenres:
                                    [movie.genres(id: 1, genre: "Drama"), movie.genres(id: 2, genre: "Action")]),
                            movie(id: 1, movieName: "test", movieDate: 1992, movieImagePreview: "camera", movieGenres:
                                    [movie.genres(id: 1, genre: "Drama"), movie.genres(id: 2, genre: "Action")]),
                            movie(id: 1, movieName: "test", movieDate: 1992, movieImagePreview: "camera", movieGenres:
                                    [movie.genres(id: 1, genre: "Drama"), movie.genres(id: 2, genre: "Action")]),
                            movie(id: 1, movieName: "test", movieDate: 1992, movieImagePreview: "camera", movieGenres:
                                    [movie.genres(id: 1, genre: "Drama"), movie.genres(id: 2, genre: "Action")])]
    )}
    
    @Published private(set) var moviesListData: moviesList = getMoviesList()
    
    /*
    func getMovieList(completion:@escaping ([moviesList]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/1/similar?api_key=efd510fd517de276c43e3a7692af8554&language=en-US&page=1") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let moviesList = try! JSONDecoder().decode([moviesList].self, from: data!)
            print(moviesList)
            
            //DispatchQueue.main.async {
            //    completion(moviesList)
            //}
        }
        .resume()
    }
     */
    
}

