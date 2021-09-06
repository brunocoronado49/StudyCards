//
//  ContentView.swift
//  StudyCards
//
//  Created by Bruno Coronado on 04/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cardViewModel: CardViewModel
    @State private var showingForm = false
    @State private var showPassed = false
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showPassed) {
                    Text("\(showPassed ? "Hide" : "Show") passed questions")
                }
                List {
                    ForEach(cardViewModel.oneCardViewModel.filter {
                        $0.studyCard.passed == showPassed
                    }) { cardVM in
                        CardView(oneCardViewModel: cardVM)
                            .onLongPressGesture(minimumDuration: 1.5) {
                                var card = cardVM.studyCard
                                card.passed.toggle()
                                cardViewModel.update(card)
                            }
                    }.onDelete(perform: delete)
                }
                .listStyle(InsetListStyle())
                .navigationTitle("StudyCards")
                
                Button(action: {
                    showingForm = true
                }) {
                    Circle()
                        .fill(Color.green)
                        .frame(height: 60)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        )
                }
                .sheet(isPresented: $showingForm) {
                    FormView { (studyCard) in
                        cardViewModel.add(studyCard)
                        showingForm = false
                    }
                }
            }
        }
    }
    
    private func delete(at offset: IndexSet) {
        offset.map {
            cardViewModel.oneCardViewModel[$0].studyCard
        }.forEach(cardViewModel.remove)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cardViewModel: CardViewModel())
    }
}
