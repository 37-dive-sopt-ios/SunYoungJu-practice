//
//  LoginViewController_SnapKit.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/18/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewControllerSnapKit: UIViewController {
    
    // MARK: - UI
    
    private let titleLabel = UILabel().then {
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = UIColor(named: "Main_black")
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .pretendard(.bold, size: 18)
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = UIColor(named: "Grey200")
        $0.textColor = UIColor(named: "Main_black")
        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        
        let padding = UIView(frame: .init(x: 0, y: 0, width: 12, height: 0))
        $0.leftView = padding
        $0.leftViewMode = .always
        $0.clearButtonMode = .whileEditing
        $0.returnKeyType = .next
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = UIColor(named: "Grey200")
        $0.textColor = UIColor(named: "Main_black")
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        let padding = UIView(frame: .init(x: 0, y: 0, width: 12, height: 0))
        $0.leftView = padding
        $0.leftViewMode = .always
        $0.clearButtonMode = .whileEditing
        $0.returnKeyType = .done
    }
    
    private lazy var loginButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "Primary_orange")
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor(named: "Main_white"), for: .normal)
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main_white")
        setupLayout()
        setupActions()
        setupKeyboardDismiss()
    }
}

// MARK: - Layout

private extension LoginViewControllerSnapKit {
    func setupLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(123) // 기존 163에서 SafeArea 고려
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(58)
        }
    }
}

// MARK: - Actions

private extension LoginViewControllerSnapKit {
    func setupActions() {
        idTextField.addTarget(self, action: #selector(idReturnPressed), for: .editingDidEndOnExit)
        passwordTextField.addTarget(self, action: #selector(passwordReturnPressed), for: .editingDidEndOnExit)
    }
    
    @objc func idReturnPressed() {
        passwordTextField.becomeFirstResponder()
    }
    
    @objc func passwordReturnPressed() {
        passwordTextField.resignFirstResponder()
        loginButtonDidTap()
    }
    
    @objc func loginButtonDidTap() {
        // TODO: 로그인 로직 연결
        print("로그인 버튼 탭")
    }
}

// MARK: - Helpers
private extension LoginViewControllerSnapKit {
    func setupKeyboardDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
}
