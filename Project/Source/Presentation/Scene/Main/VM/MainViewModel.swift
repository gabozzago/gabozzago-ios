import Foundation

final class MainViewModel: baseViewModel {
    
    var heartViewIsVisible = Observable(false)
    
    func heartViewIsVisibleDidTap() {
        heartViewIsVisible.value.toggle()
    }
    
    func pushCreatePostVC() {
        coordinator.navigate(to: .createPostIsRequired)
    }
}
