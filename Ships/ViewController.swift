//
//  ViewController.swift
//  Ships
//
//  Created by Admin on 07.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ships = Ships()
    
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
        
        return textView
    }()
    
    var db = DB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(textView)
        self.view.addSubview(segmentControll)
        segmentControll.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        
        
        pick.center = view.center
        pick.dataSource = self
        pick.delegate = self
        view.addSubview(pick)
        pick.isHidden = true
        
        
        print(db.openDB())
        
        print(Ships())
        //        print(db.gettingShipsList("Kongo"))
        //        print(db.gettingBattleList())
        
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
            //            var pick = UIPickerView(frame: CGRect(x: Int(view.center.x) - Int((view.frame.width / 3) / 2), y: Int(view.center.y), width: Int(view.frame.width / 3), height: Int(view.frame.height / 3)))
            
            pick.isHidden = false
            
            
            //view.addSubview(pick)
            // let ships = db.gettingShipsList(<#T##dbClass: String##String#>)
            
        //            textView.text = "Ships"
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
//            var str = Battles.init().listOfBattle
//            print(str[1])
//            var str = Ships.init().listOfShips
//            print(str[0])
//            self.view.addSubview(ShipView(str[0]))
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
