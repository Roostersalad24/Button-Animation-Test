//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Andrew Johnson on 2/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isPlaying: Bool = true {
        didSet {
            playPauseButton.isSelected = isPlaying
        }
    }
    
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*reverseBackground.layer.cornerRadius =
         reverseBackground.frame.height/2
         reverseBackground.clipsToBounds = true
         
         playPauseBackground.layer.cornerRadius =
         playPauseBackground.frame.height/2
         playPauseBackground.clipsToBounds = true
         
         forwardBackground.layer.cornerRadius =
         forwardBackground.frame.height/2
         forwardBackground.clipsToBounds = true*/
        
        [reverseBackground, playPauseBackground, forwardBackground].forEach { view in
            view?.layer.cornerRadius = view!.frame.height/2
            view?.clipsToBounds = true
            view?.alpha = 0.0
        }
        
        
       
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(withDuration: 0.8, delay: 0,  usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: {self.albumImageView.transform = CGAffineTransform.identity}, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5) {  self.albumImageView.transform =
                CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.3
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        }
        
        
    }
    
}
