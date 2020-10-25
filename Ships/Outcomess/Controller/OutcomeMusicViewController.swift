//
//  OutcomeMusicViewController.swift
//  Ships
//
//  Created by Admin on 25.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class OutcomeMusicViewController: UIViewController {

    let pauseButton = UIButton()
    let playButton = UIButton()
    let musicSlider = UISlider()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initButtons()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    fileprivate func initButtons() {
        musicSlider.frame = CGRect(x: 40, y: 200, width: self.view.frame.width * 0.8, height: 20)
        
        
        playButton.frame = CGRect(x: 40, y: 400, width: self.view.frame.width / 3, height: 50)
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.layer.cornerRadius = 10
        playButton.backgroundColor = .systemYellow
        
        pauseButton.frame = CGRect(x: 100 + self.view.frame.width / 3, y: 400, width: self.view.frame.width / 3, height: 50)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.setTitleColor(.black, for: .normal)
        pauseButton.layer.cornerRadius = 10
        pauseButton.backgroundColor = .systemYellow
        
        
        self.view.addSubview(playButton)
        self.view.addSubview(musicSlider)
        self.view.addSubview(pauseButton)
    }
    
}

