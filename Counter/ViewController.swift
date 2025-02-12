//
//  ViewController.swift
//  Counter
//
//  Created by Svetlana Varenova on 12.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var resetBut: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var textStory: UITextView!
    
    private var count = 0
    private var counter: Int = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  changeButton.backgroundColor = UIColor .gray
        counterLabel.text = "Значение счётчика: 0"
       // minusButton.backgroundColor = UIColor .blue
      //  plusButton.backgroundColor = UIColor .red
        textStory.text = "История изменений:"
        textStory.isEditable = false
        textStory.isScrollEnabled = true
        textStory.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 15.0, right: 0.0)
    }
    
    func addNewMessage(_ message: String) {
        
        textStory.text += "\(message)"
        
        let range = NSRange(location: textStory.text.count - 1, length: 0)
        textStory.scrollRangeToVisible(range)
    }
    
    func addMessageWithDate(message: String) {
       
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        let formattedDate = dateFormatter.string(from: currentDate)

        let messageWithDate = "\(formattedDate) : \(message)"
        
        textStory.text += "\(messageWithDate)"
    }

    
    @IBAction func buttonTap(_ sender: Any) {
        count += 1
        counter = count
        counterLabel.text = "Значение счётчика: " + String(count)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        counter = 0
        counterLabel.text = "Значение счётчика: 0"
        addNewMessage("\n")
        addMessageWithDate(message: "")
        textStory.text += "значение сброшено"
    }
    @IBAction func plusAction(_ sender: Any) {
        counter += 1
        count = counter
        counterLabel.text = "Значение счётчика: " + String(count)
        addNewMessage("\n")
        addMessageWithDate(message: "")
        textStory.text += "значение изменено на +1"
        
    }
    @IBAction func minusAction(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            count = counter
            counterLabel.text = "Значение счётчика: " + String(count)
            addNewMessage("\n")
            addMessageWithDate(message: "")
            textStory.text += "значение изменено на -1"
           
        } else {
            addNewMessage("\n")
            addMessageWithDate(message: "")
            textStory.text += "попытка уменьшить значение счётчика ниже 0"
        }
    }
    
}

