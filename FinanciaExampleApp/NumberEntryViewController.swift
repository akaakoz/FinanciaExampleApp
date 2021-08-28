//
//  NumberEntryViewController.swift
//  FinanciaExampleApp
//
//  Created by Akiya Ozawa on R 3/08/12.
//

import Foundation
import UIKit
import SwiftUI

class NumberEntryViewController: UIViewController {
    
    var number: Int?
    
    private let numberInputTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .decimalPad
        tf.borderStyle = .roundedRect
        tf.placeholder = "$5.00"
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        numberInputTextField.delegate = self
        numberInputTextField.addTarget(self, action: #selector(detectEditingChange), for: .editingChanged)
        view.addSubview(numberInputTextField)
        numberInputTextField.translatesAutoresizingMaskIntoConstraints = false
        numberInputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberInputTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        numberInputTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        numberInputTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc private func detectEditingChange() {
//        print("detecting", numberInputTextField.text)
//
//        guard let editedText = numberInputTextField.text else {return}
//        if let intNewText = Int(editedText) {
//            number = intNewText
//        } else {
//            number = 0
//        }
//
//        guard let nsNumber = number else {return}
//        let numberFormatter = NumberFormatter()
//        //numberFormatter.locale = Locale.current
//        numberFormatter.locale = Locale(identifier: "en_US")
//        numberFormatter.numberStyle = .decimal
//        numberFormatter.maximumFractionDigits = 2
//        let text = numberFormatter.string(from: NSNumber(value: nsNumber))
//
//        numberInputTextField.text = text
        
    }
}

extension NumberEntryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "0" && range.location == 0 {
            return false
        }
        
//        if string == "." {
//            let newString: String = (textField.text! as NSString).replacingCharacters(in: range, with: string)
//            print("")
//            textField.text = newString
//            let newTextWithoutComma = newString.replacingOccurrences(of: ",", with: "", options: .regularExpression, range: nil)
//            guard let nsNumber = number else {return false}
//            let numberFormatter = NumberFormatter()
//            numberFormatter.locale = Locale(identifier: "en_US")
//            numberFormatter.numberStyle = .decimal
//            let text = numberFormatter.string(from: NSNumber(value: nsNumber))
//            return false
//        }
        
        let newString: String = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if string == "." && !newString.contains(Character(".")) {
            
        }
        
//        if newString.contains(Character("."))
//        if newString.contains(Character(".")) {
//
//            textField.text = newString
//            return false
//        }
        
        if newString.contains(Character(".")) && newString.contains(Character(",")) {
            
        }
        
        let newTextWithoutComma = newString.replacingOccurrences(of: ",", with: "", options: .regularExpression, range: nil)
        
        //guard let intNewText = Int(newTextWithoutComma) else {return false}
        
        if let intNewText = Int(newTextWithoutComma) {
            number = intNewText
        } else {
            number = 0
        }
        
        guard let nsNumber = number else {return false}
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        //numberFormatter.allowsFloats = true
        //numberFormatter.numberStyle = .currency
        let text = numberFormatter.string(from: NSNumber(value: nsNumber))
                
        textField.text = text
        
        return false
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,  bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, height: CGFloat, width: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

//struct NumberEntryIntegratedViewController: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return UINavigationController(rootViewController: NumberEntryViewController())
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        //
//    }
//
//
//}

//struct AnimationIntegratedController: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> UIViewController {
//
//        return UINavigationController(rootViewController: AnimationViewController())
//        //return AnimationViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        //
//    }
//
//    typealias UIViewControllerType = UIViewController
//}
//
//struct ContentView: View {
//    var body: some View {
//
//        AnimationIntegratedController().edgesIgnoringSafeArea(.all)
////        Text("Hello, world!")
////            .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        //AnimationIntegratedController()
//        ContentView()
//    }
//}
