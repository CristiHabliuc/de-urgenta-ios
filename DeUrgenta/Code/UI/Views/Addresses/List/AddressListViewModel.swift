//
//  AddressListViewModel.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 12.12.2021.
//

import Foundation

extension AddressListView {
    class ViewModel: ObservableObject {
        struct Address: Identifiable {
            let id: Int
            let kind: DUAddress.Kind
            let name: String
        }
        @Published var addresses: [Address] = []
    }
}
