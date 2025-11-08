//
//  ClosureLoginViewController.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/18/25.
//

import UIKit

final class ClosureLoginViewController: UIViewController {
    
    // MARK: - UI
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = UIColor(named: "Main_black")
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
        textField.textColor = UIColor(named: "Main_black")
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
        textField.textColor = UIColor(named: "Main_black")
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 420, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "Primary_orange")
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(named: "Main_hite"), for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Navigation
    
    private func presentToWelcomeVC() {
        let welcomeViewController = ClosureWelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            guard let self = self else { return }
            
            self.titleLabel.text = message
            self.idTextField.text = ""
            self.passwordTextField.text = ""
            loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = ClosureWelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            
            guard let self = self else { return }
            
            self.titleLabel.text = message
            self.idTextField.text = ""
            self.passwordTextField.text = ""
            self.loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // MARK: - Actions
    
    @objc
    private func loginButtonDidTap() {
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
}
