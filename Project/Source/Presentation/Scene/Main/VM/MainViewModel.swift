import UIKit

final class MainViewModel: baseViewModel {
    
    // MARK: - Properties
    var heartViewIsVisible = Observable(false)
    
    // MARK: - Method
    func heartViewIsVisibleDidTap() {
        heartViewIsVisible.value.toggle()
    }
    
    func pushCreatePostVC() {
        coordinator.navigate(to: .createPostIsRequired)
    }
}
