//
//  ScrollViewController.swift
//  suntudy
//
//  Created by sun on 10/18/25.
//

import UIKit
import SnapKit
import Then

final class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.alwaysBounceVertical = true
    }
    
    private let contentView = UIView()
    
    private let redView = UIView().then { $0.backgroundColor = .red }
    private let orangeView = UIView().then { $0.backgroundColor = .orange }
    private let yellowView = UIView().then { $0.backgroundColor = .yellow }
    private let greenView = UIView().then { $0.backgroundColor = .green }
    private let blueView = UIView().then { $0.backgroundColor = .blue }
    private let purpleView = UIView().then { $0.backgroundColor = .purple }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            // contentView 높이는 스크롤을 위해 최소한으로 설정
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        let boxHeight: CGFloat = 300
        
        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(boxHeight)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(redView.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(boxHeight)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(boxHeight)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(boxHeight)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(boxHeight)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(boxHeight)
            $0.bottom.equalToSuperview()
        }
    }
}


//#Preview{
//    ScrollViewController()
//}
//
