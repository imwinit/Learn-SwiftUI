//
//  ContentView.swift
//  CoreDataWithSwiftUI
//
//  Created by Vineet Kumar on 30/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListVM
    @State private var isPresented: Bool = false
    
    init() {
        self.orderListVM = OrderListVM()
    }
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(self.orderListVM.orders, id: \.name) { order in
                    HStack {
                        Image(order.type)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10)
                        
                        Text(order.name)
                            .padding([.leading], 10)
                    }
                }
                .onDelete(perform: { indexSet in
                    delete(at: indexSet)
                })
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("Dismiss")
                orderListVM.fetchAllOrders()
            }, content: {
                AddOrderView(isPresented: $isPresented)
            })
            .navigationBarTitle("Orders")
            .navigationBarItems(trailing: Button("Add new order") {
                isPresented = true
            })
        }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach { (index) in
            let orderVM = orderListVM.orders[index]
            orderListVM.deleteOrder(orderVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
