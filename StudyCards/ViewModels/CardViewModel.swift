//
//  CardViewModel.swift
//  StudyCards
//
//  Created by Bruno Coronado on 06/09/21.
//

import Foundation
import Combine

final class CardViewModel: ObservableObject {
    @Published var cardRepository = CardRepository()
    @Published var oneCardViewModel: [OneCardViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        cardRepository.$studyCard
            .map { studyCards in
                studyCards.map(OneCardViewModel.init)
            }
            .assign(to: \.oneCardViewModel, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ studyCard: StudyCard) {
        cardRepository.add(studyCard)
    }
    
    func remove(_ studyCard: StudyCard) {
        cardRepository.remove(studyCard)
    }
    
    func update(_ studyCard: StudyCard) {
        cardRepository.update(studyCard)
    }
}
