//
//  LargeButton.swift
//  CinemaProject
//
//  Created by MacBook on 29/12/22.
//

import SwiftUI

struct LargeButton: View {
    var selectedBorderColors: [Color] = [Color("colorPink"), Color("colorPink").opacity(0), Color("colorPink").opacity(0)]
        
        var body: some View {
            Text("Reservation")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(LinearGradient(colors: [Color("colorBackgroundDarker"), Color("colorBackgroundLighter")], startPoint: .bottomTrailing, endPoint: .topLeading))
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(colors: selectedBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                        .frame(maxWidth: .infinity, maxHeight: 58)
                }
        }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton()
    }
}
