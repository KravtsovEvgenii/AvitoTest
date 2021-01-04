//
//  ChooseAdOptionsInteractor.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//  
//

import Foundation
import UIKit
class ChooseAdOptionsInteractor: PresenterToInteractorChooseAdOptionsProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterChooseAdOptionsProtocol?
    
    func makeRequest(completion: @escaping (Offer, [PresentableModel]) -> Void) {
        let myGroup = DispatchGroup()
        var items = [PresentableModel]()
        let offer = Bundle.main.decode(Offer.self, from: "result.json")
        for item in offer.result.list {
            myGroup.enter()
            NetworkService.shared.downloadImage(fromStringUrl: item.imageStringUrl) { (image, error) in
                guard error == nil else {return}
                let presentImage = image != nil ? image : UIImage(named: "default")
                let presentable = PresentableModel(title: item.title, description: item.optionDescription, price: item.price, isSelected: false, image: presentImage!)
                items.append(presentable)
                myGroup.leave()
            }
        }
        myGroup.notify(queue: .main) {
            completion(offer,items)
        }
        
        
    }
    
}
