import UIKit

class SettingsViewController: UIViewController {
    
    var settingsArray = [Section]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 10
        tableView.clipsToBounds = true
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings Lesson"
        
        view.backgroundColor = .systemBackground
        tableView.backgroundColor = .clear
        configureSettingsArray()
        setupTableView()
        
    }
    
    private func setupTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray[section].option.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = settingsArray[indexPath.section].option[indexPath.row]
        switch model.self{
        case .staticCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
            cell.configureWithModel(with: model)
            return cell
        case .switchCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as! SwitchTableViewCell
            cell.configureWithModel(with: model)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = settingsArray[indexPath.section].option[indexPath.row]
        switch type.self{
        case .staticCell(let model): model.handler()
        case .switchCell(let model): model.handler()
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = settingsArray[section]
        return model.title
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        tableView.reloadData()
    }
}

extension SettingsViewController{
    func configureSettingsArray() {
        self.settingsArray.append(Section(title: "General", option: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .orange, handler: {
                
            }, isOn: false)),
            
            .switchCell(model: SettingsSwitchOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, handler: {
                
            }, isOn: false)),
            
            .switchCell(model: SettingsSwitchOption(title: "Bluetooth", icon: UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill"), iconBackgroundColor: .systemGray, handler: {
                
            }, isOn: false)),
            .staticCell(model: SettingsOption(title: "Cellular", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Modem", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen, handler: {
                
            }))
            
            
        
    ]))
    
        self.settingsArray.append(Section(title: "General", option: [
            .staticCell(model: SettingsOption(title: "Notices", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemGreen) {
                print("Tapped first Cell")
            }),
            
                .staticCell(model: SettingsOption(title: "Speak", icon: UIImage(systemName: "speaker.wave.3.fill"), iconBackgroundColor: .systemPink) {
                
            }),
            .staticCell(model:SettingsOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .orange){
                
            }),
            .staticCell(model: SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple) {
                
            })
        ]))
        
        self.settingsArray.append(Section(title: "Information", option: [
            .staticCell(model: SettingsOption(title: "Main", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
                print("Tapped first Cell")
            }),
            
                .staticCell(model: SettingsOption(title: "Control Center", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray) {
                
            }),
            .staticCell(model: SettingsOption(title: "Screen and Brightness", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                
            }),
            
            .staticCell(model: SettingsOption(title: "Screen Home", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Universal Access", icon: UIImage(systemName: "person.badge.key"), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Wallpaper", icon: UIImage(systemName: "photo"), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "Siri", icon: UIImage(systemName: "waveform"), iconBackgroundColor: .systemPurple) {
                
            }),
            .staticCell(model: SettingsOption(title: "Face ID and code-password", icon: UIImage(systemName: "faceid"), iconBackgroundColor: .systemGreen) {
                
            }),
            .staticCell(model: SettingsOption(title: "Screen and Brightness", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                
            }),
            .staticCell(model: SettingsOption(title: "SOS", icon: UIImage(systemName: "sos"), iconBackgroundColor: .red) {
                
            }),
            .staticCell(model: SettingsOption(title: "Contact notifications", icon: UIImage(systemName: "sun.min"), iconBackgroundColor: .red) {
            }),
            .staticCell(model: SettingsOption(title: "Battery", icon: UIImage(systemName: "bolt.fill"), iconBackgroundColor: .systemGreen) {
            }),
            
            .staticCell(model: SettingsOption(title: "Privacy", icon: UIImage(systemName: "hand.raised.fill"), iconBackgroundColor: .systemBlue) {
            }),
        ]))
        
        self.settingsArray.append(Section(title: "Apps", option: [
            .staticCell(model: SettingsOption(title: "App Store", icon: UIImage(systemName: "a.square.fill"), iconBackgroundColor: .systemBlue) {
                print("Tapped first Cell")
            }),
            
                .staticCell(model: SettingsOption(title: "Wallet & Apple Pay", icon: UIImage(systemName: "wallet.pass.fill"), iconBackgroundColor: .black) {
                
            })
        ]))
                
    }
}

