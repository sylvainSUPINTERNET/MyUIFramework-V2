//
//  ViewController.swift
//  MyUIFramework
//
//  Created by SUP'Internet 15 on 29/01/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import UIKit




class ViewController: UITableViewController {
    var array = [
        ["name":"banana", "desc": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?", "price": "10e", "pic": "pic.png", "lon" : "2.373294", "lat" : "48.86614","date": "11/11/2018"],
        ["name": "ezaoeoae", "desc": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?", "price":"50e", "pic": "coca.jpg", "lon" : "1.35955810546875", "lat" : "49.35733376286064", "date": "07/03/2018"]
    ];
    

    override func tableView(_ _tableView: UITableView, numberOfRowsInSection section: Int)-> Int    {
            return array.count
        }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    //header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
        header.backgroundColor = .orange
        let text = UILabel();
        text.text = "Voir les annonces"
        text.backgroundColor = .white
        
        header.addSubviewGrid(view: text, grid: ["x": 0, "y":0, "width": 12,"height": 6])
        header.bounds = view.frame.insetBy(dx: 00.0, dy: 5.0)

    
        return header
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("row select \(indexPath)")
    }
    
    
    //automatiquement call sur la modal du produitinfo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "myProduct"){
            //present(productInfoCtrl!, animated: true, completion: nil)
            let controller = segue.destination as! ProductInfo
            let index = self.tableView.indexPathForSelectedRow?.row
            
            controller.product = array[index!]
        

        }
    }

    
    
    
    override func tableView(_ _tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        print(indexPath.row)
        cell.prepareView(data: array[indexPath.row])
        
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)-> CGFloat {
        return 90
    }
    
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
        
        
        //self.view.addSubviewGrid(view: label, grid: ["x": 0, "y": 2, "width":3, "height": 3])
        //self.view.addSubviewGrid(view: label2, grid: ["x": 9, "y": 2, "width":3, "height": 3])

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

