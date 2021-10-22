//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 29.09.2021.
//

import SwiftUI

struct MovieDetailsView: View {
    let imdbID : String
    
    @ObservedObject var movieDetails = MovieDetailsViewModel()
    
    init(imdbID : String){
        self.imdbID=imdbID
        movieDetails.getDetails(imdbID:self.imdbID)
    }
    
    var body: some View {
        VStack{
            Text(movieDetails.details?.plot ?? "")
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(imdbID: "aa")
    }
}
