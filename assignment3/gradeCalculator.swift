import Foundation

// Function to process student scores
func processStudentScores(names: [String], scores: [Double]) {
    // Check if there are students
    guard !names.isEmpty, names.count == scores.count else {
        print("No student scores to process or names and scores do not match.")
        return
    }

    // Calculate average score
    let totalScore = scores.reduce(0, +)
    let averageScore = totalScore / Double(scores.count)

    // Determine highest and lowest scores
    let highestScore = scores.max() ?? 0
    let lowestScore = scores.min() ?? 0

    // Display results
    print("\nStudent Scores:\n")
    for index in 0..<names.count {
        let status = scores[index] >= averageScore ? "Above Average" : "Below Average"
        print("\(names[index]): \(scores[index]) - \(status)")
    }

    // Display average, highest, and lowest scores
    print("\nAverage Score: \(averageScore)")
    print("Highest Score: \(highestScore)")
    print("Lowest Score: \(lowestScore)")
}

// Main program
func main() {
    var names: [String] = []
    var scores: [Double] = []

    // Prompt user for the number of students
    print("Enter the number of students:")
    guard let input = readLine(), let numberOfStudents = Int(input), numberOfStudents > 0 else {
        print("Invalid number of students.")
        return
    }

    // Loop to accept names and scores
    for _ in 1...numberOfStudents {
        print("Enter the student's name:")
        guard let name = readLine(), !name.isEmpty else {
            print("Invalid name.")
            continue
        }

        print("Enter the student's score:")
        guard let scoreInput = readLine(), let score = Double(scoreInput) else {
            print("Invalid score. Please enter a numeric value.")
            continue
        }

        // Append the name and score to the respective arrays
        names.append(name)
        scores.append(score)
    }

    // Process the student scores
    processStudentScores(names: names, scores: scores)
}

// Run the main program
main()
