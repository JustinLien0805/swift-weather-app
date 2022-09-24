//
//  ContentView.swift
//  swift-weather-app
//
//  Created by 練家辰 on 2022/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackGroundView(isNight: $isNight)
            VStack(spacing: 8){
                CityTextView(city: "Taipei City, TW")
                currentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.bolt.fill", temp: 18)
                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:20){
                            WeatherDayView(day: "MON", imageName: "cloud.sun.fill", temp: 18)
                            WeatherDayView(day: "TUE", imageName: "cloud.sun.rain.fill", temp: 19)
                            WeatherDayView(day: "WED", imageName: "wind", temp: 19)
                            WeatherDayView(day: "THU", imageName: "sun.max.fill", temp: 25)
                            WeatherDayView(day: "FRI", imageName: "cloud.rain.fill", temp: 20)
                            WeatherDayView(day: "SAT", imageName: "cloud.sun.fill", temp: 23)
                        }
                    }
                }
                .padding(.vertical)
                .background(isNight ? Color.gray : Color.blue)
                .cornerRadius(16)
                .frame(width: 360)
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherBtn(title: "Change Day Time")
                }
                .padding()
                .foregroundColor(isNight ? .white : .blue)
                .overlay(RoundedRectangle(cornerRadius:16)
                    .stroke(isNight ? .white : .blue,
                            lineWidth: 1))
                
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var day: String
    var imageName: String
    var temp: Int
    
    var body: some View {
            VStack{
                Text(day)
                    .font(.system(size: 25, weight: .medium))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:50, height: 50)
                Text("\(temp)°")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)
            }
    }
}

struct BackGroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black: .blue, isNight ? Color(.gray) :       Color(.cyan)]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct currentWeatherView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height:180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.white)
        }.padding(.bottom, 60)
    }
}

struct WeatherBtn: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 16 , weight: .semibold))
    }
}
