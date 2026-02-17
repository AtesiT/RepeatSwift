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

