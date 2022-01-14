//
//  moviesScreen.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct moviesScreen: View {
    
    @ObservedObject var moviesListViewModel: moviesScreenViewModel
    @State public var didLikedList = false
    
    var body: some View {
        GeometryReader { view in
            ScrollView() {
                imageMoviesList(image: moviesListViewModel.imageBuilder(imageString: moviesListViewModel.moviesListData.image))
                    .frame(width: view.size.width, height: view.size.height * 0.45, alignment: .center)
                HStack {
                    VStack {
                        textNameMoviesList(listName: moviesListViewModel.moviesListData.listName)
                        textMovieListData(didLikedList: $didLikedList, moviesList: moviesListViewModel.moviesListData)
                    }
                    Spacer()
                    VStack {
                        checkmarkLikeMoviesList(didLikedList: $didLikedList)
                        Spacer()
                    }
                }
                .padding()
                VStack {
                    ForEach(moviesListViewModel.movies.results) { movie in
                        movieCell(moviesListViewModel: moviesListViewModel, movie: movie)
                    }
                    .frame(width: view.size.width, height: view.size.height * 0.13)
                }
                buttonMoviesList(textsButton: ["Like", "Liked"],
                                 mainColor: Color("primaryGrey"),
                                 haveImageBeforeText: true,
                                 didLikedList: $didLikedList)
                buttonMoviesList(textsButton: ["Add to My Lists", "Added to My Lists"],
                                 mainColor: Color("primaryGrey"),
                                 haveImageBeforeText: false,
                                 didLikedList: $didLikedList)
                textSubimittedBy(senderName: "@todoapp")
            }
            .background(Color("primaryBlack"))
            .foregroundColor(Color("primaryGrey"))
            
        }
        .onAppear() {
            moviesListViewModel.getMovieListData()
            moviesListViewModel.getListOfSimilarMovies()
        }
    }
}

struct imageMoviesList: View {
    var image: String
    var body: some View {
        AsyncImage(url: URL(string: self.image)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "camera")
        }
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
    @Binding var didLikedList: Bool
    var moviesList: moviesList
    
    var body: some View {
        HStack {
            chageBetweenSymbols(firstSymbol: "suit.heart.fill", secondSymbol: "heart", state: didLikedList)
            Text("\(moviesList.numberOfLikes)") + Text("Likes") + Text("   ")
            Text("\(moviesList.numberOfViews)") + Text(" watched")
            Spacer()
        }
        .padding(.vertical,1)
    }
}

struct checkmarkLikeMoviesList: View {
    @Binding var didLikedList: Bool                                 //implement search to see if is added?
    
    var body: some View {
        chageBetweenSymbols(firstSymbol: "suit.heart.fill", secondSymbol: "heart", state: didLikedList)
            .onTapGesture {
                didLikedList.toggle()
            }
    }
}

struct textSubimittedBy: View {
    var senderName: String
    var body: some View {
        HStack {
            Text("List subimitted by ") + Text(senderName)
        }
        .padding(40)
    }
}

struct buttonMoviesList: View {
    @State private var didTap = false
    
    var textsButton: Array<String>
    var mainColor: Color
    var haveImageBeforeText: Bool
    
    @Binding var didLikedList: Bool
    
    var body: some View {
        Button(action: {
            self.didTap.toggle()
            haveImageBeforeText ? didLikedList.toggle() : nil
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

func chageBetweenSymbols(firstSymbol: String, secondSymbol: String, state: Bool) -> Image {
    return Image(systemName: state ? firstSymbol: secondSymbol)
}

struct moviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        let screen = moviesScreenViewModel()
        moviesScreen(moviesListViewModel: screen)
    }
}
