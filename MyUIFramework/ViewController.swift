//
//  ViewController.swift
//  MyUIFramework
//
//  Created by SUP'Internet 15 on 29/01/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //extend UIView

        //self.view.addSubviewGrid()
        
        //create label
        let label = UILabel()
        label.frame = CGRect()
        label.text = "Label"
        label.backgroundColor = .red
        label.textAlignment = .center
        label.textColor = .white
        
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        
        label.font = label.font.withSize(2)
        
        
        //create label2
        let label2 = UILabel()
        label2.frame = CGRect()
        label2.text = "Label"
        label2.backgroundColor = .blue
        label2.textAlignment = .center
        label2.textColor = .white
        
        label2.numberOfLines = 2
        label2.lineBreakMode = .byWordWrapping
        
        label2.font = label2.font.withSize(2)
        
        
        
        

        
        self.view.grid = Grid(width: 12, height: 12 ) //champ de traitement
        
        
        self.view.addSubviewGrid(view: label, grid: ["x": 0, "y": 2, "width":3, "height": 3])
        self.view.addSubviewGrid(view: label2, grid: ["x": 9, "y": 2, "width":3, "height": 3])

        print(label.frame)
        print(label2.frame)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}




//taille du frame maximal
class Grid{
    var width: CGFloat
    var height: CGFloat
        init(width: CGFloat, height: CGFloat){
        self.width = width
        self.height = height
        
    }
    

}


func associatedObject<ValueType: AnyObject>(
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    initialiser: () -> ValueType)
    -> ValueType {
        if let associated = objc_getAssociatedObject(base, key)
            as? ValueType { return associated }
        let associated = initialiser()
        objc_setAssociatedObject(base, key, associated,
                                 .OBJC_ASSOCIATION_RETAIN)
        return associated
}
func associateObject<ValueType: AnyObject>(
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    value: ValueType) {
    objc_setAssociatedObject(base, key, value,
                             .OBJC_ASSOCIATION_RETAIN)
}


private var gridKey: UInt8 = 0 // increment automaticly
extension UIView {
    var grid: Grid { // cat is *effectively* a stored property
        get {
            return associatedObject(base: self, key: &gridKey)
            { return Grid(width: 12, height: 12) } // Set the initial value of the var
        }
        set { associateObject(base: self, key: &gridKey, value: newValue) }
    }
}




extension UIView {
    func addSubviewGrid(view: UIView, grid: [String:CGFloat] ){
        
    
        
        let widthCubeIntoGrid = (self.frame.width / self.grid.width) * grid["width"]!
        let heigthCubeIntogRID = (self.frame.height / self.grid.height) * grid["height"]!
        
        let xCubeIntoGrid = (self.frame.width / self.grid.width) * grid["x"]!
        let yCudeIntoGrid = (self.frame.height / self.grid.height) * grid["y"]!
        
        view.frame = CGRect(x: xCubeIntoGrid, y: yCudeIntoGrid, width: widthCubeIntoGrid , height: heigthCubeIntogRID)
        
        
        self.addSubview(view)
        
    }
    
}

