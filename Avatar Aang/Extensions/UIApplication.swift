//
//  UIApplication.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 15.10.2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
