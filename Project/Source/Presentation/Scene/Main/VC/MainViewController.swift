import UIKit
import Then
import SnapKit

class MainViewController: baseVC<MainViewModel> {
    private let maintitleLabel = UILabel().then {
        $0.text = "gabozago"
        $0.font = UIFont(name: "BMJUAOTF", size: 28)
        $0.textColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
    }
    
    private lazy var plusBtn = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(plusBtnDidTap(_:))).then {
        $0.tintColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
    }
    
    private let postTableView = UITableView().then() {
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        $0.layer.cornerRadius = 13
        $0.rowHeight = 232
        $0.separatorStyle = .none
    }
    
    
    @objc private func plusBtnDidTap(_ sender: UIBarButtonItem) {
        
    }
    
    override func configureVC() {
        postTableView.dataSource = self
        postTableView.delegate = self
        setNavigation()
    }
    
    override func addView() {
        view.backgroundColor = .init(red: 0.82, green: 0.86, blue: 1, alpha: 1)
        view.addSubViews(maintitleLabel, postTableView)
    }
    
    override func setLayout() {
        maintitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        postTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(27)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setNavigation() {
        self.navigationItem.titleView = maintitleLabel
        self.navigationItem.rightBarButtonItem = plusBtn
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()}
        cell.selectionStyle = .none
        cell.backgroundColor = .init(red: 0.82, green: 0.86, blue: 1, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
