#Variables
age = 18

#Variables con sumas 
age = 18 + 5

#Los nombres de las variables son reutilizables y se pueden reasignar

age = 33

#Podemos reasignar el reusltado de una operacion a una misma  variable

age += 5

#Operadores matematicos comunes

age = 18
age -= 2  #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4

#Como nombrar variables 

# bad
a = 19
string = "John"

# good
age = 19
name = "John"
can_swim = false

#Si tenemos en cuenta de que en Ruby todo es un objeto, todas las variables se guardan como referencia a un objeto, no como el objeto en si.
desired_location = "Barcelona"
johns_location = desired_location

desired_location  #=> "Barcelona"
johns_location    #=> "Barcelona"

johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"