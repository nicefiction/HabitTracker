// MARK: AddActivityView.swift

import SwiftUI



struct AddActivityView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var list: Activities
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var completionCount: Int = 0
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header : Text("name")) {
                    TextField("Activity name" , text : $name)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Section(header : Text("description")) {
                    TextField("Description" , text : $description)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Section(header : Text("completion count")) {
                    HStack {
                        Spacer()
                        Text("\(completionCount)")
                            .font(.largeTitle)
                        Spacer()
                    }
                    Button(action: {
                        completionCount += 1
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Done")
                            Spacer()
                        }
                    })
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationBarTitle(Text("Add a new activity"))
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
        })
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct AddActivity_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddActivityView(list : Activities()).previewDevice("iPhone 12 Pro")
    }
}
