import UIKit
import GoogleSignIn
import SnapKit

final class LoginViewController: baseVC<LoginViewModel>{
    
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
            $0.configuration?.imagePadding = 20
            $0.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = .systemFont(ofSize: 20)
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
            $0.height.equalTo(51)
            $0.bottom.equalToSuperview().offset(-100)
            $0.leading.trailing.equalToSuperview().inset(80)
        }
        
    }
    
    override func addView() {
        view.addSubview(googleSigiInButton)
    }
    
}
