//
//  CardView.swift
//  StudyCards
//
//  Created by Bruno Coronado on 06/09/21.
//

import SwiftUI

struct CardView: View {
    var oneCardViewModel: OneCardViewModel
    @State private var flipped = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(flipped ? Color.white : Color.purple)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: oneCardViewModel.studyCard.passed ? "star.fill" : "star")
                            Spacer()
                        }
                    }
                    Text(flipped ? oneCardViewModel.studyCard.answer : oneCardViewModel.studyCard.question)
                        .foregroundColor(flipped ? Color.black : Color.white)
                        .font(.custom("Avenir", size: 24))
                }
                .padding()
            )
            .onTapGesture {
                withAnimation {
                    flipped.toggle()
                }
            }
    }
}

