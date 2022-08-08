//
//  HomePage.swift
//  USNews
//
//  Created by Gökçe Kahraman on 1.08.2022.
//

import Foundation
import UIKit

class DetailPageVC : UIViewController{
    
    @IBOutlet weak var lTitle: UILabel!
    @IBOutlet weak var lDesc: UILabel!
    
    var new: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        lTitle.text = new?.headline
        lDesc.text = new?.desc
        
    }

}
