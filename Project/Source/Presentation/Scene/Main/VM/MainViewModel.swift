import Foundation

class MainViewModel: baseViewModel {
    
    var heartViewIsVisible = Observable(false)
    
    func heartViewIsVisibleDidTap() {
        heartViewIsVisible.value.toggle()
    }
    
    func setMainVC() {
        coordinator.navigate(to: .mainIsRequired)
    }
}
