import UIKit
import GoogleSignIn
import SnapKit
import AuthenticationServices

final class LoginViewController: baseVC<LoginViewModel>{
    
    private let cloudLeftView = CloudView().then{
        $0.frame = CGRect(x: 27, y: 74, width: 0, height: 0)
        $0.setSizeCircle(width: 68, height: 42, radius: 25)
    }
    
    private let cloudRightView = CloudView().then{
        $0.frame = CGRect(x: 300, y: 224, width: 0, height: 0)
        $0.setSizeCircle(width: 68, height: 42, radius: 25)
    }
    
    private let titleLabel = UILabel().then{
        $0.text = "Hello!"
        $0.font = UIFont(font: GabozagoIOSFontFamily.BmJuaOtf.regular, size: 32)
        $0.textColor = GabozagoIOSAsset.Colors.gabozagoMainColor.color
    }
    
    private let subLabel = UILabel().then{
        $0.text = "gabozago의 첫걸음을 떼보세요!"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
    }
    
    private lazy var googleSigiInButton = UIButton().then{
        $0.setTitle("Sign in with Google", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.setImage(UIImage(named: "Google_Logo"), for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(googleLogin(_:)), for: .touchUpInside)
        $0.layer.cornerRadius = 7
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        if #available(iOS 15.0, *) {
            $0.configuration = .plain()
            $0.configuration?.imagePadding = 28
            $0.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = .systemFont(ofSize: 17)
                return outgoing
            }
        } else {
            $0.contentEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 5)
        }
    }
    
    private let appleSigninButton = ASAuthorizationAppleIDButton(type: .continue, style: .white)
    
    let signInConfig = GIDConfiguration.init(clientID: "972483262448-voo2oik79u7cob8pc78jca1kqmnacp3q.apps.googleusercontent.com")
    
    
    override func configureVC() {
        view.backgroundColor = GabozagoIOSAsset.Colors.gabozagoBackGroundColor.color
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(121)
        }
        subLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
        }
        googleSigiInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.bottom.equalToSuperview().offset(-100)
            $0.leading.trailing.equalToSuperview().inset(63)
        }
        appleSigninButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.bottom.equalTo(googleSigiInButton.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(63)
        }
       
    }
    
    override func addView() {
        view.addSubViews(googleSigiInButton,appleSigninButton,titleLabel,titleLabel,subLabel,cloudLeftView,cloudRightView)
        }
    
    @objc func googleLogin(_ sender: UIButton) {
         
        GIDSignIn.sharedInstance.signIn(with: self.signInConfig, presenting: self) { user, error in
             guard error == nil else { return }
             guard user != nil else { return }
             
             user?.authentication.do { authentication, error in
                     guard error == nil else { print(error as Any); return }
                     guard let authentication = authentication else { return }
                 
                     let token = authentication.idToken
                 
                     print("token")
                     print(token)
                 
                     
                 }
             
             }
         }

    }

