//
//  PersonalizationView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 05/12/25.
//

import SwiftUI

struct PersonalizationView: View {
    
    @State var ispressed: Bool = false
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Personalization Options")
                    .padding()
                Image(systemName: "gearshape.fill")
                    .scaleEffect(0.95)

            }
        }
    }
}

#Preview {
    PersonalizationView()
}
