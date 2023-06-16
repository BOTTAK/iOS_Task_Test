import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourDataModelName")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Failed to load persistent store: \(error)")
            }
        }
        return container
    }()
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveCarProfiles(_ carProfiles: [CarProfile]) {
        for carProfile in carProfiles {
            let entity = NSEntityDescription.entity(forEntityName: "CarProfileEntity", in: context)!
            let carProfileObject = NSManagedObject(entity: entity, insertInto: context)
            carProfileObject.setValue(carProfile.brand, forKey: "brand")
            carProfileObject.setValue(carProfile.model, forKey: "model")
            carProfileObject.setValue(carProfile.images, forKey: "images")
            do {
                try context.save()
            } catch {
                print("Failed to save car profiles: \(error)")
            }
        }
    }
    
    func fetchCarProfiles() -> [CarProfile] {
        let fetchRequest: NSFetchRequest<CarProfileEntity> = CarProfileEntity.fetchRequest()
        do {
            let carProfileEntities = try context.fetch(fetchRequest)
            let carProfiles = carProfileEntities.map { _ in CarProfile(brand: carProfileEntities.first?.brand ?? "", model: carProfileEntities.first?.model ?? "", images: [carProfileEntities.first?.images ?? ""], description: carProfileEntities.first?.desctiption ?? "") }
            return carProfiles
        } catch {
            print("Failed to fetch car profiles: \(error)")
            return []
        }
    }
}
