//
//  AppImages.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 21.07.2021.
//

import Foundation
import SwiftUI

extension Image {
    static let appIconLarge = Image("logo")

    static let map = Image("config.map-icon")
    static let whiteMap = Image("accessory-location-marker")
    static let checkmark = Image("green-checkmark")
    static let checkboxChecked = Image("checkbox-checked")
    static let checkboxUnchecked = Image("checkbox-unchecked")
    static let chevron = Image("chevron-right")
    
    static let envelopeIconLarge = Image("icon-envelope-large")
    
    static func addressIcon(for kind: DUAddress.Kind) -> Image {
        return Image("icon-address-\(kind.rawValue)")
    }
    
}
