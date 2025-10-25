//
//  WelcomeViewController.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/11/25.
//

import UIKit

final class WelcomeViewController: UIViewController {

    // MARK: - Properties
    
    var id: String?

    // MARK: - UI
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "carrot")
        return imageView
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "게스트님 \n반가워요!"
        label.font = .pretendard(.extraBold, size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(named: "Main_black")
        return label
    }()

    private let goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(named: "Primary_orange")
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor(named: "Main_white"), for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()

    private let backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(named: "Grey200")
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(named: "Grey400"), for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main_white")
        setLayout()
        bindID()

        goHomeButton.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
        backToLoginButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }

    // MARK: - Layout
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Bind
    
    private func bindID() {
        let name = (id?.isEmpty == false) ? id! : "게스트"
        welcomeLabel.text = "\(name)님\n반가워요!"
    }

    // MARK: - Actions
    
    @objc private func goHomeButtonDidTap() {
        dismiss(animated: true)
    }

    @objc private func backToLoginButtonDidTap() {
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
