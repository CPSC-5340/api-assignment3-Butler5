//
//  ParksViewModel.swift
//  Assignment3
//
//  Created by Adam Butler on 3/31/24.
//

import Foundation

class ParksViewModel : ObservableObject {
    
    @Published private(set) var parksData = [ParkModel]()
    private let url = "https://developer.nps.gov/api/v1/parks?limit=20&api_key=8e6Pi3pbwXIYBxsBfNO9ZxcpfjN0ZtOUwyu1bHOW"
        
    func fetchData() {
        if let url = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: url) {(data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(ParkResults.self, from: data)
                                self.parksData = results.data 
                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }
}
