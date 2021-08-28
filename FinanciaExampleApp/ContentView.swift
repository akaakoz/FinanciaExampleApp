//
//  ContentView.swift
//  FinanciaExampleApp
//
//  Created by Akiya Ozawa on R 3/08/08.
//

import SwiftUI
import Combine

class TextFieldManager: ObservableObject {
    
    let characterLimit = 4
    
    @Published var userInput = "" {
        didSet {
            
            print("userInput first", userInput.first?.description)
            let characterSet = CharacterSet(charactersIn: "0")
            let chracter = Character("0")
            if userInput.contains(chracter) {
                
                return
            }
           
            if userInput.count > characterLimit {
                userInput = String(userInput.prefix(characterLimit))
            }
            
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var textFieldManager = TextFieldManager()
    @State var text = ""
    @State var text2 = "default"
    //@ObservedObject var input = TextLimiter(limit: 5)
    
    var body: some View {
        VStack {
            //TextField("", text: $text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
            TextField("Enter numbers", text: $textFieldManager.userInput)
                .padding(.horizontal)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .onReceive(Just(text), perform: { limitTextField in
//                    if text.count >= 3 {
//                        print("text has more than 3 words")
//                    }
//                })
                
//                .onChange(of: text, perform: { value in
//
//                    print(value.first?.description == "0")
//
//                    if value.first?.description == "0" {
//                        print("first index is 0")
//                        return
//                    }
//
//                    let newText = value.replacingOccurrences(of: ",", with: "", options: .regularExpression, range: nil)
//                    guard let intValue = Int(newText) else {return}
//
//                    let formatter = NumberFormatter().stringFromNum(NSNumber(value: intValue))
//                    self.text = (formatter ?? "")
//            })
            
            Button("Done") {
                print("finalText", text)
            }
            
        }
        

    }
    
    func onCommit() {
        
        print("value", text)
    }
    
    func onEditingChanged(_ changed: Bool) {
        
            print(changed)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension NumberFormatter {
        func stringFromNum(_ number: NSNumber) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: number)
    }
    
}
