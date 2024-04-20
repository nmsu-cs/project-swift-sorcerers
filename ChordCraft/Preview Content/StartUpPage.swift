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
                    SideView(showProjects: $showProjects)
                    ProjectView(showProjects: $showProjects)
                }
                
            
        } // end naviagtion
         
       // .frame(minWidth: 600, minHeight: 400)
    } // end body
} // end main

struct SideView: View {  // start struct
    @Binding var showProjects: Bool
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button(action: {
                    showProjects.toggle()
                    }, label: {
                        HStack {
                            Text("Recent Project").foregroundColor(.black).fontWeight(.semibold)
                            Image(systemName: "book.pages.fill").foregroundColor(.black)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .cornerRadius(100)
                    })
                Spacer()
            }
            .padding()
            .background(Color.white).ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        }
    }  // end body
}  // end struct


struct ProjectView: View {  // start struct
    @Binding var showProjects: Bool
    
    var body: some View {
        ZStack { // start v stack
             
            
            HStack {
                VStack {
                    Spacer()
                    Image("ChordCraft1")
                        .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 250, height: 130, alignment: .centerLastTextBaseline)
                             //.border(.blue)
                             .padding(.top, 44)
                  
                    
                    
                    Text("Chord Craft")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Version 1.0.0")
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Button {
                           
                       } label: {
                           Image(systemName: "plus.square")
                           Text("Create New Project...")
                               .padding(.leading, -89)
                               .padding(.vertical, 8)
                               .frame(maxWidth: 250)
                               .cornerRadius(8)
                       }// end button
                       .frame(minWidth: 280,maxWidth: 280)
                       .padding(.bottom, 4)
                    
                    
                    Button {
                        showProjects.toggle()
                       } label: {
                           HStack {
                               Image(systemName: "folder")
                               Spacer()
                               Text("Open Existing Project...")
                                   .padding(.leading, -89)
                                   .padding(.vertical, 8)
                                   .frame(maxWidth: 250)
                                   .cornerRadius(8)
                                   //.border(.blue)
                           }
                          
                               
                       }// end of button
                       .frame(minWidth: 280,maxWidth: 280)
                       //.border(.blue)
                    
                } // end of v stack
                .padding(.bottom, 70)
                
            } // end of hstack
            .padding(.leading, 100)
            .padding(.trailing, 100)

        } // end of zstack
    }  // end body
        
}  // end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpPage()
            //.frame(width: 600, height: 500)
    }
        
}
