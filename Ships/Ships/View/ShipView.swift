//
//  ShipView.swift
//  Ships
//
//  Created by Admin on 14.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

//class ShipView: UIView {
//
//    private var ship = Ship()
//    
//    private var shipImage = UIImageView()
//    private var name = UILabel()
//    private var shipClass = UILabel()
//    private var launched = UILabel()
//    
//    init(_ ship: Ship) {
//        
//        let frame = CGRect(x: 100, y: 50, width: 200, height: 200)
//        
//        super.init(frame: frame)
//        self.ship = ship
//        self.shipImage.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
//        
//        if let icon = self.ship.icon {
//            self.shipImage.image = icon
//        } 
//        
//        
//        self.name.text = self.ship.name
//        self.shipClass.text = self.ship.shipClass
//        self.launched.text = String(self.ship.launched)
//        
//        self.backgroundColor = .yellow
//        self.addSubview(self.shipImage)
//        self.addSubview(self.name)
//        self.addSubview(self.shipClass)
//        self.addSubview(self.launched)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//
//}
