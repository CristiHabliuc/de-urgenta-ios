//
//  ParagraphWithHeadingView.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 12.12.2021.
//

import SwiftUI

struct ParagraphWithHeadingView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(spacing: 20) {
            MediumTitleLabel(title: title)
            BodyTextLabel(text: content)
        }
    }
}

struct ParagraphWithHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        ParagraphWithHeadingView(
            title: "Configurează o altă adresă",
            content: "Adaugă alte adrese relevante cum ar fi cea de la birou, de la sala de sport, de la alt loc pe care îl vizitezi cel puțin săptămânal. Poți adăuga până la cinci adrese. După acest pas, vei putea să îți selectezi un punct de întâlnire și vei putea vedea traseele dintre adresele tale și aceasta. ")
            .padding()
    }
}
