//
//  OneCardViewModel.swift
//  StudyCards
//
//  Created by Bruno Coronado on 06/09/21.
//

import Foundation
import Combine

final class OneCardViewModel: ObservableObject, Identifiable {
    private let cardRepository = CardRepository()
    @Published var studyCard: StudyCard
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(studyCard: StudyCard) {
        self.studyCard = studyCard
        $studyCard
            .compactMap{ $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
