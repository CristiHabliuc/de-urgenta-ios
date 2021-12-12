//
//  MediumTitleLabel.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 12.12.2021.
//

import SwiftUI

struct MediumTitleLabel: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.appTitle)
                .foregroundColor(.mainForeground)
            
            Spacer()
        }
    }
}

struct MediumTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        MediumTitleLabel(title: "Configurează o altă adresă")
    }
}
