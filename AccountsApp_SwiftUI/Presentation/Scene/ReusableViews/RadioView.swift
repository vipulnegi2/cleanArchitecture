//
//  RadioView.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 28/07/22.
//

import SwiftUI

struct RadioView: View {
    @Binding var selectedType: String?
    var type: String
    
    var body: some View {
        Button {
            self.selectedType = type
        } label: {
            Text(type)
        }
        .padding()
        .foregroundColor(self.selectedType == type ? Color.indigo : Color.black)
        .background(self.selectedType == type ? Color.indigo.opacity(0.2) : Color.black.opacity(0.2))
        .clipShape(Capsule())
    }
}

