//
//  DelegateWelcomeViewController.swift
//  SOPT37_Seminar
//
//  Created by sun on 10/18/25.
//

import UIKit

protocol WelcomeReloginDelegate: AnyObject {
    func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String)
}

public final class DelegateWelcomeViewController: UIViewController {
    
    // MARK: - Delegate & State
    
    var id: String?
    weak var delegate: WelcomeReloginDelegate?
    
    // MARK: - UI
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage.carrot
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
    
    private lazy var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(named: "Primary_orange")
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor(named: "Main_white"), for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(named: "Grey200")
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(named: "Grey400"), for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
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
        bindID()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Bind
    
    private func bindID() {
        let trimmed = (id ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmed.isEmpty {
            welcomeLabel.text = "\(trimmed)님\n반가워요!"
        } else {
            welcomeLabel.text = "???님\n반가워요!"
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func goHomeButtonDidTap() {
        if let nav = navigationController {
            nav.popToRootViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        delegate?.retryLogin(self, didTapReloginWith: "다시 로그인 버튼을 눌렀어요!")
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}


