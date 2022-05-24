//
//  CreditCard.swift
//  CreditCardUI
//
//  Created by Vineet Kumar on 06/10/20.
//

import SwiftUI

struct CreditCard<Content: View>: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    
    let name: String
    let expires: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("VISA")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Text("**** **** **** 2454")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Spacer()
            
            HStack {
                
                VStack(alignment: .leading, spacing: nil, content: {
                  
                    Text("CARD HOLDER")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(name)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                })
                
                Spacer()
                
                VStack {
                    Text("EXPIRES")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Text(expires)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }

        }.frame(width: 300, height: 200)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
    }
}

struct CreditCardBack: View {
    
    let cvv: String
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 20, maxHeight: 20, alignment: .center)
                .padding([.top])
            
            Spacer()
            
            HStack {
                
                Text(cvv)
                    .foregroundColor(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20, alignment: .center)
                    .background(Color.white)
                
                Spacer()
            }.padding()

        }.frame(width: 300, height: 200, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content: {CreditCardFront(name: "Vineet Kumar", expires: "04/25")})
    }
}
