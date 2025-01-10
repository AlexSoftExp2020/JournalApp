//
//  PeviewsView.swift
//  JournalApp
//
//  Created by Oleksii on 27.12.2024.
//

import Foundation
import SwiftUI

struct MoodViewHalfPreview: View {
    var body: some View {
        Grid {
            GridRow {
                MoodViewHalf(value: .constant("😁"), isEditing: false, fontStyle: .font1)
                    .modifier(CardStyle())
                
                MoodViewHalf(value: .constant("😁"), isEditing: true, fontStyle: .font1)
                    .modifier(CardStyle())
            }
        }
        .padding(.horizontal)
    }
}

struct MoodViewFullPreview: View {
    var body: some View {
        ScrollView {
            Grid {
                MoodViewFullSolution(value: .constant("😢"), isEditing: true, fontStyle: .font1)
                    .modifier(CardStyle())
                
                MoodViewFullSolution(value: .constant("😢"), isEditing: false, fontStyle: .font1)
                    .modifier(CardStyle())
                
                Divider()
                
                MoodViewFull(value: .constant("😢"), isEditing: true, fontStyle: .font1)
                    .modifier(CardStyle())
                
                MoodViewFull(value: .constant("😢"), isEditing: false, fontStyle: .font1)
                    .modifier(CardStyle())
            }
            .padding(.horizontal)
        }
    }
}

struct SleepViewHalfPreview: View {
    var body: some View {
        Grid {
            GridRow {
                //MARK: TODO - SleepViewHalfSolution(...
                //MARK: TODO - SleepViewHalfSolution(...
            }
            
            Divider()
            
            GridRow {
                SleepViewHalf(value: .constant(5.0), isEditing: false, fontStyle: .font1)
                    .modifier(CardStyle())
                
                SleepViewHalf(value: .constant(5.0), isEditing: true, fontStyle: .font1)
                    .modifier(CardStyle())
            }
        }
        .padding(.horizontal)
    }
}

struct SleepViewHalfSolution: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont
    
    var body: some View {
        VStack {
            Text(isEditing ? "How many hours did you sleep?" : "Hours Slept")
                .foregroundColor(.darkBrown)
                .font(fontStyle.uiFont(15))
                .frame(maxWidth: .infinity, alignment: isEditing ? .leading : .center)
            Spacer()
            
            Text("\(Int(value))")
                .modifier(FontStyle(size: 50))
            
            Spacer()
            
            if isEditing {
                Stepper("Hours Slept", value: $value, in: 0...12, step: 1)
                    .labelsHidden()
            }
        }
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
    }
}

struct MoodViewFullSolution: View {
    @Binding var value: String
    var isEditing: Bool
    var fontStyle: JournalFont
    let displayEmojis = 3
    private let emojis = ["😢", "😴", "😁", "😡", "😐"]
    
    var body: some View {
        VStack {
            Text(isEditing ? "What's your mood?" : "Mood")
                .foregroundColor(.darkBrown)
                .font(fontStyle.uiFont(15))
                .frame(maxWidth: .infinity, alignment: isEditing ? .leading : .center)
            
            HStack {
                if isEditing {
                    ForEach(emojis, id: \.self) { emoji in
                        Button {
                            value = emoji
                        } label: {
                            VStack {
                                Text(emoji)
                                    .font(.system(size: 35))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.bottom)
                                
                                Image(systemName: value == emoji ? "circle.fill" : "circle")
                                    .font(.system(size: 16))
                                    .foregroundColor(.darkBrown)
                            }
                        }

                    }
                } else {
                    ForEach(0..<displayEmojis, id: \.self) { index in
                        Text(value)
                            .font(.system(size: 50))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
    }
}

struct TitleBannerPreview: View {
    var body: some View {
        VStack {
            YourTitleBannerSolutionView()
                .modifier(EntryBannerStyle(theme: .line))
            YourTitleBannerView()
                .modifier(EntryBannerStyle(theme: .line))
        }
        .padding()
    }
}

struct YourTitleBannerSolutionView: View {
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 25)
                        .foregroundColor(.bannerBlue)
                    
                    Circle()
                        .frame(width: 15)
                        .foregroundColor(.bannerYellow).offset(x: -10, y: -5)
                }
                ZStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(.bannerPink)
                        .offset(x: -5)
                    Circle()
                        .frame(width: 20)
                        .foregroundColor(.bannerOrange).offset(x: 10, y: 5)
                }
            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.bannerBlue)
                    .offset(x: 5, y: -10)
                Circle()
                    .frame(width: 30)
                    .foregroundColor(.bannerPink)
                    .offset(x: 6, y: 5)
                Circle()
                    .frame(width: 18)
                    .foregroundColor(.bannerOrange)
                    .offset(y: 20)
            }
        }
    }
}
