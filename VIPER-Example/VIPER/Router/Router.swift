//
//  Router.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//

import Foundation
import UIKit

protocol AnyRouterProtocol {
    var presenter: AnyPresenterProtocol? { get }

    static func start() -> AnyRouterProtocol
    func openAnotherScreen()
}

class UserRouter: AnyRouterProtocol {
    weak var presenter: AnyPresenterProtocol?

    static func start() -> AnyRouterProtocol {
        let router = UserRouter()

        var view: AnyViewProtocol = UserViewController()
        let interactor: AnyInteractorProtocol = UserInteractor()
        let presentor: AnyPresenterProtocol = SettingsAppPresenter()

        view.presenter = presentor
        interactor.presenter = presentor
        router.presenter = presentor

        presentor.router = router
        presentor.view = view
        presentor.interactor = interactor
        
        return router
    }

    func openAnotherScreen() {
        let newViewController = UserViewController()
        presenter?.pushViewController(newViewController)
    }
}
