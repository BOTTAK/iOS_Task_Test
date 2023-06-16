import UIKit

final class AppHelper: NSObject {
    
    func createInititalScreen() -> UIViewController {
        let viewController = CarsTableViewScreen()
        
        return viewController
    }
    
}
