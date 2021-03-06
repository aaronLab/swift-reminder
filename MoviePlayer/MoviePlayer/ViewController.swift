//
//  ViewController.swift
//  MoviePlayer
//
//  Created by Aaron Lee on 7/20/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // internal file mp4
        // 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let filePath: String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        // external file mp4
        // 외부에 링크된 주소를 NSURL 형식으로 변경
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url: url) // 앞에서 얻은 url을 사용하여 비디오를 재생
    }
    
    @IBAction func btnPlayInternalMov(_ sender: UIButton) {
        // internal file mov
        let filePath: String? = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlayExternalMov(_ sender: UIButton) {
        // external file mov
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        
        playVideo(url: url)
    }
    
    private func playVideo(url: NSURL) {
        // AVPlayerViewController의 인스턴스를 생성
        let playerController = AVPlayerViewController()
        // 비디오 URL로 초기화된 AVPlayer의 인스턴스를 생성
        let player = AVPlayer(url: url as URL)
        // AVPlayerViewController의 Player 속성에 위에서 생성한 AVPlayer 인스턴스를 할당
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()   // 비디오 재생
        }
    }
}

