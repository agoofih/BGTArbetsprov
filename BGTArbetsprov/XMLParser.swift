//
//  XMLParser.swift
//  BGTArbetsprov
//
//  Created by Daniel T. Barwén on 2018-06-27.
//  Copyright © 2018 Daniel T. Barwén. All rights reserved.
//

import Foundation

struct RSSItem {
    var title : String
    var description : String
    var pubDate : String
    var link : String
    var credit : String
    var imageURL : String
}

class FeedParser : NSObject, XMLParserDelegate {
    
    var rssItem : [RSSItem] = []
    var currentElement = ""
    var currentTitle : String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    var currentDescription : String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    var currentPubDate : String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    var currentLink : String = "" {
        didSet {
            currentLink = currentLink.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    var currentCredit : String = "" {
        didSet {
            currentCredit = currentCredit.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    var currentImageURL : String = "" {
        didSet {
            currentImageURL = currentImageURL.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    var parserCompletionHandler : (([RSSItem]) -> Void )?
    
    func parseFeed(url: String, completionHandler: (([RSSItem]) -> Void)?) {
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        switch currentElement {
        case "item":
            currentTitle = String()
            currentDescription = String()
            currentPubDate = String()
            currentLink = String()
            currentCredit = String()
            currentImageURL = String()
            
        case "enclosure":
            if let urlString = attributeDict["url"] {
                print(urlString)
                print("enc details")
                currentImageURL += urlString
            } else {
                print("malformed element: enclosure without url attribute")
            }
        default : break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
            case "title" : currentTitle += string
            case "description" : currentDescription += string
            case "pubDate" : currentPubDate += string
            case "link" : currentLink += string
            case "media:credit" : currentCredit += string
            
            default : break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, description: currentDescription, pubDate: currentPubDate, link: currentLink, credit: currentCredit, imageURL: currentImageURL)
            self.rssItem.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItem)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
}









