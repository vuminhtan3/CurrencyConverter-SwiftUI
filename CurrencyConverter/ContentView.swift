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
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "leftCurrency")) ?? .copperPenny
    @State var rightCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "rightCurrency")) ?? .goldPiece
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    @FocusState var leftIsFocused : Bool
    @FocusState var rightIsFocused : Bool
    
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
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Coin name
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -3)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //Textfield
                        TextField("Amount", text: $leftAmount, onEditingChanged: { typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                                UserDefaults.standard.set(leftCurrency.rawValue, forKey: "leftCurrency")
                            }
                            .focused($leftIsFocused)
                        
                    }
                    //Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    //Right conversion section
                    VStack {
                        HStack {
                            //Coin name
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            //Coin icon
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -3)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //Textfield
                        TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .multilineTextAlignment(TextAlignment.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                                UserDefaults.standard.set(rightCurrency.rawValue, forKey: "rightCurrency")
                            }
                            .focused($rightIsFocused)
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
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
            }
        }
        .onTapGesture {
            leftIsFocused = false
            rightIsFocused = false
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
