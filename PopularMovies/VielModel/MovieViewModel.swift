//
//  MovieViewModel.swift
//  PopularMovies
//
//  Created by Jefferson Valverde on 16/04/22.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie]?
    
    func fetchData() {
        let url = URL (string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=06a84fce0d94e081d4b938b4b8c74e28")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print (error)
                return
            }
            if let data = data{
                do {
                    let discover = try JSONDecoder().decode(Discover.self, from: data)
                    self.movies = discover.results
                    
                } catch (let error) {
                    print(error)
                    return
                }
                
            }else
            {
                print ("error")
                return
            }
        }.resume()
    }
}
