//
//  AddOrderView.swift
//  CoreDataWithSwiftUI
//
//  Created by Vineet Kumar on 30/09/20.
//

import SwiftUI

struct AddOrderView: View {
    
    @State var addOrderVM = AddOrderVM()
    @Binding var isPresented: Bool
    
    var body: some View {
        
        NavigationView {
            Group {
                VStack {
                    
                    TextField("Enter name", text: $addOrderVM.name)
                    
                    Picker(selection: $addOrderVM.type, label: Text(""), content: {
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("ex")
                    }).pickerStyle(SegmentedPickerStyle())
                    
                    Button("Place order") {
                        self.addOrderVM.saveOrder()
                        isPresented = false
                    }.padding(8)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(18)
                }
            }.padding()
            .navigationTitle("Add order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
