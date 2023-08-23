import Foundation
import UIKit

struct Section{
    let title: String
    let option: [SettingsOptionType]
}


enum SettingsOptionType{
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}
