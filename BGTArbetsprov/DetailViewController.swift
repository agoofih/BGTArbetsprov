//
//  DetailViewController.swift
//  BGTArbetsprov
//
//  Created by Daniel T. Barwén on 2018-06-28.
//  Copyright © 2018 Daniel T. Barwén. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDate: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailCredit: UILabel!
    
    var recivedTitle : String = ""
    var recivedDate : String = ""
    var recivedDescription : String = ""
    var recivedLink : String = ""
    var revicedCredit : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTitle.text = recivedTitle
        detailDate.text = recivedDate
        detailDescription.text = recivedDescription
        detailCredit.text = "Credit: \(revicedCredit)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reloadInputViews()
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
