//
//  MainNavigation.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 11.12.2021.
//

import SwiftUI

struct MainNavigation: View {
    @StateObject var context = AppContext.shared
    
    var body: some View {
        NavigationView {
            switch context.mainNavigationRootPath {
            case .welcome:
                HomeView()
            case .pendingValidation:
                EmailValidationView()
            case .authenticated:
                DashboardView()
            }
        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
    }
}
