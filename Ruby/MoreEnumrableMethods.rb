=begin
    Metodo #include?
    Sabemos que va a devolver true o false
    si el elemento que pasas como argumento existe o no en la matriz o hash
=end

numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false


=begin
    Metodo #any?
    Devuelve true si algún elemento de la matriz o hash coincide 
    con la condición dentro del bloque; de lo contrario, devolverá false.
    
    La variable number toma sucesivamente 
    el valor de cada elemento de la matriz numbers para la evaluación de la condición.
=end


numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false



=begin
    Metodo #all?
Solo devuelve true si todos los elementos de su matriz o hash coinciden 
con la condición que estableció dentro del bloque; de lo contrario, devolverá false.
    
    La variable fruit toma sucesivamente 
    el valor de cada elemento de la matriz fruits para la evaluación de la condición.
=end


fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false



=begin
    Metodo #none?
solo si la condición del bloque no coincide con ninguno 
de los elementos de su matriz o hash; de lo contrario, devuelve false.
    
    La variable fruit toma sucesivamente 
    el valor de cada elemento de la matriz fruits para la evaluación de la condición.
=end


fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false

