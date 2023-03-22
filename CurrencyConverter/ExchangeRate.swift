//
//  ExchangeRate.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 22/03/2023.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var rightImage: String
    @State var exchangeRateText: String
    
    var body: some View {
        HStack {
            //Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(exchangeRateText)
            
            //Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "silverpenny", rightImage: "copperpenny", exchangeRateText: "1 Silver Penny = 100 Copper Pennies")
            .previewLayout(.sizeThatFits)
    }
}
