//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Vineet Kumar on 28/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListVM()
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: orderListVM.orders)
            
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.black)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                })
                .sheet(isPresented: $showModal, content: {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                })
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
