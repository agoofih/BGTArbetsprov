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
    @IBOutlet weak var detailImageView: UIImageView!
    
    var recivedTitle : String = ""
    var recivedDate : String = ""
    var recivedDescription : String = ""
    var recivedLink : String = ""
    var revicedCredit : String = ""
    var recivedImageURL : String = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let urlImage = URL(string: recivedImageURL)
        detailTitle.text = recivedTitle
        detailDate.text = recivedDate
        detailDescription.text = recivedDescription
        detailCredit.text = "Credit: \(revicedCredit)"
        detailImageView.layer.cornerRadius = detailImageView.frame.width / 2
        detailImageView.clipsToBounds = true
        
        let session = URLSession(configuration: .default)

        let getImageFromUrl = session.dataTask(with: urlImage!) { (data, response, error) in
            if let e = error {
                print("Error: \(e)")
            } else {
                if (response as? HTTPURLResponse) != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        
                        DispatchQueue.main.sync {
                            self.detailImageView.image = image
                        }
                    } else {
                        print("Image file problem")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        getImageFromUrl.resume()
        
    }

    @IBAction func readMoreAction(_ sender: Any) {
        self.performSegue(withIdentifier: "webSegue", sender: self)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let reciverVC = segue.destination as! WebKitViewController

        reciverVC.recivedLinkWeb = recivedLink
    }


}
