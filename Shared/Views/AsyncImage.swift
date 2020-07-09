import SwiftUI
import Combine
import Foundation

struct AsyncImage<Placeholder: View>: View {
	@ObservedObject private var loader: ImageLoader
	private let placeholder: Placeholder?

	init(url: URL, placeholder: Placeholder? = nil) {
		loader = ImageLoader(url: url)
		self.placeholder = placeholder
	}

	private var image: some View {
		Group {
			if let image = loader.image {
				Image(uiImage: image).resizable()
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
