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
    
    var recivedTitle : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTitle.text = recivedTitle
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
