import UIKit


struct PersonStruct {
    var name: String
}

class PersonClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let personsStruct = [PersonStruct(name: "Manish"), PersonStruct(name: "Vineet")]
let personsClass = [PersonClass(name: "Manish"), PersonClass(name: "Vineet")]


// Struct - No change to original struct
var name1 = personsStruct[0]
name1.name = "Vineet"
personsStruct.forEach({print($0.name)}) // Prints ["Manish","Vineet"]

if var anotherName = personsStruct.first {
    anotherName.name = "Vineet" // Compiler forces to make object mutable // Shows object will change
}
personsStruct.forEach({print($0.name)}) // Prints ["Manish","Vineet"]

// Class - No change to original class
var name2 = personsClass[0]
name2.name = "Vineet"
personsClass.forEach({print($0.name)}) // Prints ["Vineet","Vineet"]

if let another1Name = personsClass.first {
    another1Name.name = "Vineet" // Compiler forces to make property mutable // Shows property will change
}
personsClass.forEach({print($0.name)}) // Prints ["Vineet","Vineet"]



