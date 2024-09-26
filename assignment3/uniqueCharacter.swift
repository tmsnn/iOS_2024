func uniqueChars(_ text: String) -> Bool {
    // set to store unique characters
    var characterSet = Set<Character>()
    
    for character in text {
        // if the character is already in the set, return false
        if characterSet.contains(character) {
            return false
        }
        // else add the character to the set
        characterSet.insert(character)
    }
    
    return true
}

print("Enter a string:")
if let input = readLine() {
    let result = uniqueChars(input)
    if result {
        print("true")
    } else {
        print("false")
    }
}