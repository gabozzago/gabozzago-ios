import Foundation

class MainViewModel: baseViewModel {
    
    var heartViewIsVisible = Observable(false)
    
    func heartViewIsVisibleDidTap() {
        heartViewIsVisible.value.toggle()
    }
    
}


//extension MainViewModel: hearBtnTableVeiwCellDelegate {
//    func heartBtnDidTap(id: String) {
//        <#code#>
//    }
//
    
//}
