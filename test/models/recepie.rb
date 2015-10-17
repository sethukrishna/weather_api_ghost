require 'rubygems'
require 'json'
require 'pp'
class Receipe
   
    include Enumerable
    attr_reader :name, :cuisine, :ingredients_hash, :steps
   
    def initialize(name, cuisine, ingredients_hash, steps)
        @name = name
        @cuisine = cuisine
        @ingredients_hash = ingredients_hash
        @steps = steps
    end
    
    
    def display
         p "  Name:", @name, "  Cuisine:", @cuisine  
         p "Ingridents:", @ingredients_hash
         p " Steps:", @steps
    end
    
    
    def how_many_ingredients
        ingredients = @ingredients_hash.split(",")
        puts "Number of Ingridents:" , ingredients.count
    end
    
    
    def has_ingredient?
        puts "Enter the ingredient to check in recepie"
        has_ingredient = gets.chomp.to_s
        puts ingredients_hash.include?(has_ingredient)
    end
    
    
    def insert_recepie
   
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
    
#     def delete_recepie
#         puts "Enter Your Receipe"
#         recepie = gets.chomp!
#         puts "Enter Cuisine"
#         cuisinetype = gets.chomp!
#         puts "Enter Ingrident"
#         ingredientsquantity = gets.chomp!
#         puts "Enter the steps to be followed"
#         stepstodo = gets.chomp!
#         obj = Receipe.delete(recepie,cuisinetype,ingredientsquantity,stepstodo)
#         obj.display(recepie,cuisinetype,ingredientsquantity,stepstodo)
    
#   end

 def jsondata
        json = File.read('/home/ubuntu/workspace/test/models/data.json').to_s
        obj = JSON.parse(json)
        #puts obj.to_json
        puts obj['Cuisine']
    
     end

   def json_read
        f = File.new('/home/ubuntu/workspace/test/models/data.json')
        my_data = f.read
        my_recipes_data= JSON.parse(my_data)
        puts my_recipes_data.to_json    
   end
   
   
   def deletereceipe
    receipAarray =insert_recepie
    puts "enter Recepie to delete"
    del_Recipe = gets.chomp!
    receipAarray.reject! { |h| h["Recepie"] == del_Recipe }
    puts receipAarray
   end
 
    
    
    obj1 = Receipe.new('Briyani', 'Indian',{:chicken => 1,:rice => 2,:spices =>2,:blah =>3,},'cook and eat') 
    
    obj1.deletereceipe
    
    
    
    
    
    
    
 
    
    
end
