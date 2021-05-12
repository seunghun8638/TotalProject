//
//  profileViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/15.
//

import UIKit

class profileViewController: UIViewController {

    //주요 기능 선언
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.image = img
        prepareAnimation()
    }
    
    //이미지 추가
    let img = UIImage(named: "luffy.jpg")
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()//애니메이션 효과 시작
    }
    
    //애니메이션 기본 위치
    private func  prepareAnimation() {
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        jobLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        jobLabel.alpha = 0
    }
    
    
    //nameLabel , jobLabel 시간차 나타나기
    //img 효과
    private func showAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
                }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.jobLabel.transform = CGAffineTransform.identity
            self.jobLabel.alpha = 1
                }, completion: nil)
        
        UIView.transition(with: imgProfile, duration: 0.4, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
}
