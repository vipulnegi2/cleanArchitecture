//
//  ProfileView.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 29/07/22.
//

import SwiftUI

struct ProfileView: View {
    @State var showAlert = false
    @State private var mobileNum = ""
    @ObservedObject var viewModel: CreateAccountViewModel
    @AppStorage("AuthHeader") var header: Int?
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        
                        Image(uiImage: UIImage(named: "userPlaceholder")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width * 0.3 , height: geo.size.width * 0.3)
                            .clipShape(Circle())
                            .padding(.top, 100)
                        
                        TextField("Enter Your Mobile Number", text: $mobileNum)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .font(.system(size: 14))
                            .padding()
                        
                        Button {
                            
                            viewModel.createAccount(mobile: Int(mobileNum) ?? 0) { _ in
                                self.showAlert.toggle()
                            }
                        } label: {
                            Text("Create Account")
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
                    
                    .frame(height: 180)
                }
            }
            .navigationBarTitle("Create Account", displayMode: .inline)
        }
        .onAppear {
            if header != nil {
                mobileNum = "\(header!)"
            }
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: CreateAccountViewModel())
    }
}

