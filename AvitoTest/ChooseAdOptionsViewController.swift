//
//  ChooseAdOptionsViewController.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//  
//

import UIKit

class ChooseAdOptionsViewController: UIViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterChooseAdOptionsProtocol?
    var collectionView: UICollectionView!
    var header: Header!
    var items: [PresentableModel] = []
    var crossButton: UIButton!
    var topTitleLabel: UILabel!
    var bottomButton: UIButton!
    var choosedItem: PresentableModel!
    var isUserSelect = false
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupUI()
        self.presenter?.getNewOffer()
    }
}
//MARK: PresenterToViewChooseAdOptionsProtocol
extension ChooseAdOptionsViewController: PresenterToViewChooseAdOptionsProtocol{
    func presentViewModel(items: [PresentableModel], withHeader header: Header) {
        topTitleLabel.text = header.title
        self.items = items
        self.header = header
        collectionView.reloadData()
        guard !isUserSelect else {return}
        bottomButton.setTitle(header.denyActionTitle, for: .normal)
    }
}

//MARK: Setup CollectionView
extension ChooseAdOptionsViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCell.reuseId, for: indexPath) as! OptionCell
        let item = items[indexPath.row]
        cell.configureCell(withItem: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isUserSelect = true
        for i in 0..<items.count {
            items[i].isSelected = false
        }
        items[indexPath.row].isSelected = true
        choosedItem = items[indexPath.row]
        bottomButton.setTitle(header.actionTitle, for: .normal)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.row]
       
        let width = collectionView.bounds.width * 0.7
        let titleLabelHeight = item.title.calculateHeight(width: width, font: Constant.cellTitleLabelFont)
        let descriptionLabelHeight = item.description?.calculateHeight(width: width, font: Constant.cellDiscriptionLabelFont) ?? 0
        let priceLabelHeight = item.price.calculateHeight(width: width, font: Constant.cellPriceLabelFont)
        let overallHeight = titleLabelHeight  + descriptionLabelHeight + priceLabelHeight + 55
        return CGSize(width: collectionView.bounds.width - 8, height: overallHeight)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OptionCell.self, forCellWithReuseIdentifier: OptionCell.reuseId)
        collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}
//MARK: Setup UI
extension ChooseAdOptionsViewController {
    private func setupUI() {
        //cross
        crossButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        crossButton.isUserInteractionEnabled = false
        crossButton.setImage(UIImage(named: "cross"), for: .normal)
        //top label
        topTitleLabel = UILabel()
        topTitleLabel.font = Constant.offerScreenTopLabelFont
        topTitleLabel.numberOfLines = 0
        topTitleLabel.textColor = .black
        //bottom button
        bottomButton = UIButton(type: .system)
        bottomButton.backgroundColor = .systemBlue
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.titleLabel?.font = Constant.offerScreenBottomButtonFont
        bottomButton.layer.cornerRadius = 10
        bottomButton.addTarget(self, action: #selector(bottomButtonAction), for: .touchUpInside)
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        topTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.addSubview(crossButton)
        view.addSubview(topTitleLabel)
        view.addSubview(collectionView)
        view.addSubview(bottomButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        //cross
        crossButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        crossButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        //top label
        topTitleLabel.topAnchor.constraint(equalTo: crossButton.bottomAnchor, constant: 4).isActive = true
        topTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        topTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        //collectionView
        collectionView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        //bottom button
        bottomButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
    }
    //Button Action
    @objc private func bottomButtonAction() {
        let title = isUserSelect ? "Выбор сделан":"Ничего не выбрано"
        let message = isUserSelect ? choosedItem.title:""
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
