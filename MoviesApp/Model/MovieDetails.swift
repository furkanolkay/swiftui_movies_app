//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 29.09.2021.
//

import Foundation


class MovieDetails : Codable{
    
    let title : String
    let year : String
    let genre : String
    let director : String
    let plot : String
    let poster : String
    let imdbID : String
    
    private enum CodingKeys : String, CodingKey{
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
        case poster = "Poster"
        case imdbID = "imdbID"
    }
 
}
