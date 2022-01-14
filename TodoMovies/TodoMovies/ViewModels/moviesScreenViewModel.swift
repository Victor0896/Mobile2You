//
//  moviesScreenViewModel.swift
//  TodoMovies
//
//  Created by victoredbc on 12/01/22.
//

import Foundation

class moviesScreenViewModel: ObservableObject {
    
    @Published private(set) var moviesListData: moviesList = getMoviesList()
    @Published private(set) var movies: pageResults = getMovie()
    
    
    private let movieId = 6
    private let movieListUrl = "https://api.themoviedb.org/3/movie/6?api_key=efd510fd517de276c43e3a7692af8554&language=en-US"
    private let simlarMoviesUrl = "https://api.themoviedb.org/3/movie/6/similar?api_key=efd510fd517de276c43e3a7692af8554&language=en-US&page=1"
    
    static func getMoviesList() -> moviesList {                                             //testMovieList
        moviesList(id: 2,
                   listName: "The very best of Jhonny Depp",
                   numberOfLikes: 11111,
                   numberOfViews: 310,
                   image: "camera"
    )}
    
    static func getMovie() -> pageResults {                                             //testMovieList
        pageResults(page: 1, results: [movie(id: 2,
                                             movieName: "The very best of Jhonny Depp",
                                             movieDate: "111",
                                             movieImagePreview: "3 of 10",
                                             movieGenres: [1,2,3]),
                                       movie(id: 3,
                                             movieName: "The hihihihi",
                                             movieDate: "222",
                                             movieImagePreview: "3 of 10",
                                             movieGenres: [1,2,3]),
                                       movie(id: 4,
                                             movieName: "The oooooooooo",
                                             movieDate: "333",
                                             movieImagePreview: "3 of 10",
                                             movieGenres: [1,2,3])])
    }
    
    
    //MARK: Data
    
    
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
    
    /*func listGenres(genresList: [Int]) -> String {
        var stringGenres: [String]
        genresList.forEach { genre in
            stringGenres[genre] = genresEnum.genreid(genresList[genre])
        }
    }*/
    
    
    //MARK: user intent
    
    
    
    
    //MARK: API CALLS
    
    func getListOfSimilarMovies() {
        guard let url = URL(string: simlarMoviesUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(pageResults.self, from: data)
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
                    let result = try JSONDecoder().decode(moviesList.self, from: data)
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
