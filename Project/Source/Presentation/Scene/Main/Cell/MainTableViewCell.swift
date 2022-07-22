import UIKit
import Then
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    let postImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "doc.badge.plus")
        $0.backgroundColor = .init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    lazy var heartView = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(heartViewDidTap(_:)), for: .touchUpInside)
    }
    
    let bottomContentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
    }
    
    let postTitleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.text = "safda"
    }
    
    let postDescriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .init(red: 0.49, green: 0.49, blue: 0.49, alpha: 1)
        $0.text = "description"
    }
    
    @objc func heartViewDidTap(_ sender: UIButton) {
        heartView.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        heartView.tintColor = .init(red: 0.94, green: 0.28, blue: 0.28, alpha: 1)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }
    
    func addView() {
        contentView.addSubViews(bottomContentView, postImageView, heartView)
        bottomContentView.addSubViews(postTitleLabel, postDescriptionLabel)
    }
    
    func setLayout() {
        postImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        heartView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(26)
        }
        
        
        bottomContentView.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).inset(3)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        postTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        postDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(postTitleLabel.snp.bottom).inset(4)
            $0.leading.equalTo(postTitleLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
}
