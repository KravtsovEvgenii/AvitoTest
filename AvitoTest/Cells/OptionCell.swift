//
//  OptionCell.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//

import UIKit

class OptionCell: UICollectionViewCell {
    static let reuseId = "OptionCell"
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    var discriptionLabel = UILabel()
    var priceLabel = UILabel()
    var checkMarkImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    //MARK: Setup UI
    private func setupUI() {
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemBackground
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 4
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        checkMarkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkMarkImageView.image = UIImage(named: "checkmark")
        checkMarkImageView.isHidden = true
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        self.addSubview(discriptionLabel)
        self.addSubview(priceLabel)
        self.addSubview(checkMarkImageView)
        //title label
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = Constant.cellTitleLabelFont
        //discription label
        discriptionLabel.numberOfLines = 0
        discriptionLabel.adjustsFontSizeToFitWidth = true
        discriptionLabel.font = Constant.cellDiscriptionLabelFont
        //price label
        priceLabel.font = Constant.cellPriceLabelFont
        setupConstraints()
    }
    private func setupConstraints() {
        //icon image view
        iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        //Checkmark
        checkMarkImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        checkMarkImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        checkMarkImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkMarkImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        //title label
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: checkMarkImageView.leadingAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //discriptionLabel
        discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        discriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        discriptionLabel.trailingAnchor.constraint(equalTo: checkMarkImageView.leadingAnchor, constant: -8).isActive = true
        discriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -42).isActive = true
        //priceLabel
        priceLabel.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 8).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: checkMarkImageView.leadingAnchor, constant: -8).isActive = true
    }
    //MARK: Configure Cell
    func configureCell(withItem item: PresentableModel) {
        self.titleLabel.text = item.title
        self.discriptionLabel.text = item.description
        self.priceLabel.text = item.price
        self.iconImageView.image = item.image
        self.checkMarkImageView.isHidden = !item.isSelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
