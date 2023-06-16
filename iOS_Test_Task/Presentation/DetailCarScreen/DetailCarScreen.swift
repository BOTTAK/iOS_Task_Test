import UIKit

class DetailCarScreen: UIViewController {
    
    var carProfiles: [CarProfile] = []
    
    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let modelImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 13
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(modelImage)
        modelImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40).isActive = true
        modelImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        modelImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        modelImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func setupData() {
        titleLabel.text = carProfiles.last?.brand
        descriptionLabel.text = carProfiles.last?.description
        if let lastImage = carProfiles.last?.images.last {
            modelImage.image = UIImage(named: lastImage)
        }
    }
}
