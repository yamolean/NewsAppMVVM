//
//  NewsListTableViewController.swift
//  NewsAppMVVM
//
//  Created by 矢守叡 on 2020/01/17.
//  Copyright © 2020 yamolean. All rights reserved.
//

//https://newsapi.org/v2/top-headlines?country=us&apiKey=48841c2f9bca4be58c27da788834e598

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=48841c2f9bca4be58c27da788834e598")!
        //Article型の配列が返る
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleArray = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleArray.title
        cell.descriptionLabel.text = articleArray.description
        return cell
    }
}
