import UIKit
import SwiftUI

protocol DataCache {
	subscript(_ url: URL) -> Data? { get set }
}


struct TempDataCache: DataCache {
	private let cache = NSCache<NSURL, NSData>()

	subscript(_ key: URL) -> Data? {
		get {
			cache.object(forKey: key as NSURL) as Data?
		}
		set {
			guard let newValue = newValue else {
				cache.removeObject(forKey: key as NSURL)
				return
			}
			cache.setObject(newValue as NSData, forKey: key as NSURL)
		}
	}
}

struct DataCacheKey: EnvironmentKey {
	static let defaultValue: DataCache = TempDataCache()
}

extension EnvironmentValues {
	var dataCache: DataCache {
		get { self[DataCacheKey.self] }
		set { self[DataCacheKey.self] = newValue }
	}
}
