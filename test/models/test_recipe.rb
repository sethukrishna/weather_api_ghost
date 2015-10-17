require 'rubygems'
require 'json'
class ReceipesList
    include Enumerable
    attr_reader :receipeName, :cuisine, :ingredients, :steps
       def initialize(receipeName, cuisine, ingredients, steps)
        @receipeName = receipeName
        @cuisine = cuisine
        @ingredients = ingredients
        @steps = steps
    end
    
    
    def how_many_ingredients
        ingredients = @ingredients.split(",")
        puts "Number of Ingredients:" , ingredients.count
    end
    
    def has_ingredient?
        puts "Enter the ingredient:"
        checkIngredient = gets.chomp.to_s
        puts ingredients.include?(checkIngredient)
    end
    
    def self.has_ingredients1
    
      myJson = File.read('/home/ubuntu/workspace/test/models/data.json')
    
      jsonParse = JSON.parse(myJson)
      puts "Enter one or more ingredients for which you want receipe(maximum no of ingredients is 3)"
      checkIngredient = gets().chomp.to_s
      content=[]
      content=checkIngredient.split(',')
         
      jsonParse['recepie_management'].each do  |k|
             h= {}
             h.merge! (k["Ingredients and Quantity"].to_hash)
             entries=content.length
             #while entries!='exit'
             case entries
              when 1
                if h.include?(content[0]) 
                      puts k["Recepie"]          
                end      
              when 2
                if h.include?(content[0]) && h.include?(content[1])
                      puts k["Recepie"] 
                end 
              when 3  
                if h.include?(content[0]) && h.include?(content[1]) && h.include?(content[2])
                    puts k["Recepie"] 
               end
              end
     end
        #puts jsonParse['name']
        #json.has_ingredients1(checkIngredient)
    end
    
    
    def self.displayReceipes
           
        
        myJson = File.read('/home/ubuntu/workspace/test/models/data.json')
        jsonParse = JSON.parse(myJson)
        list = Array.new
        jsonParse['recepie_management'].each do |x|
        list.push(x["Cuisine"])
        end
        puts "The List of available cuisines are:"
        puts list.uniq           
        puts "enter cuisine to display"
        disp_Recipe = gets.chomp!
        disp_Recipe = disp_Recipe.capitalize
        jsonParse['recepie_management'].each do  |r|
        if (r["Cuisine"].to_s.match(/#{disp_Recipe}/))
        puts r["Recepie"]
   
        end
      end
    end
    
    
    def getJsonData
      myJson = File.read('/home/ubuntu/workspace/test/models/data.json')
      jsonParse = JSON.parse(myJson)
      puts jsonParse.class
      jsonParse.each {|item|
      puts  jsonParse.name
   }
   
   end 
     class ReceipeEnum
     include Enumerable
      
     
   
   end
   has_ingredients1
#   obj1 = ReceipesList.new('Briyani', 'Indian','{:chicken => 1,:rice => 2,:spices =>3}','cook and eat')
   
#   obj1.displayReceipes
   
   
end
