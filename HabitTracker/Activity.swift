// MARK: Activity.swift

import Foundation


struct Activity: Identifiable ,
                 Codable {
    
    var id: UUID = UUID()
    let name: String
    let description: String
    var completionCount: Int = 0
}
