import SwiftUI
import Combine
import Foundation

struct AsyncImage<Placeholder: View>: View {
	@ObservedObject private var loader: ImageLoader
	private let placeholder: Placeholder?

	init(url: URL, placeholder: Placeholder? = nil, cache: DataCache? = nil) {
		loader = ImageLoader(url: url, cache: cache)
		self.placeholder = placeholder
	}

	private var image: some View {
		Group {
			if let image = loader.image {
				Image(uiImage: image)
					.resizable()
					.aspectRatio(contentMode: .fit)
			} else {
				placeholder
			}
		}
	}

	var body: some View {
		image
			.onAppear(perform: loader.load)
			.onDisappear(perform: loader.cancel)
	}
}
