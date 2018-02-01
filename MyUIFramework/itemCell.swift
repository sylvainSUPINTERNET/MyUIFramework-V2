//
//  itemCell.swift
//  MyUIFramework
//
//  Created by SUP'Internet 15 on 29/01/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import Foundation
import UIKit



class ItemCell: UITableViewCell {
    
    
    func prepareView(data: [String:String] ){
        //print(data)
    
        
        
            
            
            //self.contentView.backgroundColor = .red
            
            
            //container for text
            let rigthText = UIView()
        
            let labelText = UILabel()
            labelText.text = data["name"]!
        
            
            let date = UILabel()
            date.text = data["date"]!
            date.textColor = UIColor.lightGray
            date.font = date.font.withSize(9)
        
        
            let desc = UILabel()
            desc.text = data["desc"]!
            desc.font = date.font.withSize(10)
            desc.contentMode = .scaleToFill
            desc.textAlignment = .justified;
            desc.numberOfLines = 2;
            desc.lineBreakMode = .byTruncatingTail;

        
            
            //container for price
            let rigthMoreText = UIView()
        
            
            let price = UILabel()
            price.text = data["price"]!
            price.textColor = .orange

        
            
            
            let imageName = data["pic"]!
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            
            
            let view = UIView()
            //view.backgroundColor = .blue
            self.contentView.addSubviewGrid(view:view, grid: ["x": 0, "y":0, "width": 4,"height": 12])
            self.contentView.addSubviewGrid(view: imageView, grid: ["x": 0, "y":0, "width": 4,"height": 12])
            self.contentView.addSubviewGrid(view: desc, grid: ["x": 4, "y":1, "width": 4,"height": 12])
            
            //block rigth
            self.contentView.addSubviewGrid(view: rigthText, grid: ["x": 4, "y":0, "width": 4,"height": 12])
            rigthText.addSubviewGrid(view:labelText, grid : ["x": 0, "y":1, "width": 9,"height": 2])
            rigthText.addSubviewGrid(view: date, grid: ["x": 0, "y":5, "width": 12,"height": 10])
            
            
            //block more rigth
            self.contentView.addSubviewGrid(view: rigthMoreText, grid: ["x": 9, "y":0, "width": 8,"height": 12])
            rigthMoreText.addSubviewGrid(view:price, grid : ["x": 2, "y":4, "width": 8,"height": 2])
            
            
        

        
        
    }
}


