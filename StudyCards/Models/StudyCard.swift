//
//  StudyCard.swift
//  StudyCards
//
//  Created by Bruno Coronado on 06/09/21.
//

import Foundation
import FirebaseFirestoreSwift

struct StudyCard:  Identifiable, Codable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var passed: Bool = false
}
