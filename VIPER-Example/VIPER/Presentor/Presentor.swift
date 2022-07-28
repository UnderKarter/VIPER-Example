//
//  Presentor.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//

import Foundation

protocol AnyPresenterProtocol: AnyObject {
    var router: AnyRouterProtocol? { get set }
    var interactor: AnyInteractorProtocol? { get set }
    var view: AnyViewProtocol? { get set }
    var settingsPoints: [SettingsModel]? { get set }

    func interactorGetStartigSettings()
    func interactorDidFetchSettingsPoints(with result: [SettingsModel])
    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsModel?
    func numberOfRowsInSection(_ section: Int) -> Int
    func numberOfSections() -> Int
    func openAnotherScreen()
    func pushViewController(_ viewController: AnyViewProtocol)

}

class SettingsAppPresenter: AnyPresenterProtocol {

    //MARK: - Properties

    var interactor: AnyInteractorProtocol?
    var view: AnyViewProtocol?
    var router: AnyRouterProtocol?
    var settingsPoints: [SettingsModel]?

    //MARK: - Functions

    func interactorGetStartigSettings() {
        interactor?.getSettingsTable()
    }

    func interactorDidFetchSettingsPoints(with result: [SettingsModel]) {
        settingsPoints = result
    }

    func getCurrentSettingsPoint(with indexPath: IndexPath) -> SettingsModel? {
        guard let settingsPoints = settingsPoints else { return nil }
        return settingsPoints[indexPath.section]
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        guard let settingsPoints = settingsPoints else { return 0 }
        return settingsPoints.count
    }

    func numberOfSections() -> Int {
        guard let settingsPoints = settingsPoints else { return 0 }
        return settingsPoints.count
    }

    func openAnotherScreen() {
        router?.openAnotherScreen()
    }

    func pushViewController(_ viewController: AnyViewProtocol) {
        view?.pushViewController(viewController)
    }
}
