//
//  ContentView.swift
//
//
//
//

import SwiftUI

struct ContentView: View {
    @State private var textFieldInput: String = ""
    @State private var buttonText = "create"

    var body: some View {
        VStack {
            Text("ChoreCraft V0.01")
                .font(.title)
                .padding()
            
            TextField("Enter Project Name", text: $textFieldInput)
                .padding()

            Button(action: {
              var created = createFolder(folderName: self.textFieldInput)
                print("Button tapped")
                if(created){
                    self.buttonText = "Folder was created" // Update buttonText when button is tapped
                }else{
                    self.buttonText = "Invalid,try again"
                }
            }) {
                Text(buttonText)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

