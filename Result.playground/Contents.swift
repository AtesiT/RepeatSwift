import Foundation

//  Result (возвращает либо success, либо failure)
//  Это универсальный тип, потому что построен на дженериках.

enum NetworkError: Error {
    case badURL
}

let netError = NetworkError.badURL

//  Функция, которая читает количество непрочитанных сообщениях (будто бы)
func fetchUnreadCount(from urlString: String, completionHandler: @escaping (Result<Int, Error>) -> Void ) {
    //  В качестве второго параметра мы передаем убегающее замыкание в нашей функции
    guard let url = URL(string: urlString) else {
        //  Мы можем передать любую ошибку в failure, если подписаны под протокол Error
        completionHandler(.failure(netError))
        return
    }
    
    // Здесь должен был бы быть сетевой слой
    
    print("Fetching \(url.absoluteString)..")
    completionHandler(.success(5))
}

//  MARK: - FIRST ATTEMPT OF CALL

//  Вызов функции
fetchUnreadCount(from: "https://jsonplaceholder.typicode.com/posts") { result in
    //  Перебираем из двух вариантов - один из, после чего используем его.
    switch result {
    case .success(let count):
        print("Count unnread \(count) messages")
    case .failure(let error):
        print(error.localizedDescription)
    }
}

//  MARK: - SECOND ATTEMPT OF CALL

fetchUnreadCount(from: "https://jsonplaceholder.typicode.com/posts") { result in
    //  Метод get может сработать, а может вернуть ошибку.
    if let count = try? result.get() {
        print("\(count) unread messages")
    }
}

//  MARK: - THIRD ATTEMPT OF CALL

let file = ""
let result = Result {
    try String(contentsOfFile: file)
}
//  Не задали путь к файлу и выведется ошибка
print(result)
