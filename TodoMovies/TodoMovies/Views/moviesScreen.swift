//
//  moviesScreen.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct moviesScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .frame(width: 200, height: 200, alignment: .center)
            HStack {
                VStack {
                    HStack {
                        Text("The very best of \n Jhonny Depp")
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "heart")
                        Text("1.2 Likes")
                        Text("3 of 10 wathced")
                        Spacer()
                    }
                }
                Spacer()
                Image(systemName: "heart")
            }
            VStack {
                Text("hello")
                Text("hello")
                Text("hello")
                Text("hello")
                Text("hello")
                Text("hello")
                Text("hello")
                
            }
        }
    }
}

struct moviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        moviesScreen()
    }
}
