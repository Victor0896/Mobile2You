//
//  movieCell.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct movieCell: View {
    let movie: movie
    
    var body: some View {
        GeometryReader { view in
            HStack {
                HStack {
                    movieImage(image: movie.movieImagePreview)
                        .frame(width: view.size.width * 0.2, height: view.size.height, alignment: .center)
                        .background(.white)                                                                 //test color
                        .padding(5)
                    VStack {
                        textMovieName(movieName: movie.movieName)
                        textMovieDescription(movieDate: movie.movieDate, movieGenres: movie.movieGenres)
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
        Image(systemName: "camera")
            .foregroundColor(Color("primaryBlack"))
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
    var movieDate: Int
    var movieGenres : Array<movie.genres>
    var body: some View {
        HStack {
            Text("\(movieDate)")
            ForEach(movieGenres) { genre in
                return Text(genre.genre)
            }
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


