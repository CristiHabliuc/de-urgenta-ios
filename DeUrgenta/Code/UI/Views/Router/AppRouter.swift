//
//  AppRouter.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 11.12.2021.
//

import Foundation
import SwiftUI

enum AppRoute {
    case home
    case login
    case register
    
    case dashboard
    case addressMap // TODO: add params
    case addressName // TODO: add params
}

struct AppRouter {
    @ViewBuilder
    static func view(for route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeView()
        case .login:
            LoginView()
        case .register:
            RegisterView()
        case .dashboard:
            DashboardView()
        case .addressMap:
            AddressEntryView()
        case .addressName:
            Text("Not implemented")
        }
    }
}
