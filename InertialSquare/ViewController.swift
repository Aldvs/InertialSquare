//
//  ViewController.swift
//  InertialSquare
//
//  Created by admin on 18.11.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var squareView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemBlue
        
        view.bounds.size = .init(width: 100, height: 100)
        
        return view
    }()
    

    private lazy var animator = UIDynamicAnimator(referenceView: view)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        animateSquare(with: touch.location(in: view))
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(squareView)
        squareView.frame.origin = .init(x: view.bounds.width / 2 - 50 , y: view.bounds.height / 2 - 50)
    }
    
    private func animateSquare(with location: CGPoint) {
        animator.removeAllBehaviors()
        
        let snapBehavior = UISnapBehavior(item: squareView, snapTo: location)
        snapBehavior.damping = 0.9
        
        animator.addBehavior(snapBehavior)
    }

}

