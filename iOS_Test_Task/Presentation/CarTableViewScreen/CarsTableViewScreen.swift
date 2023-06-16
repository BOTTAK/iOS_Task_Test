import UIKit

class CarsTableViewScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cell = "CarTableViewCell"
    let carNetworkWorker = CarNetworkWorkers()
    let contactsTableView = UITableView()
    var carProfiles: [CarProfile] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.register(CarTableViewCell.self, forCellReuseIdentifier: "CarTableViewCell")
        setupUI()
        updateCarProfiles(with: carProfiles)
        
        
    }
    
    private func updateCarProfiles(with carProfiles: [CarProfile]) {
        DispatchQueue.main.async {
            CarNetworkWorkers.shared.fetchData { result in
                switch result {
                case.success(let resultFromServer):
                    self.carProfiles = resultFromServer
                    self.contactsTableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func setupUI() {
        view.addSubview(contactsTableView)
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    //MARK: UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carProfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as! CarTableViewCell
        let carProfile = carProfiles[indexPath.row]
        cell.configure(with: carProfile)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailCarScreen()
        vc.modalPresentationStyle = .formSheet
        vc.carProfiles = [carProfiles[indexPath.row]]
        present(vc, animated: true)
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}
