//
//  ViewController.swift
//  BGTArbetsprov
//
//  Created by Daniel T. Barwén on 2018-06-27.
//  Copyright © 2018 Daniel T. Barwén. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var rssItems : [RSSItem]?
    private let url = "http://www.dailymail.co.uk/sport/index.rss"
    
    var sendValueTitle : String = ""
    var sendValueDate : String = ""
    var sendValueDescription : String = ""
    var sendValueLink : String = ""
    var sendValueCredit : String = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        getData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        return rssItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! TableViewCell
        
        if let item = rssItems?[indexPath.item] {
            cell.item = item
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendValueTitle = (rssItems?[indexPath.item].title)!
        sendValueDate = (rssItems?[indexPath.item].pubDate)!
        sendValueDescription = (rssItems?[indexPath.item].description)!
        
        self.performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }

    private func getData() {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: url) {
            (rssItems) in
            self.rssItems = rssItems
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let reciverVC = segue.destination as! DetailViewController
        reciverVC.recivedTitle = sendValueTitle
        print(sendValueTitle)
    }
}

