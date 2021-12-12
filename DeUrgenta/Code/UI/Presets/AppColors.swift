//
//  AppColors.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 21.07.2021.
//

import Foundation
import SwiftUI

extension Color {
    static let accent = Color("Accent")
    static let homeBackground = Color("HomeBG")
    static let homeForeground = Color("HomeFG")

    static let mainBackground = Color("MainBG")
    static let mainForeground = Color("MainFG")

    static let fieldBorder = Color("FieldBorder")

    static let successTitle = Color("Success")
    static let errorTitle = Color("Error")
    
    static let regularText = Color("RegularText")

    static let formValue = Color("FormValue")
    
    static let secondaryButBackground = Color("SecondaryButtonBG")
    static let secondaryButForeground = Color("SecondaryButtonFG")

}

extension UIColor {
    static let homeBackground = UIColor(named: "HomeBG")
    static let homeForeground = UIColor(named: "HomeFG")
    static let mainForeground = UIColor(named: "MainFG")
}
