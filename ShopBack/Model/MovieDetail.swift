//
//  MovieDetail.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation

/*
 "adult": false,
 "backdrop_path": "/lvjscO8wmpEbIfOEZi92Je8Ktlg.jpg",
 "belongs_to_collection": null,
 "budget": 20000000,
 "genres": [
 {
 "id": 53,
 "name": "Thriller"
 },
 {
 "id": 9648,
 "name": "Mystery"
 },
 {
 "id": 18,
 "name": "Drama"
 }
 ],
 "homepage": "http://blacksheepumich.com/",
 "id": 450465,
 "imdb_id": "tt6823368",
 "original_language": "en",
 "original_title": "Glass",
 "overview": "In a series of escalating encounters, security guard David Dunn uses his supernatural abilities to track Kevin Wendell Crumb, a disturbed man who has twenty-four personalities. Meanwhile, the shadowy presence of Elijah Price emerges as an orchestrator who holds secrets critical to both men.",
 "popularity": 305.521,
 "poster_path": "/svIDTNUoajS8dLEo7EosxvyAsgJ.jpg",
 "production_companies": [
 {
 "id": 33,
 "logo_path": "/8lvHyhjr8oUKOOy2dKXoALWKdp0.png",
 "name": "Universal Pictures",
 "origin_country": "US"
 },
 {
 "id": 3172,
 "logo_path": "/kDedjRZwO8uyFhuHamomOhN6fzG.png",
 "name": "Blumhouse Productions",
 "origin_country": "US"
 },
 {
 "id": 12236,
 "logo_path": "/uV6QBPdn3MjQzAFdgEel6od7geg.png",
 "name": "Blinding Edge Pictures",
 "origin_country": "US"
 },
 {
 "id": 2,
 "logo_path": "/4MbjW4f9bu6LvlDmyIvfyuT3boj.png",
 "name": "Walt Disney Pictures",
 "origin_country": "US"
 },
 {
 "id": 5892,
 "logo_path": null,
 "name": "Buena Vista International",
 "origin_country": ""
 }
 ],
 "production_countries": [
 {
 "iso_3166_1": "US",
 "name": "United States of America"
 }
 ],
 "release_date": "2019-01-16",
 "revenue": 167285458,
 "runtime": 129,
 "spoken_languages": [
 {
 "iso_639_1": "en",
 "name": "English"
 }
 ],
 "status": "Released",
 "tagline": "You Cannot Contain What You Are",
 "title": "Glass",
 "video": false,
 "vote_average": 6.8,
 "vote_count": 1202
 */

struct MovieDetail: Codable {
    let title: String
    let duration: Int?
    let synopsis: String
    let genres: [MovieGenre]
    let spokenLanguagues: [MovieSpokenLanguage]
    let language: String
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case duration = "runtime"
        case synopsis = "overview"
        case genres
        case spokenLanguagues = "spoken_languages"
        case language = "original_language"
        case backdropPath = "backdrop_path"
    }
}
