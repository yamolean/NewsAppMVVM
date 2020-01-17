//
//  Article.swift
//  NewsAppMVVM
//
//  Created by 矢守叡 on 2020/01/17.
//  Copyright © 2020 yamolean. All rights reserved.
//

//{
//"status": "ok",
//"totalResults": 38,
//-"articles": [
//-{
//-"source": {
//"id": null,
//"name": "Youtube.com"
//},
//"author": null,
//"title": "Tucker: DNC worried about Sanders becoming nominee - Fox News",ここここここここここここここここここここここここ
//"description": "CNN sides with Elizabeth Warren against Bernie Sanders. FOX News operates the FOX News Channel (FNC), FOX Business Network (FBN), FOX News Radio, FOX News He...",ここここここここここここここここここここここここ
//"url": "https://www.youtube.com/watch?v=lQnAvJ2EiRs",
//"urlToImage": "https://i.ytimg.com/vi/lQnAvJ2EiRs/maxresdefault.jpg",
//"publishedAt": "2020-01-17T02:30:04Z",
//"content": null
//},
//-{

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
