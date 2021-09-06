//
//  StudyCardsApp.swift
//  StudyCards
//
//  Created by Bruno Coronado on 04/09/21.
//

import SwiftUI
import Firebase

@main
struct StudyCardsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(cardViewModel: CardViewModel())
        }
    }
}
