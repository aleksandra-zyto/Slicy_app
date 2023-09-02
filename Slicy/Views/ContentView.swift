//
//  ContentView.swift
//  Slicy
//
//  Created by Ola Żyto on 24/08/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var pizza1 = Pizza(name: "", size: "", price: "")
    @State private var pizza2 = Pizza(name: "", size: "", price: "")
    
    
    var body: some View {
        NavigationView {
            
            VStack(){
                
                Image("pizza-slice-2")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                
                Section{
                    Text("Option One")
                        .modifier(TitleMod())
                    Text("Pizza name")
                        .modifier(SubTitleMod())
                    TextField("", text: $pizza1.name)
                        .modifier(InputMod())
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    Text("Price")
                        .modifier(SubTitleMod())
                    TextField("\(currencyPlaceholderText(for:  Locale.current))", text: $pizza1.price)
                        .modifier(InputMod())
                        .keyboardType(.decimalPad)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    Text("Diameter")
                        .modifier(SubTitleMod())
                    TextField("Pizza Diameter", text: $pizza1.size)
                        .modifier(InputMod())
                        .keyboardType(.decimalPad)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                }
                
                Spacer()
                
                Section{
                    Text("Option Two")
                        .modifier(TitleMod())
                    Text("Pizza name")
                        .modifier(SubTitleMod())
                    TextField("", text: $pizza2.name)
                        .modifier(InputMod())
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    Text("Price")
                        .modifier(SubTitleMod())
                    TextField("\(currencyPlaceholderText(for:  Locale.current))", text: $pizza2.price)
                        .modifier(InputMod())
                        .keyboardType(.decimalPad)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    Text("Diameter")
                        .modifier(SubTitleMod())
                    TextField("Pizza Diameter", text: $pizza2.size)
                        .modifier(InputMod())
                        .keyboardType(.decimalPad)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                }
                
                Divider()
                
                Spacer()
                
                NavigationLink(destination: ResultsView(pizza1: $pizza1, pizza2: $pizza2)){
                    Text("Calculate")
                        .padding(.horizontal, 10)
                        .frame(width: 370, height: 45)        .background(K.mainOrange)
                        .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    
                }
                
                
            }.padding(.vertical, 20)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: - custom modifiers



struct InputMod : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .frame(width: 370, height: 37)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(K.mainOrange)
                )
            
            
    }
    
}


struct TitleMod : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.bottom, -2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 20))
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .bold()
    }
    
}

struct SubTitleMod : ViewModifier{  
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.top, 1)
            .padding(.bottom, -4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
    }
    
}


//MARK: - Hide keyboard

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


func currencyPlaceholderText(for locale: Locale) -> String {
    let currencySymbol = locale.currencySymbol ?? "$" // Default to "$" if no symbol is found
    return "\(currencySymbol)"
}
