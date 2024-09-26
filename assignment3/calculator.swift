import Foundation

// Function for addition
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

// Function for subtraction
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

// Function for multiplication
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

// Function for division
func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil // Return nil for division by zero
    } else {
        return a / b
    }
}

// Main calculator function
func calculator() {
    var continueCalculating = true
    
    while continueCalculating {
        // Prompt the user for two numbers
        print("Enter the first number:")
        guard let input1 = readLine(), let number1 = Double(input1) else {
            print("Invalid input. Please enter a valid number.")
            continue
        }
        
        print("Enter the second number:")
        guard let input2 = readLine(), let number2 = Double(input2) else {
            print("Invalid input. Please enter a valid number.")
            continue
        }
        
        // Prompt the user for an operation
        print("Choose an operation (+, -, *, /):")
        guard let operation = readLine() else {
            print("Invalid operation.")
            continue
        }
        
        // Perform the calculation
        var result: Double?
        switch operation {
        case "+":
            result = add(number1, number2)
        case "-":
            result = subtract(number1, number2)
        case "*":
            result = multiply(number1, number2)
        case "/":
            result = divide(number1, number2)
            if result == nil {
                print("Error: Division by zero is not allowed.")
                continue
            }
        default:
            print("Invalid operation. Please choose +, -, *, or /.")
            continue
        }
        
        // Display the result
        if let result = result {
            print("The result is: \(result)")
        }
        
        // Ask the user if they want to continue
        print("Do you want to perform another calculation? (yes/no)")
        if let response = readLine(), response.lowercased() != "yes" {
            continueCalculating = false
        }
    }
    
    print("Thank you for using the calculator!")
}

// Run the calculator program
calculator()
