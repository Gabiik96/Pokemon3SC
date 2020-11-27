//
//  ImageLoader.swift
//  PokemonTest
//
//  Created by Gabriel Balta on 27/11/2020.
//

import SwiftUI

//private let _imageCache = NSCache<AnyObject, AnyObject>()
//
//class ImageLoader: ObservableObject {
//
//    @Published var image: UIImage?
//    @Published var isLoading = false
//
//    var imageCache = _imageCache
//
//    func loadImage(with url: URL) {
//        let urlString = url.absoluteString
//        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
//            self.image = imageFromCache
//            return
//        }
//
//        DispatchQueue.global(qos: .background).async { [weak self] in
//            guard let self = self else { return }
//            do {
//                let data = try Data(contentsOf: url)
//                guard let image = UIImage(data: data) else {
//                    return
//                }
//                self.imageCache.setObject(image, forKey: urlString as AnyObject)
//                DispatchQueue.main.async { [weak self] in
//                    self?.image = image
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()

    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }

    func loadImage() {
        if loadImageFromCache() {
            print("Cache hit")
            return
        }

        print("Cache miss, loading from url")
        loadImageFromUrl()
    }

    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }

        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }

        image = cacheImage
        return true
    }

    func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }

        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }


    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }

        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }

            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.image = loadedImage
        }
    }
}
