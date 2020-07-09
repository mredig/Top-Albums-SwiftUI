import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
	@Published var image: UIImage?
	private let url: URL
	private var cancellable: AnyCancellable?

	init(url: URL) {
		self.url = url
	}

	deinit {
		cancellable?.cancel()
	}

	func load() {
		
	}

	func cancel() {
		
	}
}
