import UIKit

final class CloudView: UIView{
    
    private let circle1 = UIView().then{
        $0.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        $0.frame = CGRect(x: 10, y: 0, width: 68, height: 42)
        $0.layer.cornerRadius = 25
    }
    
    private let circle2 = UIView().then{
        $0.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        $0.frame = CGRect(x: 37, y: -13, width: 62, height: 62)
        $0.layer.cornerRadius = 31
    }
    
    private let circle3 = UIView().then{
        $0.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        $0.frame = CGRect(x: 75, y: 4, width: 47, height: 36)
        $0.layer.cornerRadius = 20
    }
    
    init() {
          super.init(frame: .zero)
          addView()
          setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CloudView {
    func addView() {
        self.addSubViews(circle1, circle2, circle3)
    }
    func setLayout(){
    }
}
