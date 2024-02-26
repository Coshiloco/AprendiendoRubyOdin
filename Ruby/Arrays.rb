=begin
Creación de matrices o Arrays 
Se pueden crear de forma muy similar a Python como aqui
También se puede crear una matriz llamando al método Array.new 
Al llamar a este método, también puede incluir 
hasta 2 argumentos opcionales (tamaño inicial y valor predeterminado):
=end

num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]


Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, 7)         #=> [7, 7, 7]
Array.new(3, true)      #=> [true, true, true]

#Cada elemento de la amtriz se añaden por indices como en otros lenguajes
str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"

=begin
    Ruby proporciona los métodos de matriz #first y #last, que deben 
    explicarse por sí mismos. Además, estos métodos pueden tomar un argumento entero, 
    por ejemplo, my_array.first(n)(n) o my_array.last(n), que devolverá una nueva matriz 
    que contiene los primeros o los últimos n elementos de my_array, respectivamente
=end

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]

=begin
La adición de un elemento a una matriz existente se realiza mediante el método #push o el operador shovel <<. 
Ambos métodos agregarán elementos al final de una matriz y devolverán esa matriz con los nuevos elementos. 
El método #pop 
quitará el elemento al final de una matriz y devolverá el elemento que se eliminó.


Los métodos #shift y #unshift se utilizan para agregar y quitar elementos al principio de una matriz. 
El método #unshift 
agrega elementos al principio de una matriz y devuelve esa matriz (al igual que #push).
El método #shift quita el 
primer elemento de una matriz y devuelve ese elemento (de forma muy parecida #pop)

También es útil saber que tanto #pop como #shift pueden tomar argumentos enteros:
=end

num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array << 5            #=> [1, 2, 3, 4, 5]
num_array.pop             #=> 5
num_array                 #=> [1, 2, 3, 4]

num_array = [2, 3, 4]

num_array.unshift(1)      #=> [1, 2, 3, 4]
num_array.shift           #=> 1
num_array                 #=> [2, 3, 4]


num_array = [1, 2, 3, 4, 5, 6]

num_array.pop(3)          #=> [4, 5, 6]
num_array.shift(2)        #=> [1, 2]
num_array                 #=> [3]


=begin
    Sumar y restar Matrices
    ¿Cuál crees que será el resultado de [1, 2, 3] [1, 2, 3] + [3, 4, 5]?

Si has adivinado [1, 2, 3, 3, 4, 5] ¡enhorabuena! Al agregar dos matrices, 
se devolverá una nueva matriz creada mediante la concatenación, 
similar a la concatenación de cadenas. 
El método concat funciona de la misma manera.


Para encontrar la diferencia entre dos matrices, 
puede restarlas usando -. Este método devuelve una copia de la primera matriz, 
eliminando los elementos que aparecen en la segunda matriz.

=end


a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]


[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]

=begin
    Metodos basicos para manejar matrices
    

=end

[].empty?               #=> true
[[]].empty?             #=> false
[1, 2].empty?           #=> false

[1, 2, 3].length        #=> 3

[1, 2, 3].reverse       #=> [3, 2, 1]

[1, 2, 3].include?(3)   #=> true
[1, 2, 3].include?("3") #=> false

[1, 2, 3].join          #=> "123"
[1, 2, 3].join("-")     #=> "1-2-3"
