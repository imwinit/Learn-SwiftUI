//
//  FlagDetailView.swift
//  FlagsOfTheWorld
//
//  Created by Vineet Kumar on 29/09/20.
//

import SwiftUI

struct FlagDetailView: View {
    
    @Binding var flagVM: FlagVM
    
    var body: some View {
        
        VStack {
            
            Text(flagVM.flag).font(.custom("Arial", size: 200))
            
            TextField("Enter country name", text: $flagVM.country)
                .padding()
                .fixedSize()
            
            Button("Submit") {
                self.flagVM.showModal.toggle()
            }
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flagVM: .constant(FlagVM()))
    }
}
