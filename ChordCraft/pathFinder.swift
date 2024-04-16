import Cocoa
import SwiftUI

struct fileview: View {
    @State private var selectedFilePath: String?
    
    var body: some View {
        VStack {
            Button(action: {
                openFileSelectionDialog()
            }) {
                Text("Select File")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            if let selectedFilePath = selectedFilePath {
                Text("Selected File Path: \(selectedFilePath)")
            }
        }
        .padding()
    }
    
    func openFileSelectionDialog() {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        
        openPanel.begin { result in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                if let url = openPanel.urls.first {
                    let filePath = url.path
                    self.selectedFilePath = filePath
                }
            }
        }
    }
}

#Preview {
    fileview()
        .modelContainer(for: Item.self, inMemory: true)
}
