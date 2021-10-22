//
//  ImageService.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 28.09.2021.
//

import Foundation

class ImageService : ObservableObject{
    
    @Published var image : Data?
    
    func getImage(url:String) {
        guard let imageUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.image =  data
            }
            
        }.resume()
        
    }
}
