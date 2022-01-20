//
//  moviesScreenViewModel.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

class MoviesScreenViewModel: ObservableObject {
    
    @Published private(set) var moviesListData: MoviesList = getMoviesList()
    @Published private(set) var movies: PageResults = getMovie()
    
    typealias movie = Movie
    
    static func getMoviesList() -> MoviesList {                                         //testMovieList
        MoviesList(id: 2,
                   listName: "Star Wars: Episode 5",
                   numberOfLikes: 11111,
                   numberOfViews: 310,
                   image: "camera"
    )}
    
    static func getMovie() -> PageResults {                                             //testMovieList
        PageResults(page: 1, results: [Movie(id: 2,
                                             movieName: "Spider-man: No way Home",
                                             movieDate: "2021",
                                             movieImagePreview: "300 Views",
                                             movieGenres: [1,2,3]),
                                       Movie(id: 3,
                                             movieName: "The Avengers",
                                             movieDate: "2012",
                                             movieImagePreview: "1000 Views",
                                             movieGenres: [1,2,3]),
                                       Movie(id: 4,
                                             movieName: "The Avengers: Endgame",
                                             movieDate: "2019",
                                             movieImagePreview: "123 Views",
                                             movieGenres: [1,2,3])])
    }
    
    //MARK: Data Ajustments
    
    func dateDisplay(releaseDate: String) -> String {
        let dateArray = releaseDate.components(separatedBy: "-")
        if !dateArray.isEmpty {
            return dateArray[0]
        } else { return ""}
    }
    
    func imageBuilder(imageString: String) -> String {
        let baseUrl = "https://image.tmdb.org/t/p/"
        let size = "w780"
        return baseUrl + size + imageString
    }
    
    //MARK: user intent
    
    //
    
    //MARK: API CALLS
    
    private let movieListUrl = "https://api.themoviedb.org/3/movie/6?api_key=efd510fd517de276c43e3a7692af8554&language=en-US"
    private let similarMoviesUrl = "https://api.themoviedb.org/3/movie/6/similar?api_key=efd510fd517de276c43e3a7692af8554&language=en-US&page=1"
    
    func getListOfSimilarMovies() {
        guard let url = URL(string: similarMoviesUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(PageResults.self, from: data)
                    print(result)
                    
                    DispatchQueue.main.async {
                        self.movies = result
                    }
                } else {
                    print("No Data")
                }
            } catch (let error) {
                print(error)
            }
        }.resume()
    }
    
    func getMovieListData() {
        guard let url = URL(string: movieListUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(MoviesList.self, from: data)
                    print(result)
                    
                    DispatchQueue.main.async {
                        self.moviesListData = result
                    }
                } else {
                    print("No Data")
                }
            } catch (let error) {
                print(error)
            }
        }.resume()
    }
}
