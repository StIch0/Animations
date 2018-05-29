//
//  SecondVeiwController .swift
//  Animations
//
//  Created by Pavel Burdukovskii on 22/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class SecondViewController : UIViewController{
    var textView : UITextView!
    var mabelImage : UIImageView!
    var dipperImage : UIImageView!
    var containerButton : UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.view.backgroundColor = .white

        UIView.animate(withDuration: 2.5, delay: 0.1, options: [.curveEaseInOut], animations: {
            self.textView.alpha = 1
//            self.textView.frame.origin.x += self.view.frame.width
            self.mabelImage.frame.origin.x += self.view.frame.width
            self.dipperImage.frame.origin.x -= self.view.frame.width
        }, completion: nil)
        animateImage()
    }
    
    func setUpView(){
        
        textView = UITextView()
        mabelImage = UIImageView(image: #imageLiteral(resourceName: "mabel"))
        dipperImage = UIImageView(image: #imageLiteral(resourceName: "dipper"))
        containerButton = UIStackView(arrangedSubviews: [mabelImage,dipperImage])
        view.addSubview(textView)
        view.addSubview(containerButton)
        
        containerButton.translatesAutoresizingMaskIntoConstraints = false
        containerButton.axis = .horizontal
        containerButton.distribution = .fillEqually
        containerButton.setCustomSpacing(20, after: mabelImage)
        containerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        containerButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        containerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        
        self.textView.alpha = 0
        containerButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -90).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.textColor = .black
        textView.text = "Hello! \n I so glad to see you in \n Gravity Falls \n Please choose you character"
        textView.font = UIFont.boldSystemFont(ofSize: 38)
        textView.textAlignment = .center
        
    }
    @objc func makeAnimation(state : UITapGestureRecognizer){
//        print("dsadasdasdsadasdasdasdasds")
        let imageView = state.view?.subviews as! [UIImageView]
        let size = self.dipperImage.transform
        if imageView.first == UIImageView(image: #imageLiteral(resourceName: "dipper")){
            UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 2, initialSpringVelocity: 0.2, options: [.curveEaseInOut, .autoreverse], animations: {
                self.dipperImage.transform = self.dipperImage.transform.scaledBy(x: 2, y: 2)
            }, completion: { _ in
                self.dipperImage.transform = size
            })
        }else if imageView.last == UIImageView(image: #imageLiteral(resourceName: "mabel")){
            UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 2, initialSpringVelocity: 0.2, options: [.curveEaseInOut, .autoreverse], animations: {
                self.mabelImage.transform = self.mabelImage.transform.scaledBy(x: 2, y: 2)
            }, completion: { _ in
                self.mabelImage.transform = size
            })
        }
    }
    
    func animateImage(){
        let recognaizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(makeAnimation))
        containerButton.addGestureRecognizer(recognaizer)
//        mabelImage.addGestureRecognizer(recognaizer)
//        UIView.transition(with: self.dipperImage, duration: 2, options: [.curveEaseInOut], animations: {
//
//        }, completion: nil)
        
       
    }
    
}
