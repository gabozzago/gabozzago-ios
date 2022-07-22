import UIKit
import GoogleSignIn
import SnapKit

final class LoginViewController: baseVC<LoginViewModel>{
    
    private let titleLabel = UILabel().then{
        $0.text = "Hello!"
        $0.font = .systemFont(ofSize: 32)
        $0.textColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
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
        view.backgroundColor = .white
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
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
        }
        
    }
    
    override func addView() {
        view.addSubview(googleSigiInButton)
        view.addSubview(titleLabel)
        view.addSubview(subLabel)
    }
    
}
