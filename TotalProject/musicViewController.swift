//
//  MusicViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/22.
//

import UIKit
import AVFoundation

class musicViewController: UIViewController ,AVAudioPlayerDelegate{
    
    var audioFile : URL!
    var audioPlayer : AVAudioPlayer!
    var maxVolume : Float = 10.0

    @IBOutlet weak var svolume: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Music View"
        self.navigationItem.backButtonTitle = "Back"
        
        AlbumImg.image = UIImage(named: "luffy.jpg")
        
         audioFile = Bundle.main.url(forResource: "Glow", withExtension: "mp3")
        play()
    }
//    var audioPlayer : AVAudioPlayer!
//
//
//
//
    
    func play(){
        do{
             audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError {
            print("\(error)")
        }
        volumeChange.maximumValue = maxVolume
        volumeChange.value = 1.0
        
    
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volumeChange.value
        
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
        
        
        
    }
    func setButtons(_ play:Bool , pause : Bool){
        startBtn.isEnabled = play
        stopBtn.isEnabled = pause
    }
     
    @IBOutlet weak var AlbumImg : UIImageView!
  
    
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var stopBtn: UIButton!
    @IBAction func playStartBtn(_ sender: UIButton) {
        audioPlayer.play()
        setButtons(true, pause: true)

    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        audioPlayer.stop()
        setButtons(true, pause: true)
        
    }
    @IBOutlet var volumeChange: UISlider!
    @IBAction func volumeChangeBtn(_ sender: Any) {
        audioPlayer.volume = volumeChange.value
    }
    
}
