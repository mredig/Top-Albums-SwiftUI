//
//  MusicResult.swift
//  Top Albums
//
//  Created by Michael Redig on 5/6/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

import Foundation

struct Genre: Decodable, Equatable {
	let name: String
}

struct MusicResults: Decodable {
	let results: [MusicResult]
}

struct MusicResult: Decodable {
	let artistName: String?
	let id: String
	let releaseDate: String?
	let name: String
	let kind: String
	let copyright: String?
	let artistId: String?
	let artistUrl: URL?
	let artworkUrl100: URL
	let genres: [Genre]
	let url: URL
}



let sampleData = ##"""
{"feed":{"title":"Top Albums","id":"https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/non-explicit.json","author":{"name":"iTunes Store","uri":"http://wwww.apple.com/us/itunes/"},"links":[{"self":"https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/non-explicit.json"},{"alternate":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=34\u0026popId=82\u0026app=music"}],"copyright":"Copyright © 2018 Apple Inc. All rights reserved.","country":"us","icon":"http://itunes.apple.com/favicon.ico","updated":"2020-05-09T01:55:54.000-07:00","results":[{"artistName":"Lil Tjay","id":"1511995770","releaseDate":"2020-05-08","name":"State of Emergency","kind":"album","copyright":"℗ 2020 Columbia Records, a Division of Sony Music Entertainment","artistId":"1436446949","artistUrl":"https://music.apple.com/us/artist/lil-tjay/1436446949?app=music","artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/e8/cb/4a/e8cb4a95-7b2b-d490-0ff6-519e77129381/886448462880.jpg/200x200bb.png","genres":[{"genreId":"18","name":"Hip-Hop/Rap","url":"https://itunes.apple.com/us/genre/id18"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"}],"url":"https://music.apple.com/us/album/state-of-emergency/1511995770?app=music"},{"artistName":"Luke Combs","id":"1510448676","releaseDate":"2019-11-08","name":"What You See Is What You Get","kind":"album","copyright":"℗ 2019 River House Artists LLC, under exclusive license to Sony Music Entertainment. All rights reserved.","artistId":"815635315","artistUrl":"https://music.apple.com/us/artist/luke-combs/815635315?app=music","artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Music113/v4/31/3e/a4/313ea431-d0c2-1321-d411-638a3e25e421/886448390374.jpg/200x200bb.png","genres":[{"genreId":"6","name":"Country","url":"https://itunes.apple.com/us/genre/id6"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"}],"url":"https://music.apple.com/us/album/what-you-see-is-what-you-get/1510448676?app=music"},{"artistName":"Harry Styles","id":"1485802965","releaseDate":"2019-12-13","name":"Fine Line","kind":"album","copyright":"℗ 2019 Erskine Records Limited, under exclusive license to Columbia Records, a Division of Sony Music Entertainment","artistId":"471260289","artistUrl":"https://music.apple.com/us/artist/harry-styles/471260289?app=music","artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Music113/v4/72/89/85/728985d1-9484-7b71-1ea8-0f0654f7dc16/886448022213.jpg/200x200bb.png","genres":[{"genreId":"14","name":"Pop","url":"https://itunes.apple.com/us/genre/id14"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"}],"url":"https://music.apple.com/us/album/fine-line/1485802965?app=music"},{"artistName":"Justin Bieber","id":"1496639180","releaseDate":"2020-02-14","name":"Changes","kind":"album","copyright":"℗ 2020 Def Jam Recordings, a division of UMG Recordings, Inc.","artistId":"320569549","artistUrl":"https://music.apple.com/us/artist/justin-bieber/320569549?app=music","artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/49/c1/04/49c10497-421b-5480-0e88-2b1b9c7b038c/20UMGIM03126.rgb.jpg/200x200bb.png","genres":[{"genreId":"14","name":"Pop","url":"https://itunes.apple.com/us/genre/id14"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"}],"url":"https://music.apple.com/us/album/changes/1496639180?app=music"},{"artistName":"Morgan Wallen","id":"1440111976","releaseDate":"2018-04-27","name":"If I Know Me","kind":"album","copyright":"℗ 2018 Big Loud Records","artistId":"829142092","artistUrl":"https://music.apple.com/us/artist/morgan-wallen/829142092?app=music","artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/be/9d/e6/be9de62d-d780-de18-f355-da4029f4829c/842812106569_01_img001.jpg/200x200bb.png","genres":[{"genreId":"6","name":"Country","url":"https://itunes.apple.com/us/genre/id6"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"},{"genreId":"1039","name":"Honky Tonk","url":"https://itunes.apple.com/us/genre/id1039"},{"genreId":"14","name":"Pop","url":"https://itunes.apple.com/us/genre/id14"},{"genreId":"1133","name":"Pop/Rock","url":"https://itunes.apple.com/us/genre/id1133"},{"genreId":"1037","name":"Contemporary Country","url":"https://itunes.apple.com/us/genre/id1037"},{"genreId":"21","name":"Rock","url":"https://itunes.apple.com/us/genre/id21"},{"genreId":"1161","name":"Southern Rock","url":"https://itunes.apple.com/us/genre/id1161"}],"url":"https://music.apple.com/us/album/if-i-know-me/1440111976?app=music"},{"artistName":"J Balvin","id":"1500490683","releaseDate":"2020-03-19","name":"Colores","kind":"album","copyright":"Universal Music Latino; ℗ 2020 UMG Recordings, Inc.","artistId":"444520760","artistUrl":"https://music.apple.com/us/artist/j-balvin/444520760?app=music","artworkUrl100":"https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/0f/16/dc/0f16dc27-a647-01ca-ff46-2da95e65c1b8/20UMGIM10542.rgb.jpg/200x200bb.png","genres":[{"genreId":"1119","name":"Urbano latino","url":"https://itunes.apple.com/us/genre/id1119"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"},{"genreId":"12","name":"Latino","url":"https://itunes.apple.com/us/genre/id12"}],"url":"https://music.apple.com/us/album/colores/1500490683?app=music"},{"artistName":"Sam Hunt","id":"1497390717","releaseDate":"2020-04-03","name":"SOUTHSIDE","kind":"album","copyright":"An MCA Nashville Release; ℗ 2020 UMG Recordings, Inc.","artistId":"214150835","artistUrl":"https://music.apple.com/us/artist/sam-hunt/214150835?app=music","artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/70/78/ee/7078ee4b-1bee-9691-b037-bc9e83316f65/20UMGIM07555.rgb.jpg/200x200bb.png","genres":[{"genreId":"6","name":"Country","url":"https://itunes.apple.com/us/genre/id6"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"}],"url":"https://music.apple.com/us/album/southside/1497390717?app=music"},{"artistName":"Various Artists","id":"1487738280","releaseDate":"2019-11-15","name":"Frozen 2 (Original Motion Picture Soundtrack / Deluxe Edition)","kind":"album","copyright":"℗ 2019 Walt Disney Records","artistId":"36270","artistUrl":"https://music.apple.com/us/artist/various-artists/36270?app=music","artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music113/v4/5d/ea/6d/5dea6db2-aa20-7775-0309-7a6a8fe0be88/19UM1IM00155.rgb.jpg/200x200bb.png","genres":[{"genreId":"16","name":"Soundtrack","url":"https://itunes.apple.com/us/genre/id16"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"}],"url":"https://music.apple.com/us/album/frozen-2-original-motion-picture-soundtrack-deluxe/1487738280?app=music"},{"artistName":"Arsenal Efectivo","id":"1511880433","releaseDate":"2020-05-08","name":"Seguiremos Trabajando","kind":"album","copyright":"℗ 2020 Rancho Humilde","artistId":"1040781604","artistUrl":"https://music.apple.com/us/artist/arsenal-efectivo/1040781604?app=music","artworkUrl100":"https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/78/26/6a/78266a73-71c9-48d4-e760-3c431c4532d4/050742384913_cover.jpg/200x200bb.png","genres":[{"genreId":"1123","name":"Música Mexicana","url":"https://itunes.apple.com/us/genre/id1123"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"},{"genreId":"12","name":"Latino","url":"https://itunes.apple.com/us/genre/id12"}],"url":"https://music.apple.com/us/album/seguiremos-trabajando/1511880433?app=music"},{"artistName":"Einstein Baby Lullaby Academy","id":"1065946325","releaseDate":"2015-11-24","name":"Baby Lullaby: Relaxing Piano Lullabies and Natural Sleep Aid for Baby Sleep Music","kind":"album","copyright":"℗ 2015 Einstein Baby Lullaby Academy","artistId":"996163524","artistUrl":"https://music.apple.com/us/artist/einstein-baby-lullaby-academy/996163524?app=music","artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Music69/v4/40/7a/a4/407aa4cb-5c81-3adf-e801-64cfe6457d3b/859714545211_cover.jpg/200x200bb.png","genres":[{"genreId":"4","name":"Children's Music","url":"https://itunes.apple.com/us/genre/id4"},{"genreId":"34","name":"Music","url":"https://itunes.apple.com/us/genre/id34"},{"genreId":"53","name":"Instrumental","url":"https://itunes.apple.com/us/genre/id53"}],"url":"https://music.apple.com/us/album/baby-lullaby-relaxing-piano-lullabies-natural-sleep/1065946325?app=music"}]}}
"""##.data(using: .utf8)!

let sampleResults = try! JSONDecoder().decode([String: MusicResults].self, from: sampleData)["feed"]!.results