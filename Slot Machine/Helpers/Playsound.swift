//
//  Playsound.swift
//  Slot Machine
//
//  Created by Steven Vafadar on 2022-12-30.
//

import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play() //play sound
        } catch {
            print(error.localizedDescription)
        }
    }
}
