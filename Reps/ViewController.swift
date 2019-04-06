//
//  ViewController.swift
//  Reps
//
//  Created by Flex AI on 2019-01-11.
//  Copyright © 2019 Flex AI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var repsView: UIView!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var mainView: BorderedView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var bubblesView: ShadowedView!
    @IBOutlet weak var arrowUpImageView: UIImageView!
    @IBOutlet weak var arrowDownImageView: UIImageView!
    @IBOutlet weak var secondView: BorderedView!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var bubblesViewHeightConstraint: NSLayoutConstraint!
    
    let impact: (
        light: UIImpactFeedbackGenerator,
        medium: UIImpactFeedbackGenerator,
        heavy: UIImpactFeedbackGenerator) = (
            UIImpactFeedbackGenerator(style: .light),
            UIImpactFeedbackGenerator(style: .medium),
            UIImpactFeedbackGenerator(style: .heavy)
    )
    
    let notification = UINotificationFeedbackGenerator()
    
    //MARK: - Properties
    let bubblesViewHeight: CGFloat = 254.0
    
    var tapCurrentValue: Int = 8
    var initialValue: Int = 8
    
    var lpCurrentValue: Int = 8
    var lpPrevValue: Int = 0
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        impact.light.prepare()
        impact.medium.prepare()
        impact.heavy.prepare()
        
        repsView.layer.cornerRadius = 12.0
        bubblesView.layer.cornerRadius = 20.0
        
        repLabel.text = "\(lpCurrentValue)"
        
        arrowUpImageView.image = arrowUpImageView.image?.withRenderingMode(.alwaysTemplate)
        arrowUpImageView.tintColor = UIColor.black.withAlphaComponent(0.1)
        
        arrowDownImageView.image = arrowDownImageView.image?.withRenderingMode(.alwaysTemplate)
        arrowDownImageView.tintColor = UIColor.black.withAlphaComponent(0.32)
    }
    
    //MARK: - Actions
    @IBAction func longPressGestureAction(_ sender: UILongPressGestureRecognizer) {
        
        switch sender.state {
        case .began:
            showRepsView()
            notification.notificationOccurred(.success)
        case .changed:
            let point = sender.location(in: bubblesView)
            changeRepsValue(with: point.y)
        case .ended:
            hideRepsView()
            
        default:
            break
        }
    }
    
    @IBAction func tapGestureAction(_ sender: Any) {
        tapCurrentValue -= 1
        if tapCurrentValue < 1 {
            tapCurrentValue = initialValue
        }
        secondLabel.text = "\(tapCurrentValue)"
        impact.light.impactOccurred()
    }
    
    func showRepsView() {
        repsView.alpha = 0.0
        bubblesViewHeightConstraint.constant = 0.0
        bubblesView.alpha = 1.0
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let `self` = self else { return }
            
            self.repsView.alpha = 1.0
            self.bubblesViewHeightConstraint.constant = self.bubblesViewHeight
            self.view.layoutIfNeeded()
        }
    }
    
    func changeRepsValue(with value: CGFloat) {
        let padding: CGFloat = 64.0
        let currentValue = value - padding
        if (currentValue >= bubblesViewHeight - padding) || (currentValue < 0) {
            return
        }
        
        let currentRep = lpCurrentValue - Int(round(currentValue/27.75))

        if currentRep < 1 { return }
        if currentRep != lpPrevValue {
            repLabel.text = "\(currentRep)"
            lpPrevValue = currentRep
            impact.light.impactOccurred()
        }
    }
    
    func hideRepsView() {
        mainLabel.text = "\(lpPrevValue)"
        
        bubblesViewHeightConstraint.constant = self.bubblesViewHeight
        repsView.alpha = 1.0
        self.bubblesView.alpha = 0.0
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let `self` = self else { return }
            
            self.repsView.alpha = 0.0
            self.bubblesViewHeightConstraint.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
    
}

