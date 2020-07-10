import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
	@Published var image: UIImage?
	private let url: URL
	private var cancellable: URLSessionDataTask?
	private var cache: DataCache?
	private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

	// TODO: Maybe put in queue?
	private(set) var isLoading: Bool = false

	init(url: URL, cache: DataCache? = nil) {
		self.url = url
		self.cache = cache
	}

	deinit {
		cancellable?.cancel()
		print("deinited \(url)")
	}

	func load() {
		guard !isLoading else { return }

		if let imageData = cache?[url], let image = UIImage(data: imageData) {
			self.image = image
			return
		}

//		cancellable = URLSession.shared.dataTaskPublisher(for: url)
////			.subscribe(on: Self.imageProcessingQueue)
//			.handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
//						  receiveOutput: { [weak self] in
//							self?.cache($0.data)
//							self?.setImage(from: $0.data)
//						  },
//						  receiveCompletion: { [weak self] _ in self?.onFinish() },
//						  receiveCancel: { [weak self] in self?.onFinish() })
////			.map { UIImage(data: $0.data) }
////			.replaceError(with: nil)
////			.receive(on: DispatchQueue.main)
////			.assign(to: \.image, on: self)

		onStart()
		cancellable = URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				print("error loading image: \(error)")
				return
			}
			guard let data = data else { return }
			self.cache(data)
			self.setImage(from: data)
			self.onFinish()
		}
		cancellable?.resume()

	}

	private func onStart() {
		isLoading = true
	}

	private func onFinish() {
		isLoading = false
	}

	func cancel() {
		cancellable?.cancel()
	}

	private func cache(_ data: Data?) {
		guard let data = data else { return }
		cache?[url] = data
	}

	private func setImage(from data: Data) {
		DispatchQueue.main.async {
			self.image = UIImage(data: data)
		}
	}
}
