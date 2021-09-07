//
//  ButtonsView.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 07/09/21.
//

import UIKit

class ButtonsView: UIView {
    
    weak var delegate: ButtonsDelegate!
    
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        delegate.clear()
    }
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        delegate.done()
    }
    
    func applyAction() {
        delegate.apply()
    }
}
