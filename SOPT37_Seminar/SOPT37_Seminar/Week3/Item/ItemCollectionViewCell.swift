////
////  ItemCollectionViewCell.swift
////  SOPT37_Seminar
////
////  Created by sun on 11/1/25.
////
//
//
//import UIKit
//
//final class ItemCollectionViewCell: UICollectionViewCell {
//    
//    static let identifier = "ItemCollectionViewCell"
//    
//    private let itemImageView = UIImageView()
//    
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = UIFont(name: "Pretendard-Regular", size: 16)
//        return label
//    }()
//    
//    private let priceLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .orange
//        label.textAlignment = .left
//        label.font = .boldSystemFont(ofSize: 15)
//        return label
//    }()
//    
//    private lazy var heartButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "heartBlack"), for: .normal)
//        button.setImage(UIImage(named: "heartRed"), for: .selected)
//        return button
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.backgroundColor = .white
//        setLayout()
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setLayout() {
//        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
//            contentView.addSubview($0)
//        }
//        
//        itemImageView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.horizontalEdges.equalToSuperview().inset(9)
//            $0.bottom.equalToSuperview().inset(59)
//        }
//        
//        nameLabel.snp.makeConstraints {
//            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
//            $0.leading.equalToSuperview().offset(9)
//        }
//        
//        priceLabel.snp.makeConstraints {
//            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
//            $0.leading.equalToSuperview().offset(9)
//        }
//        
//        heartButton.snp.makeConstraints {
//            $0.trailing.bottom.equalTo(itemImageView).inset(8)
//            $0.size.equalTo(16)
//        }
//    }
//}
//
//extension ItemCollectionViewCell {
//    func dataBind(_ itemData: ItemModel) {
//        itemImageView.image = itemData.itemImg
//        nameLabel.text = itemData.name
//        priceLabel.text =  itemData.price + "원"
//        heartButton.isSelected = itemData.heartIsSelected
//     }
//}
