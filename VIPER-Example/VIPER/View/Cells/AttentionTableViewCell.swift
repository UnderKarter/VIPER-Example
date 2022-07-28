//
//  AttentionTableViewCell.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//

import UIKit

class AttentionTableViewCell: MainCell {

    static let reuseIdentifier = "AttantionTableViewCell"

    let attentionConteiner: UIView = {
        let attentionContainer = UIView()
        attentionContainer.backgroundColor = .systemRed
        return attentionContainer
    }()

    let attantion: UILabel = {
        let attention = UILabel()
        attention.textColor = .white
        attention.contentMode = .scaleToFill
        attention.font = UIFont.systemFont(ofSize: Cell.attentionFontSize)
        return attention
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

// MARK: - SetupHierarchy

    override func setupHierarchy() {
        super.setupHierarchy()
        contentView.addSubview(attentionConteiner)
        attentionConteiner.addSubview(attantion)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        label.text = nil
        attantion.text = nil
    }

    public func configurate(model: SettingsAttantionType) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        attentionConteiner.backgroundColor = model.attantionBackgroundColor
        attantion.text = model.attantionNumber
    }

// MARK: - SetupLayout
    
    override func setupLayout() {
        super.setupLayout()
        let attantionSize: CGFloat = contentView.frame.size.height - Cell.attentionContainer
        attentionConteiner.translatesAutoresizingMaskIntoConstraints = false
        attantion.translatesAutoresizingMaskIntoConstraints = false
        attentionConteiner.layer.cornerRadius = attantionSize / 2

        NSLayoutConstraint.activate([
            attentionConteiner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            attentionConteiner.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Cell.attentionContainerRight),
            attentionConteiner.widthAnchor.constraint(equalToConstant: attantionSize),
            attentionConteiner.heightAnchor.constraint(equalToConstant: attantionSize),
            attantion.centerYAnchor.constraint(equalTo: attentionConteiner.centerYAnchor),
            attantion.centerXAnchor.constraint(equalTo: attentionConteiner.centerXAnchor)
        ])
    }
}

