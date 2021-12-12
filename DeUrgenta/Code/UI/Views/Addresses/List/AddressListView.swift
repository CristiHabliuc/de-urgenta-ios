//
//  AddressListView.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 12.12.2021.
//

import SwiftUI

struct AddressListView: View {
    @StateObject var model: ViewModel = ViewModel()
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(
                alignment: .leading,
                spacing: .defaultVerticalSpacing
            ){
                FormMessageLabel(message: "Adresa ta de domiciliu a fost salvata cu succes.", isSuccess: true)
                
                VStack(spacing: .defaultVerticalSpacing) {
                    ForEach(model.addresses) { address in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(address.kind.description.firstCapitalized)
                                .font(.smallFormLabel)
                                .foregroundColor(.regularText)
                            
                            IconAndTextLabel(
                                icon: .addressIcon(for: address.kind),
                                text: address.name)
                        }
                    }
                }
                .padding(.top, 6)
                
                ParagraphWithHeadingView(
                    title: "Configurează o altă adresă",
                    content: "Adaugă alte adrese relevante cum ar fi cea de la birou, de la sala de sport, de la alt loc pe care îl vizitezi cel puțin săptămânal. Poți adăuga până la cinci adrese. După acest pas, vei putea să îți selectezi un punct de întâlnire și vei putea vedea traseele dintre adresele tale și aceasta. ")
                    .padding(.top, 16)
                    .padding(.bottom, 6)
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Adaugă încă o adresă")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(LargeButton(bgColor: .secondaryButBackground, fgColor: .secondaryButForeground))

                
                Spacer()
            }
            .padding()
        }

    }
}

struct AddressListView_Previews: PreviewProvider {
    static var model: AddressListView.ViewModel = {
        let model = AddressListView.ViewModel()
        model.addresses = [
            .init(id: 1, kind: .home, name: "Strada Batistei 8"),
            .init(id: 2, kind: .work, name: "Strada Neculau 8")
        ]
        return model
    }()
    static var previews: some View {
        NavigationView {
            AddressListView(model: model)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
