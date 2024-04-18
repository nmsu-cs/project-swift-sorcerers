

import SwiftUI
struct Option: Hashable { // Defines a struct to represent an option with a title and an image name
    let title: String
    let imageName: String
}

struct addButton: View {
    var action: () -> Void
    @State private var isHovering = false

    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: isHovering ? 21 : 20))
                .foregroundColor(isHovering ? .black.opacity(0.8) : .gray)
        }
        .frame(width: 30, height: 30)
        .buttonStyle(.plain)
        .background(isHovering ? Color.gray.opacity(0.2) : Color.clear)
        .cornerRadius(5)
        .onHover { hover in
            withAnimation(.easeInOut) {
                isHovering = hover
            }
        }
    }
}


// information in row
struct SubsectionView: View {
    let title: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            // row title
            HStack {
                Text(title)
                    .padding(.leading, -4)
                    .padding(.top, -30)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                .border(.blue)
                
                Image(systemName: "chevron.down")
                //.border(.pink)
                .padding(.top, -25)
            }
            
            // songs
           
            ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(items, id: \.self) { _ in
                                    NavigationLink(destination: Text("Folder")) {    
                                        VStack {
                                            
                                            HStack {
                                            Image(systemName: "folder.fill").foregroundColor(.white).padding()
                                            }
                                        }
                                    }
                                }
                            }
                        }
            
        }
        .frame(minWidth: 500, maxWidth: 500, minHeight: 80, idealHeight: 80, maxHeight: 80)
        // .border(.orange)
        .padding()
        .cornerRadius(10)
        

    }
    
}


struct MainView : View {
    @State private var headerMessage: String = ""
    @State private var isCompletedExpanded = true
    @State private var isMasteringExpanded = true
    @State private var isMixingExpanded = true
    


    
    var body: some View {
        ScrollView {
            ZStack{
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
                        Spacer()
                    
                    HStack {
                                         // Project title
                                         Text("Midnights").font(.title).fontWeight(.medium).padding(.leading)
                                         Spacer()
                                         
                                     } // end of hstack
                                     
                                     
                                     HStack {
                                         // project by
                                         Text("Taylor Swift").font(.headline).fontWeight(.thin)
                                             .padding(.leading, 17.0)
                                             
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
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Completed", items: ["Item 1", "Item 2","item 3","item 4"])
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
                    // Mastering row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Mastering", items: ["Item 3", "Item 4", "Item 5"])
                            Spacer()
                            
                            addButton(action: {
                                // Your action code here, for example:
                                print("Button tapped")
                            })
                            
                        }
                        
                        .padding()
                    }
                    Spacer()
                    Spacer()
                    
                    // mixing row
                    ZStack {
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                             )
                            .opacity(0.1)
                            .padding(.leading, 8.0)
                        HStack {
                            SubsectionView(title: "Mixing", items: ["Item 6", "Item 7", "Item 8", "Item 9"])
                            Spacer()
                            addButton(action: {
                                // Your action code here, for example:
                                print("Button tapped")
                            })
                        }
                        .padding()
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
                    }
            }
            Spacer()
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
    static var previews: some View {
        ListView(options: [
            Option(title: "Projects", imageName: "folder.fill"),
            Option(title: "Settings", imageName: "gearshape")
        ], currentSelection: $currentSelection)
    }
}
