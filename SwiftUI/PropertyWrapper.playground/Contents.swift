import UIKit
import SwiftUI

@propertyWrapper
class UpperCase {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            value = newValue.uppercased()
        }
    }
}

struct Driver {
    
    @UpperCase
    var license: String
    
    @UpperCase
    var state: String
    
    // bug in Xcode had to manually set init to define type of license
    init(license: String) {
        self.license = license
    }
}
    
var driver = Driver(license: "Brt567")
driver.state = "tx"
     
print(driver.license)
print(driver.state)

@propertyWrapper
class URLEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
}

struct Resource {
    
    @URLEncode
    var city: String
    
    var url: String {
        "https://nqienewndnio/\(city)"
    }
    
    init(city: String) {
        self.city = city
    }
}

var resource = Resource(city: "Los Angeles")
print(resource.city) // URL Encoded city
print(resource.url)


