//
//  StarViewRepresentation.swift
//  XcodePreviewForUIKit
//
//  Created by Vineet Kumar on 29/09/20.
//

import Foundation
import SwiftUI

// UiKit control represented in Swift UI View
struct StarViewRepresentation: UIViewRepresentable {

    @Binding var selected: Bool
    
    typealias UIViewType = StarView
    
    func makeUIView(context: Context) -> StarView {
        let starView = StarView()
        return starView
    }
    
    func updateUIView(_ uiView: StarView, context: Context) {
        uiView.selected = self.selected
    }
}
