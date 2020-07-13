//
//  AlbumListItem.swift
//  Top Albums SwiftUI
//
//  Created by Michael Redig on 7/9/20.
//

import SwiftUI

struct AlbumListItem: View {

	let musicResultVM: MusicResultViewModel

	@Environment(\.dataCache) var cache: DataCache

	var body: some View {
		HStack(content: {
			AsyncImage(url: musicResultVM.normalArtworkURL,
					   placeholder: Image(systemName: "photo"),
					   cache: cache)
				.frame(width: 60.0, height: 60.0)
				.cornerRadius(8)
			VStack(alignment: .leading, content: {
				Text(musicResultVM.name)
					.font(.headline)
					.multilineTextAlignment(.leading)
				Text(musicResultVM.artistName)
					.font(.caption)
					.multilineTextAlignment(.leading)
			})
		})
		.frame(maxHeight: 64)
	}
}


struct AlbumListItem_Previews: PreviewProvider {
	static var previews: some View {
		TopAlbumList(musicResults: sampleResults)
	}
}
