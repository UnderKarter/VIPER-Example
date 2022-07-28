//
//  StaticTableViewCell.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//
import UIKit

class StaticTableViewCell: MainCell {

    static let reuseIdentifier = "StaticTableViewCell"

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
    }

    override func setupLayout() {
        super.setupLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
    }

    public func configurate(model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
