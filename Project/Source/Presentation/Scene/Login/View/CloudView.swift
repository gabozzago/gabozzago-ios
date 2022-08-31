import UIKit

final class CloudView: UIView{
    
    private let mainView = UIView().then{
        $0.frame = CGRect(x: 10, y: 0, width: 0, height: 0)
    }
    
    private let circle1 = UIView().then{
        $0.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        $0.frame = CGRect(x: 10, y: 0, width: 0, height: 0)
    }
    
    private let circle2 = UIView().then{
        $0.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        $0.frame = CGRect(x: 10, y: 0, width: 0, height: 0)
    }
    
    private let circle3 = UIView().then{
        $0.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        $0.frame = CGRect(x: 10, y: 0, width: 0, height: 0)
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

//frame = CGRect(x: 10, y: 0, width: 68, height: 42)

extension CloudView {
    func addView() {
        addSubview(mainView)
        mainView.addSubViews(circle1, circle2, circle3)
    }
    func setLayout(){
        circle2.snp.makeConstraints{
            $0.leading.equalTo(circle1.snp.trailing).offset(-40)
            $0.top.equalTo(circle1.snp.top).offset(-13)
        }

        circle3.snp.makeConstraints{
            $0.leading.equalTo(circle2.snp.trailing).offset(-30)
        }
    }
    func setSizeCircle(width: Int, height: Int, radius: CGFloat) {
        circle1.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(height)
        }
        circle1.layer.cornerRadius = (radius)
        
        circle2.snp.makeConstraints{
            $0.width.equalTo((width)-6)
            $0.height.equalTo((height)+20)
        }
        circle2.layer.cornerRadius = (radius)+6
        
        circle3.snp.makeConstraints{
            $0.width.equalTo((width)-21)
            $0.height.equalTo((height)-6)
        }
        circle3.layer.cornerRadius = (radius)-5
        
    }
}
