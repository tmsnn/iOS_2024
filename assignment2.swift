// easy 
print("Easy tasks:")
let fruits = ["Apple", "Banana", "Cherry", "Melon", "Pearl"]
print(fruits[2])  

var favoriteNumbers: Set = [1, 2, 3]
favoriteNumbers.insert(8)
print(favoriteNumbers) 

let programmingLanguages = ["Swift": 2014, "Python": 1991, "JavaScript": 1995]
let swiftReleaseYear = programmingLanguages["Swift"]!
print(swiftReleaseYear)  

var colors = ["Red", "Black", "Blue", "Yellow"]
colors[1] = "White"
print(colors)

// medium 
print("Medium tasks:")
let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]

let intersection = set1.intersection(set2)
print(intersection)

var studentScores = ["Aru": 99, "Tomi": 100, "Dilya": 100]
studentScores["Aru"] = 100
print(studentScores)  

let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]
let mergedArray = array1 + array2
print(mergedArray)  

//hard
print("Hard tasks:")
var countryPopulations = ["USA": 331000000, "India": 1380000000]
countryPopulations["Brazil"] = 213000000
print(countryPopulations)  

let animals1: Set = ["cat", "dog"]
let animals2: Set = ["dog", "mouse"]
let unionSet = animals1.union(animals2)
let finalSet = unionSet.subtracting(animals2)
print(finalSet)  

let studentGrades = ["Alice": [88, 92, 95], "Bob": [75, 85, 80]]
let bobGrades = studentGrades["Bob"]! 
print(bobGrades[1])