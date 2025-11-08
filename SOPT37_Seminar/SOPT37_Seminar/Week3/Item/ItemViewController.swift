////
////  ItemViewController.swift
////  SOPT37_Seminar
////
////  Created by sun on 11/1/25.
////
//
//import UIKit
//
//import SnapKit
//
//final class ItemViewController: UIViewController {
//
//    final let carrotLineSpacing: CGFloat = 10
//    final let carrotInterItemSpacing: CGFloat = 21
//    final let cellHeight: CGFloat = 198
//    final let carrotInset = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
//    
//    private var itemData = ItemModel.dummy()
//    
//    private func calculateCellHeight() -> CGFloat {
//        let count = CGFloat(itemData.count)
//        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
//        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
//    }
//
//    private let collectionView : UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return collectionView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = .white
//        
//        setLayout()
//        register()
//        setDelegate()
//    }
//    
//    private func setLayout() {
//        self.view.addSubview(collectionView)
//        
//        collectionView.snp.makeConstraints {
//            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
//            $0.bottom.equalToSuperview()
//        }
//    }
//    
//    private func register() {
//        collectionView.register(
//            ItemCollectionViewCell.self,
//            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
//        )
//    }
//    
//    private func setDelegate() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//}
//
//extension ItemViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let screenWidth = UIScreen.main.bounds.width
//        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
//        return CGSize(width: doubleCellWidth / 2, height: 198)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return carrotLineSpacing
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return carrotInterItemSpacing
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return carrotInset
//    }
//}
//
//extension ItemViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return itemData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
//        cell.dataBind(itemData[indexPath.item])
//        return cell
//    }
//}
