//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 22/03/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            //Background
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack{
                // Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                //Contents
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the intire world, exceptont. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                .font(.title2)
                .padding()
                
               //Exchange Rate 1
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", exchangeRateText: "1 Gold Piece = 4 Gold Pennies")
                
                //Exchange Rate 2
                 ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", exchangeRateText: "1 Gold Penny = 4 Silver Pieces")
                 
                //Exchange Rate 3
                 ExchangeRate(leftImage: "silverpiece", rightImage: "silverpenny", exchangeRateText: "1 Silver Piece = 4 Silver Pennies")
                 
                //Exchange Rate 4
                 ExchangeRate(leftImage: "silverpenny", rightImage: "copperpenny", exchangeRateText: "1 Silver Penny = 100 Copper Pennies")
                 
                //Done Button
                Button ("Done"){
                    dismiss()
                }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(5)
                    .background(.brown)
                    .cornerRadius(10)
            }
        }
        .foregroundColor(.black)
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}
