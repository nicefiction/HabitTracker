// MARK: Activity.swift

import Foundation


struct Activity: Identifiable {
    
    var id: UUID = UUID()
    let name: String
    let description: String
    let completionCount: Int = 0
}
