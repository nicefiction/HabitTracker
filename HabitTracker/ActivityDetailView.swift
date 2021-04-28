// MARK: ActivityDetailView.swift

import SwiftUI



struct ActivityDetailView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State var activity: Activity
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            VStack(alignment : .leading ,
                   spacing : 10) {
                Text(activity.description)
                Spacer()
                HStack {
                    Spacer()
                    Text("\(activity.completionCount)")
                        .font(.largeTitle)
                    Spacer()
                }
                Button(action : {
                    self.activity.completionCount += 1
                }, label: {
                    HStack {
                        Spacer()
                        Text("Completed")
                        Spacer()
                    }
                })
            }
            .padding()
            .navigationBarTitle(Text(activity.name))
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ActivityDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ActivityDetailView(activity: Activity(name : "some name" ,
                                              description : "some description")).previewDevice("iPhone 12 Pro")
    }
}
