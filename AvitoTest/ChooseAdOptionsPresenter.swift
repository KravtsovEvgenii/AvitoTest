//
//  ChooseAdOptionsPresenter.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//  
//

import Foundation
import UIKit
class ChooseAdOptionsPresenter: ViewToPresenterChooseAdOptionsProtocol {
  
    func getNewOffer() {
        interactor?.makeRequest(completion: {[weak self] (offer, models) in
            let header = Header(title: offer.result.title, denyActionTitle: offer.result.actionTitle, actionTitle: offer.result.selectedActionTitle)
            
            self?.view?.presentViewModel(items: models, withHeader: header)
        })
    }
    
    
    
    // MARK: Properties
    var view: PresenterToViewChooseAdOptionsProtocol?
    var interactor: PresenterToInteractorChooseAdOptionsProtocol?
    var router: PresenterToRouterChooseAdOptionsProtocol?
    
}

extension ChooseAdOptionsPresenter: InteractorToPresenterChooseAdOptionsProtocol {
    func passDecodedData(offer: Offer) {
        let item = offer.result.list[0]
        view?.presentViewModel(items: [PresentableModel(title: item.title, description: item.optionDescription!, price: item.price, isSelected: item.isSelected, image: UIImage(imageLiteralResourceName:"camera"))], withHeader: Header(title: item.id, denyActionTitle: item.id, actionTitle: item.id))
    }
    
    
}
