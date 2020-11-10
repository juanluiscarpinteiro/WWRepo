def nthSmallestNumber(number, arrayValues)
    arrayLocal =arrayValues
    arrayLocal = arrayLocal.sort
    # for debug and show porpuses uncomment the two lines below
    # puts "Array Info"
    # puts arrayLocal
    return arrayLocal[number-1]
end


    randomNumbers = Array.new(500) { rand(500) }
    puts "The nth smallest number out of 500 numbers is " 
    puts  nthSmallestNumber(5,randomNumbers)


 