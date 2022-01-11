//
//  movieCell.swift
//  TodoMovies
//
//  Created by victoredbc on 10/01/22.
//

import SwiftUI

struct movieCell: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "camera")
                VStack {
                    Text("Edward Scissorhands")
                    HStack {
                        Text("1992")
                        Text("Drama, comedy")
                    }
                }
            }
            Spacer()
            Image(systemName: "checkmark.circle.fill")
        }
    }
}

struct movieCell_Previews: PreviewProvider {
    static var previews: some View {
        movieCell()
    }
}
