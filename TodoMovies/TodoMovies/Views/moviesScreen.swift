//
//  moviesScreen.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct moviesScreen: View {
    @ObservedObject var moviesListViewModel: moviesScreenViewModel
    
    var body: some View {
        GeometryReader { view in
            ScrollView() {
                imageMoviesList()
                    .frame(width: view.size.width, height: view.size.height * 0.45, alignment: .center)
                HStack {
                    VStack {
                        textNameMoviesList(listName: moviesListViewModel.moviesListData.listName)
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
    var listName: String
    var body: some View {
        HStack {
            Text(listName)
                .font(.system(size: 28, weight: .bold, design: .default))
            Spacer()
        }
    }
}

struct textMovieListData: View {
    @State var didLiked = false
    var numberOfListLikes = "1.2k "
    var numberOfWhatchedListMovies = "3 of 10 "
    
    var body: some View {
        HStack {
            chageBetweenSymbols(firstSymbol: "suit.heart.fill", secondSymbol: "heart", state: didLiked)
            Text(numberOfListLikes) + Text("Likes") + Text("   ")
            Text(numberOfWhatchedListMovies) + Text("watched")
            Spacer()
        }
        .padding(.vertical,1)
    }
}

struct checkmarkLikeMoviesList: View {
    @State var didLiked = false                                  //implement search to see if is added?
    
    var body: some View {
        chageBetweenSymbols(firstSymbol: "suit.heart.fill", secondSymbol: "heart", state: didLiked)
            .onTapGesture {
                self.didLiked = changeState(state: didLiked)
            }
    }
}

struct textSubimittedBy: View {
    var body: some View {
        HStack {
            Text("List subimitted by ") + Text("@TodoMoviesApp")
        }
        .padding(40)
    }
}

struct buttonMoviesList: View {
    @State private var didTap = false
    
    var textsButton: Array<String>
    var mainColor: Color
    var haveImageBeforeText: Bool
    var body: some View {
        Button(action: {
            self.didTap = changeState(state: didTap)
            
        }) {
            HStack {
                haveImageBeforeText ? chageBetweenSymbols(firstSymbol: "suit.heart.fill", secondSymbol: "heart", state: didTap) : nil
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

func changeState(state: Bool) -> Bool {
    if state {
        return false
    } else {
        return true
    }
}

func chageBetweenSymbols(firstSymbol: String, secondSymbol: String, state: Bool) -> Image {
    return Image(systemName: state ? firstSymbol: secondSymbol)
}



struct moviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        let screen = moviesScreenViewModel()
        moviesScreen(moviesListViewModel: screen)
    }
}
