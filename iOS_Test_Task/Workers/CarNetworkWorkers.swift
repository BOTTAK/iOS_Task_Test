import Foundation
import CoreData
import SystemConfiguration

struct CarNetworkWorkers {
    static let shared = CarNetworkWorkers()
    let reachability = Reach()
    let statusNetwork: Bool = true
    func fetchData(_ completion: @escaping (Result<[CarProfile], Error>) -> Void) {
        let url = URL(string: "https://api.npoint.io/d8e94df377858269fd9c")!
        if statusNetwork {
            reachability.monitorReachabilityChanges()
            URLSession.shared.fetchData(for: url) { (result: Result<[CarProfile], Error>) in
                switch result {
                case .success(let carProfiles):
                    CoreDataManager.shared.saveCarProfiles(carProfiles)
                    completion(.success(carProfiles))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            let carProfiles = CoreDataManager.shared.fetchCarProfiles()
            completion(.success(carProfiles))
        }
    }

}
