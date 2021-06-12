# Filter function
def filter(arr)
    unless arr.is_a? Array
        raise ArgumentError.new("Argument Must Be an Array")
    end

    result = []
    
    for element in arr
        if yield(element) == true
            result << element
        end
    end
    p result
end

# Test Cases
# test_array = [1,2,3,4,5,6]
# even = ->(n) { n % 2 == 0 }
# odd = proc { |n| n % 2 != 0}

# # Tests
# filter(test_array, &even) # prints [2, 4, 6]
# filter(test_array, &odd) # prints [1, 3, 5]
# filter(test_array) { |n| n > 4 } # prints [5, 6]

