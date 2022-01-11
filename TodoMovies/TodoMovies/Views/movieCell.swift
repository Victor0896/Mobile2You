//
//  movieCell.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct movieCell: View {
    //@State public var isAddingToMyList = false
    
    var body: some View {
        GeometryReader { view in
            HStack {
                HStack {
                    movieImage
                        .frame(width: view.size.width * 0.2, height: view.size.height, alignment: .center)
                        .background(.white)                                                                 //test color
                        .padding(5)
                    textMovieDescription()
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

var movieImage: some View {
    Image(systemName: "camera")
        .foregroundColor(Color("primaryBlack"))                                                             //test color
}

struct textMovieDescription: View {
    var body: some View {
        VStack {
            HStack {
                Text("Edward Scissorhands")
                    .font(.system(size: 18, weight: .regular, design: .default))
                Spacer()
            }
            HStack {
                Text("1992")
                Text("Drama, comedy")
                Spacer()
            }
            .font(.system(size: 14, weight: .regular, design: .default))
        }
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










struct movieCell_Previews: PreviewProvider {
    static var previews: some View {
        movieCell()
    }
}
