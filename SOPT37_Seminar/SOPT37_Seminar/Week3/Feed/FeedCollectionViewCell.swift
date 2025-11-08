//
//  FeedCollectionViewCell.swift
//  SOPT37_Seminar
//
//  Created by sun on 11/1/25.
//

import UIKit
import SnapKit

// MARK: - Delegate Protocol

protocol FeedCollectionViewCellDelegate: AnyObject {
    func didTapScrapButton(_ cell: FeedCollectionViewCell)
}

final class FeedCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "FeedCollectionViewCell"

    // MARK: - Delegate

    weak var delegate: FeedCollectionViewCellDelegate?
    
    // MARK: - UI Components
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .orange
        return label
    }()
    
    let scrapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ic_scrap"), for: .normal)
        button.setImage(UIImage(named: "ic_scrap_fill"), for: .selected)
        return button
    }()


    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            itemImageView,
            nameLabel,
            priceLabel,
            scrapButton
        )
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.height.equalTo(itemImageView.snp.width)
        }
        
        scrapButton.snp.makeConstraints {
            $0.trailing.equalTo(itemImageView).inset(8)
            $0.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(itemImageView).inset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(itemImageView).inset(8)
        }
    }
    
    private func setAddTarget() {
        scrapButton.addTarget(self, action: #selector(scrapButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func scrapButtonTapped() {
        delegate?.didTapScrapButton(self)
    }
    
    // MARK: - Configuration
    
    func configure(feed: FeedModel) {
        itemImageView.image = feed.itemImg
        nameLabel.text = feed.name
        priceLabel.text = feed.price
        scrapButton.isSelected = feed.isScrap
    }
}
