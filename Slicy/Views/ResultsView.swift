//
//  ResultsView.swift
//  Slicy
//
//  Created by Ola Żyto on 24/08/2023.
//

import SwiftUI
import UIKit

struct ResultsView: View {
    
    
    @Binding var pizza1: Pizza
    @Binding var pizza2: Pizza
    
    @State var result1 : FinalResult = FinalResult(name: "", pricePerUnit: 0.0)
    @State var result2 : FinalResult = FinalResult(name: "", pricePerUnit: 0.0)
    
    var body: some View {
        VStack{
            Group{
                Image("pizza")
                    .resizable()
                    .frame(width: 170, height: 170)
                
                    }
            
            .onAppear{
                result1 = pizza1.calculateResult(pizza: pizza1)
                result2 = pizza2.calculateResult(pizza: pizza2)
                
                print(result1)
                print(result2)
            }
            VStack {
                if let formattedResult1 = formatPrice(result1.pricePerUnit),
                   let formattedResult2 = formatPrice(result2.pricePerUnit) {

                    if formattedResult1 < formattedResult2 {
                        Text("\(result1.name) wins at \(formattedResult1) per unit")
                            .modifier(WinnerMod())
                        Text("\(result2.name): \(formattedResult2)")
                            .modifier(RunnerUpMod())
                    } else if formattedResult1 > formattedResult2 {
                        Text("\(result2.name) wins at \(formattedResult2) per unit")
                            .modifier(WinnerMod())
                        Text("\(result1.name): \(formattedResult1)")
                            .modifier(RunnerUpMod())
                    } else {
                        Text("No winner! Try again")
                            .modifier(WinnerMod())
                    }
                }
            }
        }
       
            
        }
    
}

func formatPrice(_ price: Double) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    
    return formatter.string(from: NSNumber(value: price))
}

//MARK: - Styling mods

struct WinnerMod : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding(.top, 20)
            .padding(.horizontal)
            .padding(.bottom, -2)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 30))
            .foregroundColor(K.mainOrange)
            .multilineTextAlignment(.center)
            .bold()    }
    
}

struct RunnerUpMod : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding(.top, 4)
            .padding(.horizontal)
            .padding(.bottom, -2)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 23))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .bold()    }
    
}



struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let pizza1 = Pizza(name: "", size: "", price: "") // Create a sample Pizza instance
                let pizza2 = Pizza(name: "", size: "", price: "") // Create another sample Pizza instance
                
        return ResultsView(pizza1: .constant(pizza1), pizza2: .constant(pizza2))                }
}
