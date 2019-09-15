# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arrSum = 0
  arr.each{|a| arrSum += a}
  return arrSum
end

def max_2_sum arr
  if arr.empty? then
    return 0;
  end
  
  if arr.length == 1 then
    return arr[0]
  end
  
  # sort largest and smallest first two
  num1 = [arr[0], arr[1]].max
  num2 = [arr[0], arr[1]].min
  
  # start at 2 to skip these two
  index = 2
  
  # iter over the rest of the array
  while index < arr.length
    # if bigger than the biggest number, replace it and bump that number down to second biggest
    # elsif only bigger than the second biggest number, replace it
    if arr[index] >= num1 then
      num2 = num1
      num1 = arr[index]
    elsif arr[index] >= num2 then
      num2 = arr[index]
    end
    index += 1
  end
  
  return num1 + num2
end

def sum_to_n? arr, n
  
  if arr.empty? then
    return false
  end
  
  outIndex = 0
  inIndex = 0
  
  while outIndex < arr.length
    inIndex = outIndex + 1
    while inIndex < arr.length
      if arr[outIndex] + arr[inIndex] == n then
        return true
      end
      inIndex += 1
    end
    outIndex += 1
  end
  return false
end

# Part 2

def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  if(s.length == 0)
    return false
  end
  
  firstCharacter = s[0]
  
  if !/[[:alpha:]]/.match(firstCharacter)
    return false
  end
  
  case firstCharacter
  when "a", "A", "e", "E", "i", "I", "o", "O", "u", "U"
    return false
  end
  
  return true
end

def binary_multiple_of_4? s
  print s + "\n"
  
  # Not sure why 0 is included as a multiple of 4...?
  if s == "0"
    return true
  end
  
  if /^[0,1]*00$/.match(s) && /^.*1{1,}.*/.match(s)
    return true
  end
  
  return false
end

# Part 3

class BookInStock

def isbn
  @isbn
end

def isbn=(isbnString)
  @isbn = isbnString
end

def price
  @price
end

def price=(cost)
  @price = cost
end

def initialize(isbnString, cost)
  if cost < 0
    raise ArgumentError.new("Cannot Have Negative Cost")
  end
  if cost == 0
    raise ArgumentError.new("Cannot Have No Cost")
  end
  if isbnString == ""
    raise ArgumentError.new("ISBN Cannot be Undefined")
  end
  
  @price = cost
  @isbn = isbnString
end

def price_as_string 
  return "$%0.2f" % @price
end


end
