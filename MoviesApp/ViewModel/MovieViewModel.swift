//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 24.09.2021.
//

import Foundation
import SwiftUI

class MoviesViewModel : ObservableObject{
    
    let apiService = ApiService()
    
    @Published var movies = [MovieViewModel]()
    
    func searchMovie(movieName:String){
        apiService.getMovies(search: movieName) { result in
            switch result{
                case .failure(let error):
                    print(error)
                case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)

                    }
                }
            }
        }
    }
    
    
}

struct MovieViewModel{
    var movie:Movie
    
    var title :String {
        movie.title
    }
    
    var year :String {
        movie.year
    }
    
    var imdbID :String {
        movie.imdbID
    }
    
    var poster :String {
        movie.poster
    }
}


