//
//  ContentView.swift
//  ChordCraft
//
//  Created by Bernabe  Macias on 4/4/24.
//


import SwiftUI

struct StartUpPage: View {  // start main
    // variables
    // content
    @State private var showProjects = false
    @State private var currentSelection = 0
    
    var body: some View {  // start body
        NavigationView{ // start navigation view
            
                if showProjects {
                    ListView(options: [
                        Option(title: "Projects", imageName: "folder.fill"),
                        Option(title: "Settings", imageName: "gearshape")
                        ], currentSelection: $currentSelection)
                    MainView()
                } else {
                    SideView()
                    ProjectView(showProjects: $showProjects)
                }
                
            
        } // end naviagtion
        .frame(minWidth: 600, minHeight: 400)
    } // end body
} // end main

struct SideView: View {  // start struct
    var body: some View {
        Text("List")
    }  // end body
}  // end struct

struct ProjectView: View {  // start struct
    @Binding var showProjects: Bool
    
    var body: some View {
        ZStack { // start v stack
            Image("ChordCraft")
                .resizable()
            
            VStack {
                Spacer()
                Text("Chord Craft").font(.largeTitle).padding(.top, 230)
                Spacer()
                Button("Create Project +") { // start button

                }  // end button
                Button("Existing Project") {
                    showProjects.toggle()
                }
                .padding(.bottom, 50)


            }  // end vstack

        } // end of v stack
    }  // end body
}  // end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpPage()
    }
}
