//
//  NetworkService.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.


import Foundation
import UIKit

class NetworkService {
    static let shared = NetworkService()
    func downloadImage(fromStringUrl stringUrl: String,completion: @escaping (UIImage?, Error?) -> Void) {
        guard let url = URL(string: stringUrl) else {return}
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return }
            guard let data = data else {return}
            
            if let image = UIImage(data: data) {
                completion(image,nil)
            }
        }).resume()
    }
}
