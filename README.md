<img src="https://github.com/nmsu-cs/project-swift-sorcerers/assets/123407190/037ae417-0213-443d-aa0d-46774138dd86" alt="alt text" width="300" height="300">


### What Is Chord Craft?

Chord Craft is a music industry-focused project management system designed specifically for music producers, songwriters, musicians, and sound engineers. The application aims to simplify the organization of songs for an album or a compilation by allowing users to categorize and label them based on characteristics such as tempo, genre, mood, and key. Additionally, it addresses the various stages of music production, from general ideas to songwriting, mixing, mastering and Completed, providing a digital solution to streamline progress tracking for music artists.

This repository will contain the source code for the ChordCraft music project management system.

** Project Structure **

The project is structured as follows:
* ChordCraftApp.swift: The main entry point for the application, containing the '@main' entry point and the 'App' strut.
* AddsongForm.swift: Defines the 'AddSongForm' struct, which is used for adding new songs to a project.
* AddProjectFrom.swift: Contains the 'AddProjectForm' struct, which is used for creating new projects.
* Item.swift: Defines the Item struct, which represents a song or a project inside the app.
* AudioPlayerButton.swift: Contains the AudioPlayerButton struct, which is used for controlling audio playback within the application.
* ContentView.swift: Which is responsible for displaying the main content of the application. Its repsonsible for the switching between views.
* Project.swift: Defines the Project struct, which represnets a music project in the application, including its name, artist, and list of songs.
* songModel.swift: Represents a song in the application, including its title, genre, tempo, etc.
* StartUpPage.swift: Displays the startup page with options to create or open projects.
* ListView.swift: Displays a list of options and projects for navigation.
* showSongsTest.swift: Responsible for testing and displaying a list of songs.
* songView.swift: Displays detailed information about a specific song, which includes things such as title, genre, tempo, etc.
    
** Getting Started **
- To browse and understand the project structure:
1. Clone the repository to your local machine
2. Open the project in XCode.
3. Navigate through the various folders and files to explore the project structure and code.

** Building **
- To build and install the ChordCraft project, follow these steps below:
1. Make sure to XCode installed on your machine.
2. Open the 'ChordCraftApp.xcodeproj' file in Xcode.
3. Select the target device (macOS, iPhone, etc) (preferrably macOS for this application)
4. Select 'Product -> Run' on the toolbar, or for hotkeys press 'Cmd + R'.

** Installation **
- Build the project using the instructions above.
- Once the project is built, the application will be installed on the selected device/simulator.

