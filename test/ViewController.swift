//
//  ViewController.swift
//  test
//
//  Created by alumno on 9/03/17.
//  Copyright © 2017 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipo:String!
    
    @IBOutlet weak var contenedor: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(tipo)
        
        switch tipo {
        case "UITapGestureRecognizer":
            let TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
            TapGestureRecognizer.numberOfTapsRequired = 2
            contenedor.addGestureRecognizer(TapGestureRecognizer)
            
        case "UIPinchGestureRecognizer":
            let PinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
            PinchGestureRecognizer.scale  = 2
            contenedor.addGestureRecognizer(PinchGestureRecognizer)
        case "UIRotationGestureRecognizer":
            let RotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
            contenedor.addGestureRecognizer(RotationGestureRecognizer)
         case "UISwipeGestureRecognizer":
            let SwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
            SwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
            SwipeGestureRecognizer.numberOfTouchesRequired = 1
            contenedor.addGestureRecognizer(SwipeGestureRecognizer)
        case "UIPanGestureRecognizer":
            let PanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan))
            PanGestureRecognizer.maximumNumberOfTouches = 1
            PanGestureRecognizer.maximumNumberOfTouches = 3
            contenedor.addGestureRecognizer(PanGestureRecognizer)
            
        case "UIScreenEdgeGestureRecognizer":
            let ScreenEdgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenedgepan))
            ScreenEdgeGestureRecognizer.edges = UIRectEdge.right
            self.view.addGestureRecognizer(ScreenEdgeGestureRecognizer)
            
        default:
            let LongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longpress))
            LongPressGestureRecognizer.minimumPressDuration = 2
            LongPressGestureRecognizer.numberOfTapsRequired = 0
            LongPressGestureRecognizer.numberOfTouchesRequired = 1
            contenedor.addGestureRecognizer(LongPressGestureRecognizer)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tap(){
        print("tap")
        let alerta = UIAlertController(title: "Gestos", message: "Estas utilizando UITapGestureRecognizer", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(ok)
        self.present(alerta, animated: true) { 
            
        }
    }
    
    func pinch(sender: UIPinchGestureRecognizer){
        print("pinch")
        print("Scale: \(sender.scale)")
        print("Velocidad: \(sender.velocity)")
    }
    func rotate(sender : UIRotationGestureRecognizer){
        

        
        if(sender.rotation > 2){
            print("rotate")
        }
        else{
            print("Rotation: \(sender.rotation)")
            print("Velocidad: \(sender.velocity)")
        }
    }

    func swipe(){
    
    print("swipe")
    }
    
    func pan(sender: UIPanGestureRecognizer){
        
        print("pan")
        print("Translacion: \(sender.translation(in: contenedor)) ")
    }
    
    func screenedgepan(){
        print("screenedgepan")
    }
    
    func longpress(){
    
    print("longpress")
    }
}

