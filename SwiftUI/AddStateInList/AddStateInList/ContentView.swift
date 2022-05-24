//
//  ContentView.swift
//  AddStateInList
//
//  Created by Vineet Kumar on 27/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var tasks : [Task] = []
    
    private func addTask() {
        self.tasks.append(Task(name: "Buy TV"))
    }
    
    var body: some View {
        
        List {
            
            Button(action: addTask) {
                Text("Add task")
            }
            
            ForEach(tasks) { task in
                Text(task.name)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
