//
//  ImageView.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 28.09.2021.
//

import SwiftUI

struct ImageView: View {
    let url : String
    
    @ObservedObject var imageService = ImageService()
    
    
    init(url : String){
        self.url = url
        self.imageService.getImage(url: self.url)
    }
    var body: some View {
        if let data = self.imageService.image {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }else{
            return Image("noimage")
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "google.com")
    }
}
