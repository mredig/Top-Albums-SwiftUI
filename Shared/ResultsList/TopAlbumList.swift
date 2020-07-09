//
//  ContentView.swift
//  Shared
//
//  Created by Michael Redig on 7/9/20.
//

import SwiftUI

struct TopAlbumList: View {

	let musicResults = sampleResults

	var body: some View {
		NavigationView {
			List {
				ForEach(musicResults, id: \.id) { result in
					let vm = MusicResultViewModel(musicResult: result)
					AlbumListItem(musicResultVM: vm)
				}
			}
			.navigationTitle("Top Albums")
		}

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopAlbumList()
    }
}
