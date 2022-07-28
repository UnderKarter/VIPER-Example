//
//  UserViewController.swift
//  VIPER-Example
//
//  Created by temp user on 14.07.2022.
//

import UIKit

protocol AnyViewProtocol {
    var presenter: AnyPresenterProtocol? { get set }
    
    func getSettingsTable(with settings: SettingsModel)
    func pushViewController(_ viewController: AnyViewProtocol)
}

class UserViewController: UIViewController, AnyViewProtocol {
    
    //MARK: - Properties
    var model = SettingsModel()
    
    weak var presenter: AnyPresenterProtocol?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(StaticTableViewCell.self, forCellReuseIdentifier: StaticTableViewCell.reuseIdentifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.reuseIdentifier)
        tableView.register(AttentionTableViewCell.self, forCellReuseIdentifier: AttentionTableViewCell.reuseIdentifier)
        tableView.register(StatusModeTableViewCell.self, forCellReuseIdentifier: StatusModeTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Settings

    func getSettingsTable(with settings: SettingsModel) {
        self.model = settings
    }

    func setupHierarchy() {
        view.addSubview(tableView)
    }

    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }

    func pushViewController(_ viewController: AnyViewProtocol) {
        guard let newViewController = viewController as? UIViewController else { return }
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension UserViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.configurate().count

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.configurate()[section].option.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model.configurate()[indexPath.section].option[indexPath.row]

        switch model.self {
        case .cell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StaticTableViewCell.reuseIdentifier, for: indexPath) as? StaticTableViewCell else {
                return UITableViewCell() }
            cell.configurate(model: model)
            return cell
        case .switchCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.reuseIdentifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell() }
            cell.configurate(model: model)
            return cell
        case .attantionCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AttentionTableViewCell.reuseIdentifier, for: indexPath) as? AttentionTableViewCell else {
                return UITableViewCell() }
            cell.configurate(model: model)
            return cell
        case .statusModeCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StatusModeTableViewCell.reuseIdentifier, for: indexPath) as? StatusModeTableViewCell else {
                return UITableViewCell() }
            cell.configurate(model: model)
            return cell
        }
    }
}

extension UserViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = model.configurate()[indexPath.section].option[indexPath.row]

        switch type.self {
        case .cell(let model):
            model.handler()
        case .switchCell(model: let model):
            model.handler()
        case .attantionCell(model: let model):
            model.handler()
        case .statusModeCell(model: let model):
            model.handler()
        }
    }
}

// MARK: - Metrics

extension MainCell {
    struct Cell {
        static let iconContainer: CGFloat = 15
        static let cornerRadius: CGFloat = 8
        static let iconContainerLeft: CGFloat = 20
        static let iconSize: CGFloat = 0.65
        static let labelLeft: CGFloat = 10
        static let containerCornerRadius: CGFloat = 7
        static let attentionFontSize: CGFloat = 15
        static let attentionContainer: CGFloat = 20
        static let attentionContainerRight: CGFloat = -20
        static let statusModeRight: CGFloat = -10
    }
}

