//
//  ViewController.swift
//  USNews
//
//  Created by Gökçe Kahraman on 1.08.2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var FavoritesButton: UIBarButtonItem!
       
    

    
    var articles: [Article]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        fetchArticles()
    }
    

    
    
    
    func fetchArticles(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3b6742e35411486587d4302d015f6852")!)
    
        let task = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            if error != nil{
                print("error")
                return
            }
            
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]]{
                    for articlesFromJson in articlesFromJson{
                        let article = Article()
                        if let title =  articlesFromJson["title"] as? String,
                           let desc = articlesFromJson["description"] as? String,
                           let url = articlesFromJson["url"] as? String,
                           let urlToImage = articlesFromJson["urlToImage"] as? String{
                            
                            article.desc = desc
                            article.headline = title
                            article.url = url
                            article.imageUrl = urlToImage
                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()

                }
                
                
//                try throwing expression
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        if let article = self.articles?[indexPath.item] {
            cell.title.text = article.headline
            cell.desc.text = article.desc
            if let picture = article.imageUrl {
                cell.imgView.downloadImage(from: picture)

            }
        }
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
               
            let destination = segue.destination as! DetailPageVC
            if let newIndex = tableview.indexPathForSelectedRow?.row {
                let article = self.articles?[newIndex]
                destination.new = article
            } //tableView.indexPathForSelectedRow?.row
            
        }
    }
    
    
}

extension UIImageView{
    func downloadImage(from url: String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task =  URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
        
    
    }
}

