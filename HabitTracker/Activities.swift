// MARK: Activities.swift

import Foundation



class Activities: ObservableObject {

     // /////////////////
    //  MARK: PROPERTIES
    
    @Published var list = Array<Activity>() {
        
        didSet {
            // The  didSet property observer on the list property of Expenses , writes out changes whenever an item gets added or removed :
            let encoder = JSONEncoder()
            
            if let _encoded = try? encoder.encode(list) {
                UserDefaults.standard.setValue(_encoded ,
                                               forKey : "Items")
            }
        }
    }
    
    

     // //////////////
    //  MARK: METHODS
    
    init() {
        if let _list = UserDefaults.standard.data(forKey: "Items") { // STEP 1
            
            let decoder = JSONDecoder() // STEP 2
            
            if let _decoded = try? decoder.decode([Activity].self , from : _list) { // STEP 3
                
                self.list = _decoded // STEP 4A
                return // STEP 4B
            }
        }
        self.list = [] // STEP 5
    }
}
