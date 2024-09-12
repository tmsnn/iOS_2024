let firstName: String = "Tomiris"
let lastName: String = "Nyshanbek"
let birthYear: Int = 2003
let currentYear: Int = 2024
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.76

let country: String = "KZ"
let favoriteFood: String = "manty"

var hobby: String = "cooking"
var numberOfHobbies: Int = 2
var favoriteNumber: Int = 6
var isHobbyCreative: Bool = true

var favoriteSport: String = "football"
var hasPets: Bool = true
let lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). 
I am currently a fourth year student. My hobby is \(hobby). 
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). 
I live in \(country) and I love \(favoriteFood). My favorite sport is \(favoriteSport). I am Barcelona fan and fan of our national team and Kairat. 
"""

print(lifeStory)
print("\n")

var futureGoals: String = "In the future, I want to become a professional product manager. 🚀 I love programming and the 
IT field in general. But I can't write good code and I wouldn't like 
to work in another field either. That's why I want to become a project manager."

let lifeStoryWithGoals: String = lifeStory + "\n" + futureGoals

print(lifeStoryWithGoals)