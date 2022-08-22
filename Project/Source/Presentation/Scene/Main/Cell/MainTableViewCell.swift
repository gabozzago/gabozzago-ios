import UIKit
import Then
import SnapKit

protocol hearBtnTableVeiwCellDelegate: AnyObject {
    func heartBtnDidTap(id: String) -> Bool
}

final class MainTableViewCell: baseTableViewCell<PostModel> {
    
    // MARK: - Properties
    weak var delegate: hearBtnTableVeiwCellDelegate?
    
    static let reuseIdentifier = "MainTableViewCell"
    
    private let postImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "doc.badge.plus")
        $0.backgroundColor = .init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private lazy var heartBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(heartViewDidTap(_:)), for: .touchUpInside)
    }
    
    private let bottomContentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private let postTitleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.text = "safda"
    }
    
    private let postDescriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .init(red: 0.49, green: 0.49, blue: 0.49, alpha: 1)
        $0.text = "description"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    @objc private func heartViewDidTap(_ sender: UIButton) {
        let visible = delegate?.heartBtnDidTap(id: model?.id ?? "") ?? false
        
        heartBtn.setImage(UIImage(systemName: visible ? "heart.fill" : "heart"), for: .normal)
        heartBtn.tintColor = visible ? .init(red: 0.94, green: 0.28, blue: 0.28, alpha: 1) : .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
        self.backgroundColor = GabozagoAsset.Colors.gabozagoBackGroundColor.color
    }
    
    override func addView() {
        contentView.addSubViews(bottomContentView, postImageView, heartBtn)
        bottomContentView.addSubViews(postTitleLabel, postDescriptionLabel)
    }
    
    override func setLayout() {
        postImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        heartBtn.snp.makeConstraints {
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
