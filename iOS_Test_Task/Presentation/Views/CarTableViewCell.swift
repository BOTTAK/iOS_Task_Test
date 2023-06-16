import UIKit

class CarTableViewCell: UITableViewCell {

    //------------------------------------------------------------------------------
    // MARK:-
    // MARK:- Properties
    //------------------------------------------------------------------------------
    let brandName: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let modelName: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .medium)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let modelImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 13
        return image
    }()
    
    var carProfiles: [CarProfile] = []
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(modelImage)
        modelImage.translatesAutoresizingMaskIntoConstraints = false
        modelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        modelImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        modelImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        modelImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        contentView.addSubview(brandName)
        brandName.translatesAutoresizingMaskIntoConstraints = false
        brandName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        brandName.leadingAnchor.constraint(equalTo: modelImage.trailingAnchor, constant: 20).isActive = true
        
        contentView.addSubview(modelName)
        modelName.translatesAutoresizingMaskIntoConstraints = false
        modelName.topAnchor.constraint(equalTo: brandName.bottomAnchor, constant: 5).isActive = true
        modelName.leadingAnchor.constraint(equalTo: modelImage.trailingAnchor, constant: 20).isActive = true
    }

    func convertImagesToString(_ images: [String]) -> String {
        return images.joined(separator: ", ")
    }
    
    func configure(with carProfile: CarProfile) {
        brandName.text = carProfile.brand
        modelName.text = carProfile.model
        if let lastImageName = carProfile.images.last {
            modelImage.image = UIImage(named: lastImageName)
        }
    }
    
}
