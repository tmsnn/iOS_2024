func fibonacci(_ n: Int) -> [Int] {
    // Return an empty array if n is less than or equal to zero
    if n <= 0 {
        return []
    }
    
    // Array to store the Fibonacci sequence
    var sequence = [Int]()
    
    // Add the first Fibonacci number
    if n >= 1 {
        sequence.append(0)
    }
    
    // Add the second Fibonacci number if n is greater than 1
    if n >= 2 {
        sequence.append(1)
    }
    
    // Loop to calculate and append the rest of the Fibonacci numbers
    for i in 2..<n {
        let nextFib = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextFib)
    }
    
    return sequence
}
