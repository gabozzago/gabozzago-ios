import Foundation

final class MainViewModel: baseViewModel {
    
    var heartViewIsVisible = Observable(false)
    
    func heartViewIsVisibleDidTap() {
        heartViewIsVisible.value.toggle()
    }
    
    func pushCreatePostVC() {
        print(coordinator)
        coordinator.navigate(to: .createPostIsRequired)
        
    }
}
