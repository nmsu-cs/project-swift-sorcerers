//
//  AddProjectFrom.swift
//  ChordCraft
//
import Cocoa
import SwiftData
import SwiftUI

struct AddProjectForm: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Project]

    // variables to store input
    @State private var buttonText = "Add"
    @State private var prjectName: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("New Project attributes")
                .font(.title)

            TextField("Project Name", text: $prjectName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

          
            Button(action: {
                if addItem() {
                    self.buttonText = "Projec Created!"
                } else {
                    self.buttonText = "Invalid, try again"
                }
            }) {
                Text(buttonText)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Text("List of Pojects Stored")
                .font(.headline)

            List(items) { item in
                VStack(alignment: .leading) {
                    Text(item.projectName)
                    Text("date: \(item.dateCreated)")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .buttonStyle(PlainButtonStyle())
    }

    private func addItem() -> Bool {
        withAnimation {
            // Assuming `Project` initializer requires projectName as an optional parameter
            let newItem = Project(projectName: prjectName)
            
            // Insert the newItem into the modelContext
            modelContext.insert(newItem)
            
            // Since everything went well, return true
            return true
        }
    }


    } // end of view


#Preview {
    AddProjectForm()
        .modelContainer(for: Item.self, inMemory: true)
}
