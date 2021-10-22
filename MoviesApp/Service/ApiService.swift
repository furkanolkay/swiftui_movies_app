//
//  DownloaderClient.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 23.09.2021.
//

import Foundation



class ApiService{
    
    
    
    func getMovies(search:String ,completion : @escaping (Result<[Movie]?,ApiErrors>)->Void ){
        
        guard let url = URL(string: "\(Constants.api)?s=\(search)&apikey=\(Constants.key)") else{
            return completion(.failure(.UrlError))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return completion(.failure(.NotFound))
            }
            guard let movieResponse = try? JSONDecoder().decode(AllMovies.self, from: data) else{
                return completion(.failure(.DataNotProcessing))
            }
            
            completion(.success(movieResponse.movies))
        }.resume()
        
    }
    
    func getMovieDetails(imdbID:String, completion: @escaping (Result<MovieDetails,ApiErrors>)->Void){
        guard let url = URL(string: "\(Constants.api)?i=\(imdbID)&apikey=\(Constants.key)") else { return completion(.failure(.UrlError)) }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(.NotFound)) }
            guard let movieDetails = try? JSONDecoder().decode(MovieDetails.self, from: data) else { return completion(.failure(.DataNotProcessing)) }
            completion(.success(movieDetails))
        }.resume()
    }
}
enum ApiErrors: Error{
    case UrlError
    case NotFound
    case DataNotProcessing
}

struct Constants{
    static let api = "https://www.omdbapi.com/"
    static let key = "" //Generate key And Put
}
