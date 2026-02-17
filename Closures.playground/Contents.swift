import Foundation


//  MARK: - 1 STEP

//  В этой функции completion ничего не принимает и ничего не возвращает
func wordPecker(phrase: String, completion: () -> ()) {
    
    for letter in phrase {
        print(letter)
    }
    
    completion()
}

//  Completion необходим потому что, сам метод (completion) может находится, к примеру, во фреймворке или в той части кода, которую мы не имеем права изменять.
//  А обращаемся мы к нему из разных частей кода, меняя только параметр и заключительные блоки
wordPecker(phrase: "Word Pecker") {
    print("Finish")
    
}

//  MARK: - 2 STEP

func wordPeckerSplit(phrase: String, wordCompletion: () -> ()) {
    let words = phrase.split(separator: " ")
    
    for word in words {
        
        for letter in word {
            print(letter)
        }
        wordCompletion()
    }
}

wordPeckerSplit(phrase: "Word Pecker") {
    print("Split")
}

//  MARK: - 3 STEP


func wordPeckerSplitString(phrase: String, wordCompletion: (String) -> ()) {
    let words = phrase.split(separator: " ")
    
    for word in words {
        
        //  word имеет String SubSequence, поэтому внизу приводим его к String
        for letter in word {
            print(letter)
        }
        wordCompletion(String(word))
    }
}

//  В параметр wordCompletion мы вписываем аргумент типа String (имя, которое мы будем использовать внутри блока)
wordPeckerSplitString(phrase: "Word Pecker") { someWord in
    print("--> \(someWord.uppercased()) completed")
}

//  MARK: - 4 STEP


//  После того, как наш блок отработает, только после этого ARC может удалять ссылку из памяти.
func wordPeckerSplitStringDisptchQ(phrase: String, wordCompletion: @escaping (String) -> ()) {
    let words = phrase.split(separator: " ")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        wordCompletion("Finish")
    }
    
    for word in words {
        
        for letter in word {
            print(letter)
        }
        wordCompletion(String(word))
    }
    
}

wordPeckerSplitStringDisptchQ(phrase: "Word Pecker") { someWord in
    print("--> \(someWord.uppercased()) completed")
}
//  Finish получим лишь в конце. 
