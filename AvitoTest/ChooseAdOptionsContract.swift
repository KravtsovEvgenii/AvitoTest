//
//  ChooseAdOptionsContract.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewChooseAdOptionsProtocol {
    func presentViewModel(items: [PresentableModel], withHeader header: Header)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterChooseAdOptionsProtocol {
    
   func getNewOffer()
    var view: PresenterToViewChooseAdOptionsProtocol? { get set }
    var interactor: PresenterToInteractorChooseAdOptionsProtocol? { get set }
    var router: PresenterToRouterChooseAdOptionsProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorChooseAdOptionsProtocol {
    func makeRequest(completion: @escaping (Offer, [PresentableModel])-> Void)
    var presenter: InteractorToPresenterChooseAdOptionsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterChooseAdOptionsProtocol {
    func passDecodedData(offer: Offer)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterChooseAdOptionsProtocol {
    
}
