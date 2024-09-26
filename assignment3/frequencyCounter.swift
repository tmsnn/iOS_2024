import Foundation

// Function to count the frequency of each word
func countWordFrequency(sentence: String) -> [String: Int] {
    var wordFrequency: [String: Int] = [:]
    
    // Convert sentence to lowercase and remove punctuation
    let lowercasedSentence = sentence.lowercased()
    let cleanedSentence = lowercasedSentence.components(separatedBy: CharacterSet.punctuationCharacters).joined()
    
    // Split the sentence into words
    let words = cleanedSentence.split(separator: " ")
    
    // Iterate through the words and count their occurrences
    for word in words {
        let wordStr = String(word)
        if wordFrequency[wordStr] != nil {
            wordFrequency[wordStr]! += 1
        } else {
            wordFrequency[wordStr] = 1
        }
    }
    
    return wordFrequency
}

// Prompt the user to enter a sentence
print("Enter a sentence: ", terminator: "")
if let sentence = readLine() {
    // Get the word frequency dictionary
    let frequency = countWordFrequency(sentence: sentence)
    
    // Display the words and their corresponding frequencies
    print("\nWord Frequencies:")
    for (word, count) in frequency {
        print("\(word): \(count)")
    }
}
