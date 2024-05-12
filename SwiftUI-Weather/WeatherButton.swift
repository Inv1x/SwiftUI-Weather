//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Inv1x on 11.05.2024.
//

import SwiftUI

#Preview {
    WeatherButton(
        title: "Change Day Time",
        textColor: .blue,
        backgroundColor: .white)
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundStyle(textColor.gradient)
            .background(backgroundColor)
            .bold()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

