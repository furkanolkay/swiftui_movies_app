//
//  MoviesView.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 27.09.2021.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var moviesViewModel : MoviesViewModel
    
    
    @State var searchMovie = ""
    
    
    init(){
        self.moviesViewModel = MoviesViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search Movie", text: $searchMovie,
                          onEditingChanged: {_ in},
                          onCommit: {
                    self.moviesViewModel.searchMovie(movieName:searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie )
                }) .padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
                List(moviesViewModel.movies, id: \.imdbID){
                    movie in
                    
                    NavigationLink(destination: MovieDetailsView(imdbID:movie.imdbID ), label:{
                        HStack{
                            ImageView(url: movie.poster).frame(width: 100, height: 130)
                            Text(movie.title)
                        }

                    } )
                    
                }.navigationTitle(Text("Movies App"))
            }
          
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
