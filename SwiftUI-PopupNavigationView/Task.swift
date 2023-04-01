//
//  Task.swift
//  SwiftUI-PopupNavigationView
//
//  Created by Ikmal Azman on 01/04/2023.
//

import Foundation

struct Task : Identifiable {
    var id = UUID()
    let title : String
    let description : String
}

let tasks = [
    Task(title: "Meeting", description: "Discuss team task"),
    Task(title: "Sports", description: "Play footbale at Coram's"),
    Task(title: "Learn", description: "Learn to display custom popup in SwiftUI")
]
