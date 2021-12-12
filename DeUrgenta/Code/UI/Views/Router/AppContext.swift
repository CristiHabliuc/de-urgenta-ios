//
//  AppContext.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 11.12.2021.
//

import Foundation
import SwiftUI

class AppContext: ObservableObject {
    static let shared = AppContext()
    
    @Published var mainNavigationRootPath = NavigationPath.welcome
    
    static var isPreviewMode: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    enum NavigationPath {
        case welcome
        case pendingValidation
        case authenticated
    }
}
