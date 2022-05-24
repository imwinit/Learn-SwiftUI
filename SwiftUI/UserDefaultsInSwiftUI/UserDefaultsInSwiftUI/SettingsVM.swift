//
//  SettingsVM.swift
//  UserDefaultsInSwiftUI
//
//  Created by Vineet Kumar on 01/10/20.
//

import Foundation

class SettingsVM: ObservableObject {
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
}
