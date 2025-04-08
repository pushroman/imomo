//
//  ViewController.swift
//  IMONO
//
//  Created by Роман Пушкарев on 05.04.2025.
//
import UIKit
import AVFoundation
class DetailsViewController: UIViewController, DetailsViewProtocol {
    private var player: AVPlayer?
    private let stationLabel = UILabel()
    private let playPauseButton = UIButton(type: .system)
    var presenter: MainDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.setRadio()
        setupUI()
        setupAudioSession()
    }
    
    
    func success() {
        print("Radiostantion: \(presenter.radioStations)")
        guard let radiostanoion = presenter.radioStations.first else { return }
        broadcast(radio: radiostanoion)
    }
    
    func failure(error: any Error) {
        error.localizedDescription
    }
    
    private func setupUI() {
        stationLabel.textAlignment = .center
        stationLabel.font = .boldSystemFont(ofSize: 20)
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        playPauseButton.setTitle("Play", for: .normal)
        playPauseButton.addTarget(self, action: #selector(togglePlayPause), for: .touchUpInside)
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stationLabel)
        view.addSubview(playPauseButton)
        
        NSLayoutConstraint.activate([
            stationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Ошибка при настройке аудио сессии: \(error)")
        }
    }
    
    func broadcast(radio: RadioStation?) {
        guard let radio = radio, let url = URL(string: radio.streamURL ?? "no") else { return }
          player = AVPlayer(url: url)
          stationLabel.text = "Now Playing: \(radio.name)"
      }
      
    
    @objc private func togglePlayPause() {
        guard let player = player else { return }
        
        if player.timeControlStatus == .playing {
            player.pause()
            playPauseButton.setTitle("Play", for: .normal)
        } else {
            player.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
    }
    
    // Обработка события ухода в фон
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Обрабатываем уход в фон, если нужно
    }
    
    
}

