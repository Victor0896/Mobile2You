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
                        //movieCell()
                    }
                    .frame(width: view.size.width, height: view.size.height * 0.13)
                }
                buttonMoviesList(textsButton: ["Like", "Liked"], mainColor: Color("primaryGrey"), haveImageBeforeText: true)
                buttonMoviesList(textsButton: ["Add to My Lists", "Added to My Lists"], mainColor: Color("primaryGrey"), haveImageBeforeText: false)
                textSubimittedBy()
            }
            .background(Color("primaryBlack"))
            .foregroundColor(Color("primaryGrey"))
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

var buttonLikeMoviesList: some View {
    Button(action: {}, label: {
        Text("Liked")
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("primaryGrey"))
            .cornerRadius(10)
            .foregroundColor(Color("primaryBlack"))
    })
        .padding(.top)
}

var buttonAddToMyList: some View {
    Button(action: {}, label: {
        Text("Add to My lists")
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("primaryGrey"))
            .cornerRadius(10)
            .foregroundColor(Color("primaryBlack"))
    })
        .padding(.top)
}

struct textSubimittedBy: View {
    var body: some View {
        HStack {
            Text("List subimitted by ")
            + Text("@TodoMoviesApp")
        }
        .padding(40)
    }
}

struct buttonMoviesList: View {
    @State private var didTap: Bool = false
    
    var textsButton: Array<String>
    var mainColor: Color
    var haveImageBeforeText: Bool
    var body: some View {
        Button(action: {
            if didTap { didTap = false }
            else { didTap = true }
            //!haveImageBeforeText
        }) {
            HStack {
                haveImageBeforeText ? Image(systemName:didTap ? "suit.heart.fill": "heart") : nil
                Text(didTap ? textsButton[1]: textsButton[0])
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(mainColor, lineWidth: 2))
        .background(didTap ? mainColor : Color("primaryBlack"))
        .foregroundColor(didTap ? Color("primaryBlack") : mainColor)
        .cornerRadius(10)
        .padding(.top)
    }
}







struct moviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        moviesScreen()
    }
}
