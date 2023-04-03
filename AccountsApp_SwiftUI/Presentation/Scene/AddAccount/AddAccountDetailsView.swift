//
//  AddAccountDetailsView.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 28/07/22.
//

import SwiftUI
import Domain

struct AddAccountDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddTransactionViewModel
    var dismiss: ((Bool) -> Void)?
    @State var showAlert = false
    
    var trasactionType = ["Credit", "Debit"]
    @State var selectedType: String?
    @State var amountText: String = ""
    @State var titleText: String = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField(
                    "Title",
                    text: $titleText
                    
                )
                .padding()
                .textFieldStyle(.roundedBorder)
                
                TextField(
                    "Amount",
                    text: $amountText
                    
                )
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                
                
                HStack {
                    ForEach(trasactionType, id:  \.self) { type in
                        RadioView(selectedType: $selectedType, type: type)
                    }
                    .padding()
                }
                
                Button {
                    addData()
                } label: {
                    Text("Add Entry")
                }
                .padding()
                .frame(width: 150)
                .foregroundColor(Color.mint)
                .background(Color.mint.opacity(0.2))
                .clipShape(Capsule())
                .font(.system(size: 14))
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text(viewModel.messsage ?? ""))
                }
            }
        }
    }
    
    func addData() {
        let model = AccountsModel(transactionType: selectedType?.lowercased(), amount: Int(amountText), title: titleText)
        
        viewModel.addTransaction(forRequest: model) { isSuccess in
            
            if isSuccess {
                if let dismiss = dismiss {
                    dismiss(isSuccess)
                }
                presentationMode.wrappedValue.dismiss()
                
            } else {
                showAlert.toggle()
            }
        }
    }
}

struct AddAccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountDetailsView(viewModel: AddTransactionViewModel(), dismiss: {_ in })
    }
}
