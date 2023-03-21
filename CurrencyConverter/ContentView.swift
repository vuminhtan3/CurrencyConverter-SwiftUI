//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Minh Tan Vu on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    var body: some View {
        ZStack{
            //Background Image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //Prancing pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //Currency Exchange text
                Text("Currency Exchange")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                //Currency conversion section
                HStack{
                    //Left conversion section
                    VStack {
                        HStack {
                            //Coin icon
                            Image("silverpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Coin name
                            Text("Silver piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -3)
                        
                        //Textfield
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        
                    }
                    //Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    //Right conversion section
                    VStack {
                        HStack {
                            //Coin name
                            Text("Gold piece")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            //Coin icon
                            Image("goldpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -3)
                        
                        //Textfield
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                
                //Info button
                HStack{
                    Spacer()
                    
                    Button{
                        //Display exchange info screen
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
