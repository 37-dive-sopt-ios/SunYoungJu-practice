//
//  LoginViewController.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/11/25.
//

import UIKit

final class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = UIColor(named: "Black")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .pretendard(.bold, size: 18)
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 260, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = .pretendard(.semiBold, size: 14)
        textField.backgroundColor = UIColor(named: "Grey200")
        textField.textColor = UIColor(named: "Black")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 325, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = .pretendard(.semiBold, size: 14)
        textField.backgroundColor = UIColor(named: "Grey200")
        textField.textColor = UIColor(named: "Black")
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 420, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "Primary_orange")
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(named: "White"), for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
        applyTextFieldStyle()
        setupHideKeyboardWhenTappedAround()
    }

    // MARK: - Layout

    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - TextField Style

    private func applyTextFieldStyle() {
        [idTextField, passwordTextField].forEach {
            $0.addLeftPadding(12)
            $0.addRightPadding(12)
            $0.clearButtonMode = .whileEditing
        }
    }

  // MARK: - Present
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }

//    private func pushToWelcomeVC() {
//        let welcomeViewController = WelcomeViewController()
//        welcomeViewController.id = idTextField.text
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
//    }
    
    // MARK: - Actions

    @objc
    private func loginButtonDidTap() {
        view.endEditing(true)
        presentToWelcomeVC()
        // pushToWelcomeVC()
    }
}
