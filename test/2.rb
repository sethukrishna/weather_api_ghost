def one 
    puts " First"
    puts "Enter a Number to Convert"
    number = gets.chomp!
    number = number.to_i
    puts "Given Number:" , number , "\n Binary Equalent" , number.to_s(2) , "\n Octal Equalent: " , number.to_s(8) , "Hexa-Decimal Equalent:" , number.to_s(16)
end

def two
    puts "Second"
    puts "Enter a Number"
    number1 = gets().chomp!
    number1 = number1.to_i
    puts "The given binary number is ", number1.to_s(2) ,"and its decimal equalent is", number1.to_s(10)
    
end
def three
    puts "Enter a string to check palindrome"
    string = gets.chomp!
    if string.reverse == string
        puts "The Given string is a palindrome"
    else
        puts "Not a palindrome"
    end

end

def four
    puts "enter a string to check for isogram"
    string1 = gets.chomp!
    array = string1.split("")
    if array.uniq == array
        puts "The given string is an isogram"
    else
        puts "The given string is not an isogram"
    end
end
    
def five
    puts "Enter the marks to be Graded"
    marks = gets.chomp!
    marks = marks.to_i
    case marks
      when 80..89
          puts "Your Grade is B"
      when 70..79
          puts "Your Grade is C"
      else
          puts "Your Grade is D"   
    end
end

def six
   puts "enter your gross salary"
   salary = gets.chomp!.to_f
   if salary <= 240
       puts "Tax free"
   else if salary >= 241 and salary <=480
       tax = salary*0.15
       puts "Tax:", tax
   else 
       puts "tax:" , salary*0.28
    end
    end
end

def seven
    puts "Enter M Number"
    mnumber = gets.chomp!.to_s
    regExpression = /^[M,m]\d{8}$/
    if regExpression =~ mnumber then
      puts "Valid Mnumber.!!"
    else
      puts "Invalid Mnumber"
    end
end

def eight 
    puts "Please Enter your Social Security Number"
    ssn = gets().chomp!
    s1 = ssn.to_s
    r1 = /^(\d{3}-\d{2}-\d{4})/
    if s1 =~ r1 then puts "Entered Social Security Number: #{} is Valid"
    else puts "Entered Social Security Number #{ssn} is invalid, Try Again"
    end
end


def nine
puts "Please Enter Your E-mail Address:- "
mail = gets.chomp!
s1 = mail.to_s
r1 = /\w+@[gmailyahoohotmailmsn]+\.[com,in,co.in,edu,net]/
if r1 =~ s1 then puts "Valid E-mail #{s1}"
else puts "Invalid EMAIL! try again."
end 
end

def ten
puts "Enter the String to cipher"
s1 = gets.chomp!.to_s
m = s1.split(//)
n = m.map{|x| (x.ord+3).chr}
puts "The Ciphered String is #{n.join}"

end


   
def twelve
  puts "please Input a number  "
  n = gets
  n = n.to_i
  

  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "#{n} is prime!"
  else
    puts "#{n} is not prime."
  end
end
   



def thirteen
    @dievalues={'2'=>0,'3'=>0,'4'=>0,'5'=>0,'6'=>0,'7'=>0,'8'=>0,'9'=>0,'10'=>0,
              '11'=>0,'12'=>0            
           }
 i=1
 
 for i in 1..100
  diceroll1=rand(1..6)
  diceroll2=rand(1..6)
  sum=diceroll1+diceroll2
  puts"[#{diceroll1},#{diceroll2}]=#{sum}"
  
  turn=sum.to_s
    
     @dievalues[turn] += 1
    
end
puts "Two Dice that are Rolled For 100 times and Their Resulted occurances Are"

for j in 2..@dievalues.length+1
  holdval=@dievalues[j.to_s]
  puts "#{j.to_s} Occured #{holdval} Times"
end
end

def eleven
    puts "Enter the Bill Amount"
    bill = gets.chomp!.to_f
    puts "Enter the Tender Amount"
    tender = gets.chomp!.to_f
    
    if tender >= bill
        change = tender - bill
        change = change.to_f
        else if change >= 50
            fifty = change / 50
            fifty = fifty.to_i
            change = change % 50
            puts change
            else if change >= 20
                twenty = change / 20
                twenty = twenty.to_i
                change = change % 20
                puts change
            else if change >= 10
                ten = change / 10
                ten = ten.to_i
                change = change % 10
            puts change
        end
    end
        end
end

end
def labs
        puts Time.now
        
   
    
end 
labs
