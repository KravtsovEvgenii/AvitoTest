//
//  ChooseAdOptionsRouter.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//  
//

import Foundation
import UIKit

class ChooseAdOptionsRouter: PresenterToRouterChooseAdOptionsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ChooseAdOptionsViewController()
        
        let presenter: ViewToPresenterChooseAdOptionsProtocol & InteractorToPresenterChooseAdOptionsProtocol = ChooseAdOptionsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ChooseAdOptionsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ChooseAdOptionsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
