//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 22/03/2023.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
    
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
                
                //Currency icons grid
                IconGrid(currency: $leftCurrency)
                
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //Currency icons grid
               IconGrid(currency: $rightCurrency)
                
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
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
