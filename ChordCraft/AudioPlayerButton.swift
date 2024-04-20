//
//  AudioPlayerButton.swift
//  ChordCraft
//

import Foundation
import SwiftUI
import AVFoundation

struct AudioButton: View {
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                playButtonTapped()
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
    }
    
    func playButtonTapped() {
        guard let soundURL = Bundle.main.url(forResource: "8-bit-kit-beep", withExtension: "wav") else {
            fatalError("Audio file not found")
        }

        do {
            try setupAudioPlayer(with: soundURL)
            audioPlayer?.play()
        } catch {
            fatalError("Error playing audio: \(error.localizedDescription)")
        }
    }

    func setupAudioPlayer(with url: URL) throws {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.prepareToPlay()
    }
}


#Preview {
    AudioButton()
        .modelContainer(for: Item.self, inMemory: true)
}
