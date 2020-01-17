//
//  WebService.swift
//  NewsAppMVVM
//
//  Created by 矢守叡 on 2020/01/17.
//  Copyright © 2020 yamolean. All rights reserved.
//
import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    //Article型の配列を戻す
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}
