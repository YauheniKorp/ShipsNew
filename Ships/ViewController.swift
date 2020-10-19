//
//  ViewController.swift
//  Ships
//
//  Created by Admin on 07.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db = DB()
    var ships = Ships().listOfShips
    
    enum TitleForSegment: String {
        case Battles = "Battles"
        case Ships = "Ships"
        case Outcomes = "Outcomes"
    }
    
    var segmentControll: UISegmentedControl = {
        let titles = ["Battles","Ships","Outcomes", "Full"]
        var segment = UISegmentedControl(items: titles)
        segment.frame = CGRect(x: 10, y: 500, width: 360, height: 50)
        segment.setWidth(90, forSegmentAt: 0)
        segment.setWidth(90, forSegmentAt: 1)
        segment.setWidth(90, forSegmentAt: 2)
        segment.setWidth(90, forSegmentAt: 3)
        segment.backgroundColor = .systemYellow
        
        return segment
    }()
    
    let pick = UIPickerView()
    
    var textView: UITextView = {
        var textView = UITextView(frame: CGRect(x: 40, y: 30, width: 300, height: 450))
        
        textView.backgroundColor = .clear   // прозрачный фон
        
        return textView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // test ShipView
        let shipView0 = ShipView(ship: ships.first!)
        self.view.addSubview(shipView0)
        
        let shipView1 = ShipView(ship: ships[1], index: 1, frame: CGRect(x: 180, y: 20, width: 150, height: 140) )
        self.view.addSubview(shipView1)
        
        let shipView2 = ShipView(ship: ships[2], index: 2, frame: CGRect(x: 16, y: 180, width: 150, height: 140) )
        self.view.addSubview(shipView2)
        
        
        self.view.addSubview(textView)
        self.view.addSubview(segmentControll)
        segmentControll.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        
        pick.center = view.center
        pick.dataSource = self
        pick.delegate = self
        view.addSubview(pick)
        pick.isHidden = true
        
        let buttonBattles = UIButton(frame: CGRect(x: 16, y: 600, width: 100, height: 20))
        buttonBattles.backgroundColor = .lightGray
        buttonBattles.setTitle("Battles", for: .normal)
        buttonBattles.addTarget(self, action: #selector(showBattles), for: .touchUpInside)
        self.view.addSubview(buttonBattles)
    }
    
    // BattlesStoryboard.storyboard BattlesViewController.swift IdBattlesSB
    @objc func showBattles() {
        let storyboard: UIStoryboard = UIStoryboard(name: "BattlesStoryboard", bundle: nil)
        let controller: BattlesViewController = storyboard.instantiateViewController(withIdentifier: "IdBattlesSB") as! BattlesViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    //MARK: - Value for each segment
    @objc func changeValue() {
        
        switch segmentControll.selectedSegmentIndex {
        case 0:
            pick.isHidden = true
            let battles = db.gettingBattleList()
            var resultString = ""
            for value in battles {
                resultString += value + "\n"
            }
            textView.text = resultString
        case 1:
            textView.text = ""
            pick.isHidden = false
            
        case 2:
            pick.isHidden = true
            let textForOutomesSegment = db.gettingOutcomesList()
            var resultText = ""
            for value in textForOutomesSegment {
                resultText += value + "\n"
            }
            textView.text = resultText
        case 3:
            pick.isHidden = true
            let storyboard: UIStoryboard = UIStoryboard(name: "ShipsStoryboard", bundle: nil)
            let controller: ShipsCollectionViewController = storyboard.instantiateViewController(withIdentifier: "shipsID") as! ShipsCollectionViewController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
            
        default:
            break
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let result = db.gettingClassOfShips()
        return result.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var result = db.gettingClassOfShips()
        result.insert("All", at: 0)
        
        return result[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedIndex = pickerView.selectedRow(inComponent: 0)
        let result = db.gettingClassOfShips()
       
        
        //TODO: make models of ship, ships[], class, classes[], battle, battles[]
        func changeTextViewForShipsByClass() {
            if segmentControll.selectedSegmentIndex == 1 {
                textView.text = ""
                let newRes = db.gettingShipsList(result[selectedIndex - 1])
                var textInTextView = ""
                for value in newRes {
                    textInTextView += value + "\n"
                }
                textView.text = textInTextView
            } else {
                
            }
        }
        
        switch selectedIndex {
        case 0:
            let res = db.gettingShipsList()
            var newTextForTextView = ""
            for value in res {
                newTextForTextView += value + "\n"
            }
            textView.text = newTextForTextView
        case 1:
            changeTextViewForShipsByClass()
            
        case 2:
            changeTextViewForShipsByClass()
            
        case 3:
            changeTextViewForShipsByClass()
            
        case 4:
            changeTextViewForShipsByClass()
            
        case 5:
            changeTextViewForShipsByClass()
            
        case 6:
            changeTextViewForShipsByClass()
        case 7:
            changeTextViewForShipsByClass()
            
        default:
            break
        }
        
    }

}
