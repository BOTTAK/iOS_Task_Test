import UIKit

struct CarProfile: Decodable {
    let brand: String
    let model: String
    let images: [String]
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case brand, model, images, description
    }
}
