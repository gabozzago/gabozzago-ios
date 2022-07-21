import UIKit
import Then

class MainTableViewCell: UITableViewCell {
    
    let postImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let bottomContentView = UIView()
    
    let postTitleLabel = UILabel().then {
        $0.font = UIFont(name: "", size: 14)
    }
    
    let postDescriptionLabel = UILabel().then {
        $0.font = UIFont(name: "", size: 13)
    }
    
    func addView() {
        contentView.addSubViews(postImageView, bottomContentView)
        bottomContentView.addSubViews(postTitleLabel, postDescriptionLabel)
    }
}
