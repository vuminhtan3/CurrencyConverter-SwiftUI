//
//  CurrencyIcon.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 23/03/2023.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyImage: String
    @State var currencyName: String
    var body: some View {
        ZStack {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            VStack{
                Spacer()
                
                Text(currencyName)
                    .background(.brown.opacity(0.75))
                    .font(.caption)
                
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct Currency_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(currencyImage: "copperpenny", currencyName: "Copper Penny")
            .previewLayout(.sizeThatFits)
    }
}
