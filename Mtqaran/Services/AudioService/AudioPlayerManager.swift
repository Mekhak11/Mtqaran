//
//  AudioPlayerManager.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import AVFoundation
import SwiftUI


class AudioPlayerManager: ObservableObject {
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var timeObserverToken: Any?
    
    @Published var isPlaying: Bool = false
    @Published var isFinished: Bool = false
    @Published var isScreenRecording: Bool = false
    @Published var currentTime: Double = 0.0
    @Published var duration: Double = 1.0
    
    init() {
        observeScreenRecording()
    }

    // MARK: - Functions
    func setupPlayer(with urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        
        // Observe when the audio finishes playing
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(_:)), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        // Add observer for player progress
        addPeriodicTimeObserver()
    }
    
    func play() {
        guard !isScreenRecording else {
            print("Screen recording is active. Cannot play audio.")
            return
        }
        player?.play()
        isPlaying = true
        isFinished = false
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
        isPlaying = false
        isFinished = true
        currentTime = 0.0
    }
    
    @objc private func playerDidFinishPlaying(_ notification: Notification) {
        isPlaying = false
        isFinished = true
        currentTime = 0.0
    }
    
    // MARK: - Progress Tracking
    private func addPeriodicTimeObserver() {
        guard let player = player else { return }
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self = self else { return }
            self.currentTime = time.seconds
            self.duration = player.currentItem?.duration.seconds ?? 1.0
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        if let timeObserverToken = timeObserverToken {
            player?.removeTimeObserver(timeObserverToken)
        }
    }

    // MARK: - Screen Recording Detection
    private func observeScreenRecording() {
        isScreenRecording = UIScreen.main.isCaptured
        
        NotificationCenter.default.addObserver(self, selector: #selector(screenRecordingChanged), name: UIScreen.capturedDidChangeNotification, object: nil)
    }
    
    @objc private func screenRecordingChanged() {
        isScreenRecording = UIScreen.main.isCaptured
        if isScreenRecording {
            pause()
            print("Screen recording detected. Pausing audio.")
        }
    }
}

