import Foundation

//  Result (возвращает либо success, либо failure)
//  Это универсальный тип, потому что построен на дженериках.

enum NetworkError: Error {
    case badURL
}

//  Функция, которая читает количество непрочитанных сообщениях (будто бы)
func fetchUnreadCount(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void ) {
    //  В качестве второго параметра мы передаем убегающее замыкание в нашей функции
    guard let url = URL(string: urlString) else {
        completionHandler(.failure(.badURL))
        return
    }
    
    // Здесь должен был бы быть сетевой слой
    
    print("Fetching \(url.absoluteString)..")
    completionHandler(.success(5))
}


//  Вызов функции
fetchUnreadCount(from: "https://jsonplaceholder.typicode.com/posts") { result in
    //  Перебираем из двух вариантов - один из, после чего используем его.
    switch result {
    case .success(let count):
        print("Count unnreaded \(count) messages")
    case .failure(let error):
        print(error.localizedDescription)
    }
}
