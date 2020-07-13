//
//  ContentView.swift
//  Shared
//
//  Created by Michael Redig on 7/9/20.
//

import SwiftUI

struct TopAlbumList: View {

	let musicResults: [MusicResult]

	var body: some View {
		NavigationView {
			List(musicResults.map { MusicResultViewModel(musicResult: $0) } ) { vm in
				AlbumListItem(musicResultVM: vm)
			}
			.navigationTitle("Top Albums")
		}

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopAlbumList(musicResults: sampleResults)
    }
}
