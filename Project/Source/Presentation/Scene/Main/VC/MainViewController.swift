import UIKit
import Then
import SnapKit

final class MainViewController: baseVC<MainViewModel> {
    
    // MARK: - Properties
    private let contentView = UIView()
    
    private let contentScrollView = UIScrollView()
    
    private let maintitleLabel = UILabel().then {
        $0.text = "gabozago"
        $0.font = UIFont(name: GabozagoFontFamily.BmJuaOtf.regular.name, size: 28)
        $0.textColor = GabozagoAsset.Colors.gabozagoMainColor.color
    }
    
    private lazy var plusBtn = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(plusBtnDidTap(_:))).then {
        $0.tintColor = GabozagoAsset.Colors.gabozagoMainColor.color
    }
    
    private let postTableView = UITableView().then() {
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        $0.layer.cornerRadius = 13
        $0.rowHeight = 232
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = GabozagoAsset.Colors.gabozagoBackGroundColor.color
        
    }
    
    // MARK: - Method
    @objc private func plusBtnDidTap(_ sender: UIBarButtonItem) {
        viewModel.pushCreatePostVC()
    }
    
    override func configureVC() {
        postTableView.delegate = self
        postTableView.dataSource = self
        
        self.navigationItem.titleView = maintitleLabel
        self.navigationItem.rightBarButtonItem = plusBtn
        
        navigationController?.navigationBar.barTintColor = GabozagoAsset.Colors.gabozagoBackGroundColor.color
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func addView() {
        view.backgroundColor = GabozagoAsset.Colors.gabozagoBackGroundColor.color
        view.addSubViews(maintitleLabel, postTableView)
    }
    
    override func setLayout() {
        maintitleLabel.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        postTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(26)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - Extension
extension MainViewController: hearBtnTableVeiwCellDelegate {
    func heartBtnDidTap(id: String) -> Bool {
        viewModel.heartViewIsVisibleDidTap()
        return viewModel.heartViewIsVisible.value
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()}
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
