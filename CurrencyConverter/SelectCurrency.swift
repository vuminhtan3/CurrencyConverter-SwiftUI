//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 22/03/2023.
//

import SwiftUI

struct SelectCurrency: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency
                LazyVGrid(columns: gridLayout) {
                    ForEach(0..<5) { _ in
                        CurrencyIcon(currencyImage: "copperpenny", currencyName: "Copper Penny")
                    }
                }
                
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //Currency
               
                
                //Done Button
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(5)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(10)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency()
    }
}
