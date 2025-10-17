//
//  LoginViewController.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/11/25.
//

import UIKit

final class LoginViewController: UIViewController {

    private enum LoginType { case id, phone }

    // MARK: - UI

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = UIColor(named: "Black")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .pretendard(.bold, size: 18)
        return label
    }()

    private let loginTypeSegment: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["아이디", "휴대폰"])
        seg.frame = CGRect(x: 60, y: 210, width: 250, height: 32)
        seg.selectedSegmentIndex = 0
        seg.selectedSegmentTintColor = UIColor(named: "Primary_orange")
        seg.setTitleTextAttributes([.foregroundColor: UIColor(named: "White") as Any], for: .selected)
        seg.setTitleTextAttributes([.foregroundColor: UIColor(named: "Grey400") as Any], for: .normal)
        return seg
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
        let
        textField = UITextField(frame: CGRect(x: 20, y: 325, width: 335, height: 52))
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

    // MARK: - State
    
    private var currentType: LoginType = .id

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "White")
        setLayout()
        applyTextFieldStyle()
        setupHideKeyboardWhenTappedAround()

        idTextField.delegate = self
        passwordTextField.delegate = self
        loginTypeSegment.addTarget(self, action: #selector(loginTypeChanged), for: .valueChanged)
    }

    // MARK: - Layout
    
    private func setLayout() {
        [titleLabel, loginTypeSegment, idTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - TextField Style
    
    private func applyTextFieldStyle() {
        [idTextField, passwordTextField].forEach {
            $0.addLeftPadding(12)
            $0.addRightPadding(12)
            $0.clearButtonMode = .whileEditing
            $0.attributedPlaceholder = NSAttributedString(
                string: $0.placeholder ?? "",
                attributes: [.foregroundColor: UIColor(named: "Grey400") as Any]
            )
        }
        idTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
    }

    // MARK: - Present
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.id = idTextField.text
        present(welcomeVC, animated: true)
    }

    // MARK: - Actions
    
    @objc
    private func loginButtonDidTap() {
        view.endEditing(true)
        presentToWelcomeVC()
    }

    @objc
    private func loginTypeChanged() {
        let type: LoginType = (loginTypeSegment.selectedSegmentIndex == 0) ? .id : .phone
        updateInputUI(for: type)
    }

    // MARK: - Helpers
    
    private func updateInputUI(for type: LoginType) {
        currentType = type
        idTextField.text = nil

        switch type {
        case .id:
            idTextField.placeholder = "아이디를 입력해주세요"
            idTextField.autocapitalizationType = .none

        case .phone:
            idTextField.placeholder = "휴대폰 번호를 입력해주세요 (숫자만)"
            idTextField.autocapitalizationType = .none
        }

        idTextField.attributedPlaceholder = NSAttributedString(
            string: idTextField.placeholder ?? "",
            attributes: [.foregroundColor: UIColor(named: "Grey400") as Any]
        )
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            loginButtonDidTap()
        }
        return true
    }
}
