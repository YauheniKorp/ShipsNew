//
//  BattlesViewController.swift
//  Ships
//
//  Created by Alex Kholodoff on 19.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import AVKit
import WebKit
//import AVFoundation


struct FM {
        
    public static var temporaryDirectoryURL: URL {
        return FileManager.default.temporaryDirectory
    }
}

class BattlesViewController: UIViewController {

    @IBAction func btBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {

        let battle = Battles().listOfBattle[1]
        
        let lName = UILabel(frame: CGRect(x: 16, y: 50, width: 150, height: 30))
        lName.text = battle.name
        
        let lDate = UILabel(frame: CGRect(x: 180, y: 50, width: 100, height: 30))
        lDate.text = battle.date
        
        let url = saveVideoToTemp(battle.video)

//        let webView = WKWebView(frame: CGRect(x: 16, y: 90, width: self.view.frame.width - 32, height: self.view.frame.height - 120))
//        webView.backgroundColor = .lightGray
//        let request = NSURLRequest(url: url)
//        webView.load(request as URLRequest)
//        self.view.addSubview(webView)

        let player = AVPlayer(url: url)
        let avController = AVPlayerViewController()
        avController.player = player
        avController.view.frame = CGRect(x: 16, y: 90, width: self.view.frame.width - 32, height: self.view.frame.height - 120)
        self.view.addSubview(avController.view)
        self.addChild(avController)
        player.play()
        
        self.view.addSubview(lName)
        self.view.addSubview(lDate)
    }

}

extension BattlesViewController {
    
    private func saveVideoToTemp(_ data: Data) -> URL {
        let url = FM.temporaryDirectoryURL.appendingPathComponent("video.mp4")
        
        print("url for file save = ",url)
                
        do {
            try data.write(to: url)
            print("file video.mp4 successfully create and save in folder Temp")
        } catch {
            print("file video.mp4 NOT save in folder Temp")
        }
        
        return url
    }
}

// save video to temp dir
/*
 if !FileManager.default.fileExists(atPath: FM.temporaryDirectoryURL.appendingPathComponent("\(idSilde)/\(nameDoc)").path) {
     
     print("File \(idSilde)/\(nameDoc) no exist, create it file!")
     
     let url = FM.temporaryDirectoryURL.appendingPathComponent("\(idSilde)/\(nameDoc)")
     
     print("url for file save = ",url)
                     
     // save doc in folder from BD - getDataFromBlob
     let data = FM.db.getDataFromBlob(idDoc)
     
     do {
         try data.write(to: url)
         print("file \(nameDoc) successfully create and save in folder \(idSilde)/")
     } catch {
         print("file \(nameDoc) NOT save in folder \(idSilde)/")
     }
     
 } else {
     print("File \(idSilde)/\(nameDoc) exist!")
 }
 */
