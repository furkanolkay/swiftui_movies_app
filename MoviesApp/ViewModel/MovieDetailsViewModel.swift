//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 29.09.2021.
//

import Foundation

class MovieDetailsViewModel : ObservableObject{

    @Published var details : MoviesDetailsViewModel?
    let apiService = ApiService()

    

    func getDetails(imdbID:String){
        apiService.getMovieDetails(imdbID: imdbID) { result in
            switch result{
                case .failure(let error):
                    print(error)
                case .success(let movieDetails):
                        DispatchQueue.main.async {
                            self.details = MoviesDetailsViewModel(details: movieDetails)
                        }
            }
        }
    }
    
}

struct MoviesDetailsViewModel{
    let details : MovieDetails
    var title  : String {
        details.title
    }
    
    var poster : String {
        details.poster
    }
    var plot : String {
        details.plot
    }
    
    var imdbID : String {
        details.imdbID
    }
    
    var year : String {
        details.year
    }
    
    var director : String  {
        details.director
    }
    var genre : String {
        details.genre
    }
    
}
