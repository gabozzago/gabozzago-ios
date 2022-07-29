import UIKit
import GoogleSignIn
import SnapKit

//CGRect(x: 250, y: 244, width: 20, height: 20)

final class LoginViewController: baseVC<LoginViewModel>{
    
    private let cloudLeftView = CloudView().then{
        $0.frame = CGRect(x: 27, y: 74, width: 112, height: 64)
    }
    private let cloudRightView = CloudView()
    
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
    
    private let googleSigiInButton = UIButton().then{
        $0.setTitle("Sign in with Google", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.setImage(UIImage(named: "Google_Logo"), for: .normal)
        $0.backgroundColor = .white
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
    
    
    
    override func configureVC() {
        view.backgroundColor = GabozagoIOSAsset.Colors.gabozagoBackGroundColor.color
    }
    
    override func setup() {
        
    }
    
    override func setLayout() {
        googleSigiInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.bottom.equalToSuperview().offset(-100)
            $0.leading.trailing.equalToSuperview().inset(63)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(121)
        }
        subLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
        }
        cloudRightView.snp.makeConstraints{
            $0.top.equalTo(cloudLeftView.snp.bottom)
            $0.height.equalTo(2)
        }
       
    }
    
    override func addView() {
        view.addSubViews(googleSigiInButton,titleLabel,titleLabel,subLabel,cloudLeftView,cloudRightView)
    }
    
}
