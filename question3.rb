def nthSmallestNumber(number, arrayValues)
    arrayLocal =arrayValues
    arrayLocal = arrayLocal.sort
    puts "Array Info"
    puts arrayLocal
    return arrayLocal[number-1]
end


    randomNumbers = Array.new(500) { rand(500) }
    puts "The nth smallest number is " 
    puts nthSmallestNumber(5,randomNumbers)


 