//
//  ButtonsView.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 07/09/21.
//

import UIKit

class ButtonsView: UIView {
    
    weak var delegate: ButtonsDelegate!
    weak var resetDelegate: ClearDelegate!
    
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        resetDelegate.reset()
        delegate.clear()
        resetDelegate.reset()
    }
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        delegate.done()
    }
    
    func applyAction() {
        delegate.apply()
    }
}
