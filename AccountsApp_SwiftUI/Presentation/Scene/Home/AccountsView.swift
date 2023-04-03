
//  ContentView.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 28/07/22.
//

import SwiftUI

struct AccountsView: View {
    @ObservedObject var getTransactionViewModel: FetchTransactionViewModel
    @ObservedObject var getBalanceViewModel: GetBalanceViewModel
    
    @State var isShowing: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("Total Balance : \(getBalanceViewModel.balance ?? "") ")
                
                List(getTransactionViewModel.responseObj ?? [], id: \.self) { item in
                    
                    HStack {
                        Circle()
                            .fill(item.type == "credit" ? .green : .red)
                            .frame(width: 15, height: 15)
                        
                        
                        Text(item.title ?? "")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(item.type == "credit" ? "+" : "-") \(item.transactionAmount ?? 0)")
                            .font(.subheadline)
                    }
                }
            }
            
            
            .navigationBarTitle("Account Details", displayMode: .inline)
            .navigationBarItems(leading: Button {
                
            } label: {
                
                NavigationLink {
                    ProfileView(viewModel: CreateAccountViewModel())
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .tint(.black)
                }
                
            }, trailing: Button {
                isShowing = true
                
            } label: {
                
                Image(systemName: "plus")
                    .tint(.black)
                
            }.sheet(isPresented: $isShowing, onDismiss: {
                
            }, content: {
                AddAccountDetailsView(viewModel: AddTransactionViewModel(), dismiss: { isSuccess in
                    if isSuccess {
                        getBalanceViewModel.onAppear()
                        getTransactionViewModel.onAppear()
                    }
                })
            })
            )
        }
        .onAppear {
            getBalanceViewModel.onAppear()
            getTransactionViewModel.onAppear()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView(getTransactionViewModel: FetchTransactionViewModel(), getBalanceViewModel: GetBalanceViewModel())
    }
}
