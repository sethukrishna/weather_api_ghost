require 'rubygems'
require 'json'
class ReceipeManager
    include Enumerable
    attr_reader :receipeName, :cuisine, :ingredients, :steps
    def initialize(receipeName, cuisine, ingredients, steps)
        @receipeName = receipeName
        @cuisine = cuisine
        @ingredients = ingredients
        @steps = steps
    end
 
 
    def has_ingredient?
        puts "WELCOME TO HAS INGREDIENTS METHOD"
        puts "Enter the ingredient from the passed object reference:"
        checkIngredient = gets.chomp.to_s
        if ingredients.include?(checkIngredient)
            puts "Ingrident is available in the Receipe"
        else
            puts "The ingredient is not availatble in the recepie"
        end
    end
    
    def how_many_ingredients
        "WELCOME TO THE METHOD WHICH COUNTS THE NUMBER OF INGREDIENTS"
        ingredients = @ingredients.split(",")
        puts "Number of Ingredients:" , ingredients.count
    end
    
    def json_read
        puts "METHOD TO READ JSON DATA "
        f = File.new('/home/ubuntu/workspace/test/models/data.json')
        my_data = f.read
        my_recipes_data= JSON.parse(my_data)
        puts my_recipes_data.to_json    
   end
   
   def insert_recepie
       puts "WELCOME TO THE METHOD TO INSERT RECEPIES"
   
    receipAarray = []
    begin
   
    begin
     reciepe= {}
        puts "Enter Your Receipe"
        recepie = gets.chomp!
        if not recepie.empty?
        puts "Enter Cuisine"
        cuisinetype = gets.chomp!
        ingredients ={}
        
        begin
        puts "Enter Ingrident"
        ingredient = gets.chomp!
        if not ingredient.empty?
                
        puts "Enter quantity"
        quantity = gets.chomp!
        
        ingredients.store(ingredient, quantity)
        
        end 
        
        end until ingredient.empty?
        
         puts "Enter the steps to be followed"
        stepstodo = gets.chomp!
        reciepe.store("Recepie" ,recepie)
        reciepe.store("Cuisine" ,cuisinetype)
        reciepe.store("Ingredients and Quantity" ,ingredients)
        reciepe.store( "Steps",stepstodo)
        receipAarray.push(reciepe)
        else
          puts "no reciepe entered"
        end
        
        end until recepie.empty?
        
        puts reciepe.to_s
        puts reciepe["Recepie"]
        puts "do you want to enter another receipe?y/n"
        answer=gets.chomp!
        end until answer.casecmp "y" 
        puts receipAarray 
        return receipAarray
     
    end
    
    def deletereceipe
        puts " \n WELCOME TO THE METHOD TO DELETE THE RECEPIES"
        receipAarray =insert_recepie
        puts "enter Recepie to delete"
        del_Recipe = gets.chomp!
        receipAarray.reject! { |h| h["Recepie"] == del_Recipe }
        puts "Deleted Successfully"
        puts receipAarray
    end
    
    def self.displayReceipes
           
        puts " WELCOME TO METHOD WHICH RECEPIES BASED ON CUISINES "
        myJson = File.read('/home/ubuntu/workspace/test/models/data.json')
        jsonParse = JSON.parse(myJson)
        list = Array.new
        jsonParse['recepie_management'].each do |x|
        list.push(x["Cuisine"])
        end
        puts " \n The List of available cuisines are:"
        puts list.uniq           
        puts " \n Enter cuisine to display"
        disp_Recipe = gets.chomp!
        disp_Recipe = disp_Recipe.capitalize
        puts " \n The recepie's in the given cuisine are:"
        jsonParse['recepie_management'].each do  |r|
        if (r["Cuisine"].to_s.match(/#{disp_Recipe}/))
        puts r["Recepie"]
   
        end
      end
    end
    
    def self.has_many_ingredients
      puts "WELCOME TO THE METHOD WHICH ACCEPTS MULTIPLE INGREDIENTS"    
      myJson = File.read('/home/ubuntu/workspace/test/models/data.json')
    
      jsonParse = JSON.parse(myJson)
      puts "Enter one or more ingredients for which you want receipe(maximum no of ingredients is 3) seperated by commas"
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
          end
    
    
    obj1 = ReceipeManager.new('Briyani', 'Indian','{:chicken => 1,:rice => 2,:spices =>2,:blah =>3}','cook and eat')
    
    displayReceipes
    obj1.insert_recepie
    obj1.has_ingredient?
    obj1.json_read
    obj1.deletereceipe
    has_many_ingredients
    obj1.how_many_ingredients

    
    
    
end