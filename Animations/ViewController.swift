//
//  ViewController.swift
//  Animations
//
//  Created by Pavel Burdukovskii on 21/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var colorArr : [UIColor] = Array(arrayLiteral: .red,.orange,.green,.yellow, .cyan,.purple)
    var picture = UIImageView()
    var touch : Int = 0
    var container : UIStackView!
    var labelText = UILabel()
    fileprivate func setUpContainerView() {
        labelText.text = "Welcome to \n Gravity Falls, it is mystery place, be careful!"
        labelText.numberOfLines = 0
        labelText.font = UIFont(name: "Helvetica", size: 35)
        labelText.textColor = .black
        labelText.textAlignment = .center
        picture.image = #imageLiteral(resourceName: "Gravity_Falls")
        container = UIStackView(arrangedSubviews: [picture, labelText])
        view.addSubview(container)
        container.axis = .vertical
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        container.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -200).isActive = true
        container.distribution  = .fillEqually
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpContainerView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToImage))
        tap.numberOfTapsRequired = 1
        container.addGestureRecognizer(tap)
    }
    
    @objc private func tapToImage(tap : UITapGestureRecognizer){
//        switch tap.state {
//        case .ended:
//            UIView.transition(with: self.picture, duration: 3, options: [.transitionFlipFromTop , .curveEaseInOut], animations: {
//                if self.picture.image == #imageLiteral(resourceName: "Gravity_Falls"){
//                    self.picture.image = #imageLiteral(resourceName: "man")
//                    self.labelText.alpha = 0
//                }
//                else {
//                    self.picture.image = #imageLiteral(resourceName: "Gravity_Falls")
//                    self.labelText.alpha = 1
//                }
//            }, completion: nil)
//        default:
//            break
//        }
        switch tap.state {
        case .began:
            print("Began")
        case .cancelled:
            print("cancelled")
        case .changed:
            print("changed")
        case .ended:
            print("ended")

//            UIView.animate(withDuration: 1.5, delay: 2.5, options: [.curveEaseInOut], animations: {
//                 self.labelText.alpha = 0
//                    self.touch += 1
//                    self.labelText.text = "\(self.touch)"
//                    self.labelText.alpha = 1
//
//            })
            UIView.transition(with: self.view, duration: 3, options: [.transitionFlipFromRight,  .transitionFlipFromLeft, .curveEaseInOut ], animations: {
//
                self.labelText.alpha = 0
                self.picture.alpha = 0
//                self.touch += 1
//                self.labelText.text = "\(self.touch)"
//                self.labelText.alpha = 1
//                self.picture.backgroundColor = self.colorArr[self.touch]
                
            } ,completion: { _ in
               // UIView.animate(withDuration: 3, delay: 0, options: [.transitionFlipFromRight,  .transitionFlipFromLeft, .curveEaseInOut], animations: {
                    let controllerView = SecondViewController()
                    self.navigationController?.setViewControllers([self,controllerView], animated: false)
              //  }, completion: nil)
                
            })
            
            
        case .failed:
            print("failed")
        case .possible:
            print("possible")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

