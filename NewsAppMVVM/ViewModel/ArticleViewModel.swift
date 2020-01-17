//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by 矢守叡 on 2020/01/17.
//  Copyright © 2020 yamolean. All rights reserved.
//

//struct ArticleList: Decodable {
//    let articles: [Article]
//}
//
//struct Article: Decodable {
//    let title: String
//    let description: String
//}


import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
