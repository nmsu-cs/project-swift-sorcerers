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
       // ProjectView(showProjects: $showProjects)
        // .frame(minWidth: 600, minHeight: 400)
        
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
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.7
                }
                .padding(.top, -150.0)
            
            VStack {
                Text("Chord Craft").font(.largeTitle).fontWeight(.bold).padding(.top,165)
                Text("Version 1.0.0").font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/).fontWeight(.medium)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button {
                       
                   } label: {
                       Image(systemName: "plus.square")
                       Text("Create New Project...")
                           .padding(.leading, -98)
                           .padding(.vertical, 8)
                           .foregroundColor(.white)
                           .frame(maxWidth: 250)
                           .cornerRadius(8)
                   }// end button
                   .padding(.bottom, 4)
                
                
                Button {
                    showProjects.toggle()
                   } label: {
                       Image(systemName: "folder")
                       Text("Open Existing Project...")
                           .padding(.leading, -90)
                           .padding(.vertical, 8)
                           .foregroundColor(.white)
                           .frame(maxWidth: 250)
                           .cornerRadius(8)
                   }// end button
                .padding(.bottom, 70)


            }  // end vstack

        } // end of v stack
    }  // end body
}  // end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpPage()
    }
}
