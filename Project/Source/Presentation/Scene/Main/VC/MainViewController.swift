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
    
    private let postTableView = UITableView().then {
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        $0.layer.cornerRadius = 13
    }
    
    
    @objc private func plusBtnDidTap(_ sender: UIBarButtonItem) {
        
    }
    
    override func configureVC() {
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
            $0.height.equalTo(232)
        }
    }
    
    func setNavigation() {
        self.navigationItem.titleView = maintitleLabel
        self.navigationItem.rightBarButtonItem = plusBtn
    }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()}
        
        return cell
    }
    

}
