//
//  IconGrid.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 30/03/2023.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5) { i in
                if Currency.allCases[i] == currency {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyName: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.6))
                        .shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyName: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
            }
        }
        .padding([.bottom,.trailing,.leading])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.copperPenny))
    }
}
