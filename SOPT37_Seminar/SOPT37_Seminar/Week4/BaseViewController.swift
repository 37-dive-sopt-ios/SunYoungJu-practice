//
//  BaseViewController.swift
//  SOPT37_Seminar
//
//  Created by sun on 11/8/25.
//

import UIKit

/// - POP(Protocol Oriented Programming) 적용
open class BaseViewController: UIViewController, Alertable, LoadingIndicatorable {
    
    // MARK: - UI Components
    
    /// Loading Indicator 공통 컴포넌트 (모든 하위 ViewController에서 사용 가능)
    public let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemBlue
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // MARK: - LifeCycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setBaseUI()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 하위 클래스에서 뷰를 추가한 후에도 항상 loadingIndicator가 최상위에 위치하게 하도록 함
        view.bringSubviewToFront(loadingIndicator)
    }
    
    // MARK: - UI Setup
    open func setBaseUI() {
        view.backgroundColor = .white
        
        view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // 탭 제스처로 키보드 닫기
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Methods
    
    /// 키보드 닫기
    @objc
    open func dismissKeyboard() {
        view.endEditing(true)
    }
}
