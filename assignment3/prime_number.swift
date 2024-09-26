// Функция для проверки, является ли число простым
func isPrime(_ number: Int) -> Bool {
    // Если число меньше 2, оно не простое
    if number < 2 {
        return false
    }

    // Проверяем все числа от 2 до (number - 1)
    for i in 2..<number {
        if number % i == 0 {
            return false // Если делится без остатка, число не простое
        }
    }
    
    return true // Если делителей нет, число простое
}

// Основная программа для вывода всех простых чисел от 1 до 100
for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}
