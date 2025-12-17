//
//  PersonalizationView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 05/12/25.
//

import SwiftUI

struct PersonalizationView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Button(action: {
            openWindow(id: "personalizaiton")
        }) {
            HStack {
                Text("Personalization View")
                    .padding()
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                
                Image(systemName: "gearshape.fill")
                    .scaleEffect(0.95)
            }
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    PersonalizationView()
}
