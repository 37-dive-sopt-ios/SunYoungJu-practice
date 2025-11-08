//
//  LoginViewController_CustomView.swift
//  SOPT37_Seminar
//
//  Created by sun on 11/1/25.
//

//import UIKit
//
//final class LoginViewController_CustomView: UIViewController {
//
//    // MARK: - Properties
//    private let rootView = LoginView()
//
//    // MARK: - Life Cycle
//    override func loadView() {
//        self.view = rootView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setAddTarget()
//    }
//
//    // MARK: - setup
//    private func setAddTarget() {
//        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
//    }
//
//    @objc
//    private func loginButtonDidTap() {
//        pushToWelcomeVC()
//    }
//
//    // MARK: - Private Methods
//    private func pushToWelcomeVC() {
//        let welcomeViewController = WelcomeViewController_MVC()
//        welcomeViewController.id = rootView.idTextField.text
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
//    }
//}
