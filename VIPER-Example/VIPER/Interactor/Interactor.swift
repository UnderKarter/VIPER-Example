//
//  Interactor.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//

import Foundation

protocol AnyInteractorProtocol: AnyObject {
    var presenter: AnyPresenterProtocol? { get set }

    func getSettingsTable ()
}

class UserInteractor: AnyInteractorProtocol {

    var presenter: AnyPresenterProtocol?

    func getSettingsTable() {
        let entity = SettingsModel()
        self.presenter?.interactorDidFetchSettingsPoints(with: [entity])
    }
}
