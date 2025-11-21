//
//  WelcomeViewController_Network.swift
//  SOPT37_Seminar
//
//  Created by sun on 11/8/25.
//

import UIKit
import SnapKit

final class WelcomeViewController_Network: BaseViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다!"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    // MARK: - Properties
    
    // MARK: - Init
    
    public init() {

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI Setup
    
    private func setHierarchy() {
        
        view.addSubviews(
            titleLabel,
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func getUserButtonTapped() {

    }

    @objc private func updateUserButtonTapped() {

    }
    
    @objc private func deleteUserButtonTapped() {
        showDeleteConfirmation()
    }
    
    
    // MARK: - Helpers
    // TODO: 추후 분리
    
    private func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 8
        return button
    }
    
    
    private func showDeleteConfirmation() {

    }
}
