//
//  moviesScreen.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct moviesScreen: View {
    var body: some View {
        GeometryReader { view in
            ScrollView() {
                imageMoviesList()
                    .frame(width: view.size.width, height: view.size.height * 0.45, alignment: .center)
                HStack {
                    VStack {
                        textNameMoviesList()
                        textMovieListData()
                    }
                    Spacer()
                    VStack {
                        checkmarkLikeMoviesList()
                        Spacer()
                    }
                }
                .padding()
                VStack {
                    ForEach(0..<10) { item in
                        movieCell()
                    }
                    .frame(width: view.size.width, height: view.size.height * 0.13)
                }
            }
            .background(Color("primaryBlack"))
            .foregroundColor(Color("primaryWhite"))
        }
    }
}

struct imageMoviesList: View {
    var body: some View {
        Image(systemName: "camera")
    }
}

struct textNameMoviesList: View {
    var body: some View {
        HStack {
            Text("The very best of Jhonny Depp")
                .font(.system(size: 28, weight: .bold, design: .default))
            Spacer()
        }
    }
}

struct textMovieListData: View {
    var body: some View {
        HStack {
            Image(systemName: "heart")
            Text("1.2 Likes     ")
            Text("3 of 10 watched")
            Spacer()
        }
        .padding(.vertical,1)
    }
}

struct checkmarkLikeMoviesList: View {
    var body: some View {
        Image(systemName: "heart")
    }
}















struct moviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        moviesScreen()
    }
}
