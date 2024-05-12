//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Inv1x on 11.05.2024.
//

import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Lytkarino, Moskow Oblast").padding(.top, 20)
                
                MainWeatherStatusView(imageName: "cloud.moon.fill",
                                      temperature: 4)
                
                HStack(spacing: 16) {
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.fill",
                        temperature: 11)
                    WeatherDayView(
                        dayOfWeek: "SUN",
                        imageName: "cloud.fill",
                        temperature: 8)
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "cloud.fill",
                        temperature: 10)
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.fill",
                        temperature: 13)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.fill",
                        temperature: 15)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: 
                        Gradient(colors: [
                            isNight ? .black : .blue,
                            isNight ? .gray : Color("lightBlue")
                        ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 24, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding(12)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundStyle(Color.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.title3)
                .bold()
                .foregroundStyle(Color.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.title2)
                .bold()
                .foregroundStyle(Color.white)
        }
    }
}
