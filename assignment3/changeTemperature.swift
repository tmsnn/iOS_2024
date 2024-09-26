import Foundation

// Function to convert Celsius to Fahrenheit and Kelvin
func convertFromCelsius(_ celsius: Double) {
    let fahrenheit = (celsius * 9 / 5) + 32
    let kelvin = celsius + 273.15
    print("\(celsius)°C is \(fahrenheit)°F and \(kelvin) K.")
}

// Function to convert Fahrenheit to Celsius and Kelvin
func convertFromFahrenheit(_ fahrenheit: Double) {
    let celsius = (fahrenheit - 32) * 5 / 9
    let kelvin = (fahrenheit - 32) * 5 / 9 + 273.15
    print("\(fahrenheit)°F is \(celsius)°C and \(kelvin) K.")
}

// Function to convert Kelvin to Celsius and Fahrenheit
func convertFromKelvin(_ kelvin: Double) {
    let celsius = kelvin - 273.15
    let fahrenheit = (kelvin - 273.15) * 9 / 5 + 32
    print("\(kelvin) K is \(celsius)°C and \(fahrenheit)°F.")
}

// Main function to get user input and perform conversions
func main() {
    // Prompt user to enter temperature value
    print("Enter the temperature value:")
    if let input = readLine(), let temperature = Double(input) {
        
        // Prompt user to enter the temperature unit (C, F, or K)
        print("Enter the unit of the temperature (C for Celsius, F for Fahrenheit, K for Kelvin):")
        if let unit = readLine()?.uppercased() {
            
            switch unit {
            case "C":
                convertFromCelsius(temperature)
            case "F":
                convertFromFahrenheit(temperature)
            case "K":
                convertFromKelvin(temperature)
            default:
                print("Invalid unit. Please enter C, F, or K.")
            }
            
        } else {
            print("Invalid input. Please enter a valid unit.")
        }
        
    } else {
        print("Invalid input. Please enter a valid temperature.")
    }
}

// Call the main function to run the program
main()
