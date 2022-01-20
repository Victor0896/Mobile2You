//
//  movieCell.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct MovieCell: View {
    var moviesList: MoviesScreenViewModel
    let movie: MoviesScreenViewModel.movie

    var body: some View {
        GeometryReader { view in
            HStack {
                HStack {
                    movieImage(image: moviesList.imageBuilder(imageString: movie.movieImagePreview))
                        .frame(width: view.size.width * 0.2, height: view.size.height, alignment: .center)
                        .background(.white)                                                                 //test color
                        .padding(5)
                    VStack {
                        textMovieName(movieName: movie.movieName)
                        textMovieDescription(movieDate: movie.movieDate, movieGenres: movie.movieGenres, moviesListViewModel: moviesList)
                    }
                }
                Spacer()
                checkmarkCellButtom()
            }
            .frame(width: view.size.width, height: view.size.height, alignment: .center)
            .foregroundColor(Color("primaryGrey"))
            .background(Color("primaryBlack"))
        }
    }
}

struct movieImage: View {
    var image: String
    var body: some View {
        AsyncImage(url: URL(string: self.image)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "camera")
                .foregroundColor(Color("primaryBlack"))
        }
    }
}

struct textMovieName: View {
    var movieName: String
    var body: some View {
        HStack {
            Text(movieName)
                .font(.system(size: 18, weight: .regular, design: .default))
            Spacer()
        }
    }
}

struct textMovieDescription: View {
    var movieDate: String
    var movieGenres : [Int]
    var moviesListViewModel: MoviesScreenViewModel
    var body: some View {
        HStack {
            Text(moviesListViewModel.dateDisplay(releaseDate: movieDate))
            Spacer()
        }
        .font(.system(size: 14, weight: .regular, design: .default))
    }
}

struct checkmarkCellButtom: View {
    var body: some View {
        VStack {
            Image(systemName: "plus.circle.fill")
                .padding()
            Spacer()
        }
    }
}


