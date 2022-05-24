//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderVM()
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                Form {
                    
                    Section(header: Text("Information").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("Select Coffee").font(.body)) {
                        
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }

                    Section(header: Text("Select Coffee").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    HStack {
                        Button("Place order") {
                            self.addCoffeeOrderVM.placeOrder()
                            self.isPresented = false
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(10)
                }
            }
            .navigationBarTitle("Add order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeVM
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(16.0)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
