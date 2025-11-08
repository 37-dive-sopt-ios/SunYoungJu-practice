////
////  WelcomeViewController_MVC.swift
////  SOPT37_Seminar
////
////  Created by sun on 11/1/25.
////
//
//import UIKit
//
//import SnapKit
//import Then
//
//protocol WWelcomeReloginDelegate: AnyObject {
//    func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String)
//}
//
//public final class WelcomeViewController_MVC: UIViewController {
//    
//    // MARK: - Delegate & State
//    public var id: String?
//    weak var delegate: WWelcomeReloginDelegate?
//    
//    // MARK: - UI
//    private let logoImageView = UIImageView().then {
//        $0.image = UIImage.carrot
//        $0.contentMode = .scaleAspectFit
//    }
//    
//    private let welcomeLabel = UILabel().then {
//        $0.text = "게스트님 \n반가워요!"
//        $0.font = .pretendard(.extraBold, size: 25)
//        $0.textAlignment = .center
//        $0.numberOfLines = 2
//        $0.textColor = UIColor(named: "Main_black")
//    }
//    
//    private lazy var goHomeButton = UIButton(type: .system).then {
//        $0.backgroundColor = UIColor(named: "Primary_orange")
//        $0.setTitle("메인으로", for: .normal)
//        $0.setTitleColor(UIColor(named: "Main_white"), for: .normal)
//        $0.titleLabel?.font = .pretendard(.bold, size: 18)
//        $0.layer.cornerRadius = 8
//        $0.clipsToBounds = true
//        $0.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
//    }
//    
//    private lazy var backToLoginButton = UIButton(type: .system).then {
//        $0.backgroundColor = UIColor(named: "Grey200")
//        $0.setTitle("다시 로그인", for: .normal)
//        $0.setTitleColor(UIColor(named: "Grey400"), for: .normal)
//        $0.titleLabel?.font = .pretendard(.bold, size: 18)
//        $0.layer.cornerRadius = 8
//        $0.clipsToBounds = true
//        $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
//    }
//    
//    // MARK: - Init
//    
//    init(id: String? = nil, delegate: WWelcomeReloginDelegate? = nil) {
//        self.id = id
//        self.delegate = delegate
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
//    
//    // MARK: - Life Cycle
//    public override func viewDidLoad() {
//        super.viewDidLoad()
//        setUI()
//        setLayout()
//        bindID()
//    }
//    
//    private func setUI() {
//        view.backgroundColor = .white
//    }
//    
//    // MARK: - Layout
//    private func setLayout() {
//        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach { view.addSubview($0) }
//        
//        logoImageView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide).offset(87)
//            $0.centerX.equalToSuperview()
//            $0.width.height.equalTo(150)
//        }
//        
//        welcomeLabel.snp.makeConstraints {
//            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(95)
//            $0.height.equalTo(60)
//        }
//        
//        goHomeButton.snp.makeConstraints {
//            $0.top.equalTo(welcomeLabel.snp.bottom).offset(71)
//            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.equalTo(58)
//        }
//        
//        backToLoginButton.snp.makeConstraints {
//            $0.top.equalTo(goHomeButton.snp.bottom).offset(14)
//            $0.leading.trailing.equalTo(goHomeButton)
//            $0.height.equalTo(58)
//        }
//    }
//    
//    // MARK: - Bind
//    
//    private func bindID() {
//        let trimmed = (id ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
//        if !trimmed.isEmpty {
//            welcomeLabel.text = "\(trimmed)님\n반가워요!"
//        } else {
//            welcomeLabel.text = "???님\n반가워요!"
//        }
//    }
//    
//    // MARK: - Actions
//    
//    @objc
//    private func goHomeButtonDidTap() {
//        if let nav = navigationController {
//            nav.popToRootViewController(animated: true)
//        } else {
//            dismiss(animated: true)
//        }
//    }
//    
//    @objc
//    private func backToLoginButtonDidTap() {
//        delegate?.retryLogin(self, didTapReloginWith: "다시 로그인 버튼을 눌렀어요!")
//        if let nav = navigationController {
//            nav.popViewController(animated: true)
//        } else {
//            dismiss(animated: true)
//        }
//    }
//}
