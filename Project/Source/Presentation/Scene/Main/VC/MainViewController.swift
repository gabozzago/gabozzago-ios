import UIKit
import Then
import SnapKit
import SwiftUI

final class MainViewController: baseVC<MainViewModel> {
    
    private let contentView = UIView()
    
    private let contentScrollView = UIScrollView()
    
    private let maintitleLabel = UILabel().then {
        $0.text = "gabozago"
        $0.font = UIFont(name: "BMJUAOTF", size: 28)
        $0.textColor = GabozagoIOSAsset.Colors.gabozagoMainColor.color
    }
    
    private lazy var plusBtn = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(plusBtnDidTap(_:))).then {
        $0.tintColor = GabozagoIOSAsset.Colors.gabozagoMainColor.color
    }
    
    private let postTableView = UITableView().then() {
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        $0.layer.cornerRadius = 13
        $0.rowHeight = 232
        $0.separatorStyle = .none
    }
    
    @objc private func plusBtnDidTap(_ sender: UIBarButtonItem) {
        
    }
    
    //뷰가 나타나기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.postTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    //화면에 나타난 직후
    override func viewWillDisappear(_ animated: Bool) {
        self.postTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if object is UITableView {
                if let newValue = change?[.newKey] as? CGSize {
                    postTableView.snp.updateConstraints {
                        $0.height.equalTo(newValue.height + 50)
                    }
                }
            }
        }
    }
    
    override func configureVC() {
        postTableView.delegate = self
        postTableView.dataSource = self

        self.navigationItem.titleView = maintitleLabel
        self.navigationItem.rightBarButtonItem = plusBtn
    }
    
    override func addView() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        view.backgroundColor = GabozagoIOSAsset.Colors.gabozagoBackGroundColor.color
        contentView.addSubViews(maintitleLabel, postTableView)
    }
    
    override func setLayout() {
        contentScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.centerX.width.top.bottom.equalToSuperview()
        }
        
        maintitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        postTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
}

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()}
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
