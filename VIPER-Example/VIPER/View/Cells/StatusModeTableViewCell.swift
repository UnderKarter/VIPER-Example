//
//  StatusModeTableViewCell.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//

import UIKit

class StatusModeTableViewCell: MainCell {

    static let reuseIdentifier = "StatusModeTableViewCell"

    let mode: UILabel = {
        let mode = UILabel()
        mode.numberOfLines = 1
        mode.textColor = .systemGray
        mode.backgroundColor = .clear
        return mode
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupHierarchy() {
        super.setupHierarchy()
        contentView.addSubview(mode)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        label.text = nil
        mode.text = nil
    }

    public func configurate(model: SettingsModeStatusType) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        mode.text = model.selectedMode
    }

    // MARK: - SetupLayout
    override func setupLayout() {
        super.setupLayout()
        mode.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mode.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Cell.statusModeRight),
            mode.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
