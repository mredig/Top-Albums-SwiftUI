//
//  AlbumListItem.swift
//  Top Albums SwiftUI
//
//  Created by Michael Redig on 7/9/20.
//

import SwiftUI

struct AlbumListItem: View {

	let musicResultVM: MusicResultViewModel

	var body: some View {
		HStack(content: {
			Image(systemName: "music.note")
				.frame(width: 60.0, height: 60.0)
			VStack(alignment: .leading, content: {
				Text(musicResultVM.name)
					.font(.headline)
					.multilineTextAlignment(.leading)
				Text(musicResultVM.artistName)
					.font(.caption)
					.multilineTextAlignment(.leading)
			})
		})
	}
}


struct AlbumListItem_Previews: PreviewProvider {
	static var previews: some View {
		TopAlbumList()
	}
}
