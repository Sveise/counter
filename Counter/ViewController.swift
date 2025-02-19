//
//  ViewController.swift
//  Counter
//
//  Created by Svetlana Varenova on 12.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var changeButton: UIButton!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var resetBut: UIButton!
    @IBOutlet private var minusButton: UIButton!
    @IBOutlet private var plusButton: UIButton!
    @IBOutlet private var textStory: UITextView!
    
    private var count = 0
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: 0"
        textStory.text = "История изменений:\n"
        textStory.isEditable = false
        textStory.isScrollEnabled = true
        textStory.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 15.0, right: 0.0)
    }
    
    
   private func addMessageWithDate(message: String) {
       
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        let formattedDate = dateFormatter.string(from: currentDate)

        let messageWithDate = "\(formattedDate) : \(message)\n"
        
        textStory.text += "\(messageWithDate)"
       
       let range = NSRange(location: textStory.text.count - 1, length: 1)
       textStory.scrollRangeToVisible(range)
    }

    
    @IBAction private func buttonTap(_ sender: Any) {
        count += 1
        counter = count
        counterLabel.text = "Значение счётчика: " + String(count)
    }
    
    @IBAction private func resetButton(_ sender: Any) {
        count = 0
        counter = 0
        counterLabel.text = "Значение счётчика: 0"
        addMessageWithDate(message: "значение сброшено")
    }
    @IBAction private func plusAction(_ sender: Any) {
        counter += 1
        count = counter
        counterLabel.text = "Значение счётчика: " + String(count)
        addMessageWithDate(message: "значение изменено на +1")
        
    }
    @IBAction private func minusAction(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            count = counter
            counterLabel.text = "Значение счётчика: " + String(count)
            addMessageWithDate(message: "значение изменено на -1")
           
        } else {
            addMessageWithDate(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
}

