//
//  IconAndTextLabel.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 12.12.2021.
//

import SwiftUI

struct IconAndTextLabel: View {
    var icon: Image
    var text: String
    
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                icon
                
                Text(text)
                
                Spacer()
            }
            .font(.formTextField)
            .foregroundColor(.formValue)
            .padding(EdgeInsets(top: 9, leading: 13, bottom: 9, trailing: 13))
        }
        .background(Color.mainBackground)
        .modifier(RoundedEdge(width: 1, color: .fieldBorder, cornerRadius: .fieldCornerRadius))
    }
}

struct IconAndTextLabel_Previews: PreviewProvider {
    static var previews: some View {
        IconAndTextLabel(icon: .addressIcon(for: .home), text: "Strada Batistei 8")
            .padding()
    }
}
