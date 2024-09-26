import Foundation

// func for checking for palindrome string

func isPalindrome(text: String) -> Bool{
    var cleanText = ""

    for char in text.lowercased() {
        if char.isLetter{
            cleanText.append(char)
        }
    }
    
    return cleanText == String(cleanText.reversed())
}

print("String to check:")

if let input = readLine(){
    if isPalindrome(text: input){
        print ("true")
    } else {
        print("false")
    }
}