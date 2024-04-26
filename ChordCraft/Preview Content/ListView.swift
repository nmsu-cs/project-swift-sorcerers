

import SwiftUI
struct Option: Hashable { // Defines a struct to represent an option with a title and an image name
    let title: String
    let imageName: String
}


// information in row 
struct SubsectionView: View {
    let title: String
    let items: [String]
    @State private var isExpanded: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // row title
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 5)

            // songs
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(items, id: \.self) { _ in
                        NavigationLink(destination: songView2()) {                                       HStack {
                            Image(systemName: "folder.fill").foregroundColor(.white).padding()
                            }
                        }
                    }
                }
               
            }
            .frame(maxWidth: .infinity)
            
        }
        .frame(minWidth: 500, maxWidth: .infinity, minHeight: 80, idealHeight: 80, maxHeight: 80)
        // .border(.orange)
        .padding()
        .cornerRadius(10)
    }
}


struct MainView : View {
    @State private var headerMessage: String = ""
    @State private var showingAddSongForm = false
    @State private var isCompletedExpanded = true
    @State private var isMasteringExpanded = true
    @State private var isMixingExpanded = true
    
    var body: some View {
        ZStack{
           
            GeometryReader { geometry in
                Image("leaf")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .blur(radius: 1.5)
                    .clipped()
            }
        ScrollView {
           
                
                //Color.black.background()
                VStack {
                    Spacer()
                    Text(headerMessage).font(.largeTitle)
                        .fontWeight(.semibold)
                        //.border(.pink)
                        .frame(maxWidth: .infinity, idealHeight: 40, alignment: .leading)
                        //.border(.blue)
                        .padding(.leading)
                        .onAppear(perform: updateHeaderMessage) // calls function
                    
                       
                        Spacer()
                    
                    HStack {
                        Text("Project").font(.title2).fontWeight(.semibold).padding(.leading)
                        Spacer()
                        
                    }
                    
                    /*
                    Divider().frame(height: 2).foregroundColor(Color.white)
                    */
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .padding(.leading, 16.0)
                        .frame(height: 3)
                        .opacity(0.4)
                    
                    Spacer()
                    Spacer()
                        
                    
                    // loading rows in view
                    // completed row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .fill(Color.gray)
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Completed", items: ["Item 1", "Item 2","item 3","item 4"])
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    isCompletedExpanded.toggle()
                                }
                            }) {
                                Image(systemName: isCompletedExpanded ? "chevron.up" : "chevron.down").foregroundColor(.white).padding()
                            }
                        }
                        .padding()
                    }
                    
                    // Mastering row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .fill(Color.gray)
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Mastering", items: ["Item 3", "Item 4", "Item 5"])
                            Spacer()
                            
                        }
                        
                        .padding()
                    }
                    
                    // mixing row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .fill(Color.gray)
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Mixing", items: ["Item 6", "Item 7", "Item 8", "Item 9"])
                            Spacer()
                            addButton(action: {
                                // Your action code here, for example:
                                print("Button tapped")
                                showingAddSongForm = true
                                
                            })
                        }
                        .sheet(isPresented: $showingAddSongForm) {
                            AddsongForm(showingAddSongForm: $showingAddSongForm)
                        }
                        .padding()
                        
                       
                    }
                    Spacer()
                    Spacer()
                    // arranging row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Arranging", items: ["Item 1", "Item 2","item 3","item 4"])
                            Spacer()
                            
                           
                           // Image(systemName: "plus")
                            addButton(action: {
                                // Your action code here, for example:
                                print("Button tapped")
                            })

                          
                        }
                        .padding()
                       // .border(.blue)
                    }
                    
                    Spacer()
                    Spacer()
                    // all row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "All", items: ["Item 1", "Item 2","Item 2","Item 2","Item 2","Item 2","Item 2","Item 2","Item 2","Item 2","Item 2"])
                            Spacer()
                            
                           
                           // Image(systemName: "plus")
                            addButton(action: {
                                // Your action code here, for example:
                                print("Button tapped")
                            })

                          
                        }
                        .padding()
                       // .border(.blue)
                    }
                   
                }
                
                .padding()
                Spacer()
                
               
            }
            
        }
        
    }
    
    func updateHeaderMessage() {
           let currentTime = Date()
           let calendar = Calendar.current
           let hour = calendar.component(.hour, from: currentTime)
           
           if hour >= 3 && hour < 12 {
               headerMessage = "Good Morning! ☀️"
           } else if hour >= 12 && hour < 18 {
               headerMessage = "Good Afternoon! ⛱️"
           } else {
               headerMessage = "Good Evening! 🌙"
           }
       }
}

// side bar
struct ListView: View {
    let options: [Option]    // Options available in the list
    @Binding var currentSelection: Int    // Binding to track the current selection
    @Binding var showProjects: Bool
    
    var body: some View {
        VStack {
            //..
            
            Text("Chord Craft").font(.largeTitle).fontWeight(.semibold).padding(.top, 28).padding(.leading, -10)
            //Divider()
            ForEach(options.indices, id: \.self) { index in    // Display each option in a row
                let option = options[index]     // Gets the currently selected option
                HStack {
                    Spacer()
                    Text(option.title)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(index == currentSelection ? Color(.white) : Color(.gray))
                    Spacer()
                    Image(systemName: option.imageName)  // Displays the option's image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                    Spacer()
                }
                .padding(.leading, -19)
                .onTapGesture {    // Handle tap gesture on an option
                    currentSelection = index
                    if index == 0 {
                        showProjects = true
                    }
                }
            }
            Spacer()
            //back button
            HStack {
                Button(action: {
                    showProjects = false
                }) {
                    Image(systemName: "arrowshape.backward.circle.fill")
                        .font(.title2)
                }
                .padding()
                Spacer()
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



struct ListView_Previews: PreviewProvider {
    @State static var currentSelection = 0
    @State static var showProjects = false
    static var previews: some View {
        ListView(options: [
            Option(title: "Projects", imageName: "folder.fill"),
            Option(title: "Settings", imageName: "gearshape")
        ], currentSelection: $currentSelection, showProjects: $showProjects)
    }
}
