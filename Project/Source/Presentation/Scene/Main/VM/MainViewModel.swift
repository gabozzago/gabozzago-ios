import Foundation

final class MainViewModel: baseViewModel {
    
    var heartViewIsVisible = Observable(false)
    
    func heartViewIsVisibleDidTap() {
        heartViewIsVisible.value.toggle()
    }
    
    func setMainVC() {
        coordinator.navigate(to: .mainIsRequired)
    }
    
    func pushCreatePostVC() {
        coordinator.navigate(to: .createPostIsRequired)
    }
}
