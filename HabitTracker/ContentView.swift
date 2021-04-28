// MARK: ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var activities: Activities = Activities()
    @State private var isShowingAddNewActivityView: Bool = false
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(activities.list) { (activity: Activity) in
                    Text(activity.name)
                }
                .onDelete(perform : deleteItems)
            }
            .navigationBarTitle(Text("Habit tracker"))
            .navigationBarItems(trailing : Button(action: {
                isShowingAddNewActivityView.toggle()
            } , label : {
                Image(systemName : "plus.circle")
                    .font(.largeTitle)
            }))
            .sheet(isPresented: $isShowingAddNewActivityView) {
                AddActivityView(activities : activities)
            }
        }
    }
    
    
    
     // //////////////
    //  MARK: METHODS
    
    func deleteItems(from offsets: IndexSet) {
        
        activities.list.remove(atOffsets: offsets)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
