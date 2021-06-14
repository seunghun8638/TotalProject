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
    var progressT : Timer!
    
    @IBOutlet var pvProgressPlay: UIProgressView!
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var endTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Music View"
        self.navigationItem.backButtonTitle = "Back"
        
        AlbumImg.image = UIImage(named: "음악.jpg")
        
         audioFile = Bundle.main.url(forResource: "Glow", withExtension: "mp3")
        play()
        currentTime.text = converNSTimeInterval2String(0)
        endTime.text = converNSTimeInterval2String(audioPlayer.duration)
    }
    
    func converNSTimeInterval2String(_ time : TimeInterval) -> String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format : "%02d:%02d",min,sec)
        return strTime
    }
    let timePlayerSelector : Selector = #selector(musicViewController.updatePlayTime)
    @objc func updatePlayTime(){
        currentTime.text = converNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
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
        
        progressT = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    
        
        
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
        
        progressT.invalidate()
        
    }
    @IBOutlet var volumeChange: UISlider!
    @IBAction func volumeChangeBtn(_ sender: Any) {
        audioPlayer.volume = volumeChange.value
    }
    
}
