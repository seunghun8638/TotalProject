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
    
    @IBOutlet weak var progressTime: UISlider!

    @IBOutlet var currentTime: UILabel!
    @IBOutlet var endTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Music View"
        self.navigationItem.backButtonTitle = "Back"
        
        AlbumImg.image = UIImage(named: "음악.jpg")
        
        //오디오 파일 저장
        audioFile = Bundle.main.url(forResource: "Glow", withExtension: "mp3")
        initplay()
        //맨 처음 load 시, current time은 00:00 으로 나타냄
        currentTime.text = time(0)
        //맨 처음 load 시, end time은 오디오 파일에 총 시간
        endTime.text = time(audioPlayer.duration)
        
    }
    
    //time값을 float형을 Int값으로 변환하여 보여주기 위함
    func time(_ time : TimeInterval) -> String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format : "%02d:%02d",min,sec)
        return strTime
    }
    
    func initplay(){
        //실행해서 audioplayer가 있으면 패스 없으면 에러 출력
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
        
        self.progressTime.minimumValue = 0
        self.progressTime.maximumValue = Float(self.audioPlayer.duration)
        self.progressTime.value = Float(self.audioPlayer.currentTime)
        
        progressT = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { progressT in

            self.currentTime.text = self.time(self.audioPlayer.currentTime)
            self.progressTime.value = Float(self.audioPlayer.currentTime)
        })
        
        //progressT -> 실행 시에 interval뒤에 시작하지만 fire 함수를 통ㄹ해 즉시 실행
        progressT.fire()


        
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
        print("\(audioPlayer.volume)")
    }
    
    
}
