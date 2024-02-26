=begin
    Metodos enumerables que facilitan el trabajo con listas y hashes
    
=end

#Primer ejemplo sin metodos enumerables

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
    if friend != 'Brian'
        invited_list.push(friend)
    end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]

#Con metodos enumerables

#Metodo select 


=begin
    La definición del método .select se basa en la iteración sobre cada elemento del objeto sobre el cual se llama 
    (en tu ejemplo, un array) y la evaluación de la condición proporcionada dentro del bloque para cada elemento. 
    Si la condición devuelve true para un elemento, 
    ese elemento se incluye en el nuevo array que será el resultado del método .select. 
    Si la condición devuelve false, el elemento se omite
=end

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]

#Metodo reject

=begin
    
El método .reject en Ruby funciona de manera similar al método .select, 
pero en vez de seleccionar los elementos que cumplen con la condición especificada en el bloque, 
.reject elimina o excluye aquellos elementos para los cuales el bloque devuelve true. Esencialmente, 
.reject filtra fuera los elementos que coinciden con la condición dada.
=end

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.reject { |friend| friend == 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]


#Metodo each

=begin
    #each es el abuelo de los métodos enumerables. Es un poco como Chuck Norris: 
    puede hacer cualquier cosa. Sin embargo, 
    como verás a lo largo de esta lección, el hecho de que puedas usar 
    #each para hacer casi cualquier cosa no significa 
    que siempre sea la mejor herramienta o la más eficiente para el trabajo.
    Al llamar a #each en una matriz, se iterará a través de esa matriz y 
    se producirá cada elemento en un bloque de código, donde se puede realizar una tarea:
=end


friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

#Practica recomendada cuando el bloque de codigo dentro del each es muy grande 

my_array = [1, 2]

my_array.each do |num|
    num *= 2
    puts "The new number is #{num}."
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2]

=begin
    #each con Hashes
    
    Primero, tenemos una declaración de un hash llamado my_hash:

ruby
Copy code
my_hash = { "one" => 1, "two" => 2 }
Un hash en Ruby es una colección de pares clave-valor. En este caso, my_hash tiene dos pares: la clave "one" asociada al valor 1, y la clave "two" asociada al valor 2.

Primera Iteración: Uso de dos variables de bloque
A continuación, se utiliza el método each para iterar sobre cada par clave-valor en el hash:

ruby
Copy code
my_hash.each { |key, value| puts "#{key} is #{value}" }
El método each pasa cada par clave-valor al bloque { |key, value| puts "#{key} is #{value}" }. Dentro del bloque, las variables key y value son asignadas a la clave y valor de cada par, respectivamente. El bloque de código simplemente imprime una cadena que incorpora ambas, la clave y el valor, resultando en la salida:

csharp
Copy code
one is 1
two is 2
Esto significa que para cada par en el hash, se imprime la clave seguida por su valor asociado.

Segunda Iteración: Uso de una variable de bloque
Luego, hay otra iteración sobre el hash con una ligera variante en la forma de pasar el par clave-valor al bloque:

ruby
Copy code
my_hash.each { |pair| puts "the pair is #{pair}" }
En este caso, en lugar de separar el par clave-valor en dos variables (key y value), se pasa el par completo como un solo objeto (pair) al bloque. En Ruby, los pares clave-valor de un hash se representan internamente como arrays de dos elementos, donde el primer elemento es la clave y el segundo el valor. Por eso, cuando imprimes pair, obtienes:

arduino
Copy code
the pair is ["one", 1]
the pair is ["two", 2]
Esto muestra que cada pair es un array que contiene la clave en la primera posición y el valor en la segunda.
=end

my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}


=begin

La confusión aquí se debe a la expectativa de que el método .each modifique la matriz original o retorne una nueva matriz con los cambios aplicados a cada elemento. Sin embargo, este no es el caso, y explicaré el porqué.

El código proporcionado es el siguiente:

ruby
Copy code
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
Aquí está lo que realmente sucede:

Iteración con .each: El método .each se utiliza para iterar sobre cada elemento de la matriz friends. Para cada iteración, la variable friend toma el valor de cada elemento de la matriz (por ejemplo, 'Sharon', 'Leo', etc.).

Aplicación de .upcase: Dentro del bloque { |friend| friend.upcase }, se llama al método .upcase en la variable friend. Este método devuelve una nueva cadena con todos los caracteres en mayúscula. Sin embargo, y aquí está el punto crucial, no modifica el valor original de friend en la matriz friends. Simplemente devuelve un nuevo valor que no se asigna a ninguna variable ni se almacena en ningún lugar.

El valor de retorno de .each: El método .each siempre devuelve el objeto original sobre el que se llamó, en este caso, la matriz friends original sin modificar. Por lo tanto, aunque friend.upcase se evalúa para cada amigo, esos valores en mayúscula no reemplazan los valores originales en la matriz friends.

Si tu intención es obtener una nueva matriz con los nombres en mayúscula, deberías utilizar el método .map en lugar de .each. .map crea una nueva matriz con los resultados de ejecutar el bloque de código para cada elemento de la matriz original. Así es cómo se vería:

ruby
Copy code
friends_upcase = friends.map { |friend| friend.upcase }
Esto sí generaría la matriz modificada que esperabas: ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN'], porque .map transforma cada elemento según el bloque proporcionado y retorna una nueva matriz con esos elementos transformados.

En resumen, .each se utiliza para efectos secundarios (como imprimir valores o modificar objetos mutables), mientras que .map se utiliza para transformar datos y devolver una nueva colección basada en esos datos transformados.
=end

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

=begin
El método each_with_index
Este método es casi el mismo que #each, 
pero proporciona alguna funcionalidad adicional al producir dos variables de bloque en lugar de una a medida que itera a través de una matriz. 
El valor de la primera variable es el elemento en sí, mientras que el valor de la segunda variable es el índice de ese elemento dentro de la matriz. 
Esto te permite hacer cosas que son un poco más complejas.
=end

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]


=begin
    Metodo #gsub
    
    El método gsub en Ruby es una herramienta muy poderosa y versátil que se utiliza para realizar sustituciones en cadenas de texto (strings). La abreviatura gsub significa "global substitution" (sustitución global). Este método busca todas las ocurrencias de un patrón específico en una cadena y las reemplaza con otra cadena que se especifique. La forma general de usar gsub es la siguiente:

ruby
Copy code
cadena_original.gsub(patrones_a_buscar, cadena_de_reemplazo)
patrones_a_buscar: Puede ser una cadena de texto simple o una expresión regular. Ruby buscará todas las ocurrencias de este patrón dentro de la cadena original.
cadena_de_reemplazo: Esta es la cadena de texto que reemplazará cada ocurrencia del patrón buscado en la cadena original.
Ahora, vamos a desglosar tu ejemplo específico:

ruby
Copy code
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
En este contexto, tienes una matriz my_order que contiene cadenas de texto representando ítems de un pedido, y cada ítem tiene la palabra 'medium' para indicar su tamaño.

El método map se utiliza aquí para transformar cada elemento de la matriz my_order. Para cada item en my_order, se llama al método gsub para realizar la siguiente operación:

patrones_a_buscar: 'medium'. gsub buscará esta cadena exacta en cada item.
cadena_de_reemplazo: 'extra large'. Esta es la cadena que reemplazará a 'medium' en cada item.
Por lo tanto, para cada elemento de la matriz, gsub reemplaza la palabra 'medium' con 'extra large', resultando en una nueva matriz donde cada ítem refleja el cambio de tamaño. La nueva matriz es entonces ["extra large Big Mac", "extra large fries", "extra large milkshake"], donde cada 'medium' ha sido reemplazado por 'extra large'.

Este proceso demuestra cómo gsub puede ser utilizado para realizar cambios de texto específicos de manera eficiente en múltiples cadenas, especialmente útil para tareas de procesamiento de texto o manipulación de datos en Ruby.
=end

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]


=begin
    Metodo #select
    
    El método #select (también llamado #filter) pasa todos los elementos 
    de una matriz a un bloque y devuelve una nueva matriz con solo los elementos 
    para los que la condición establecida en el bloque se evalúa como true.
=end


friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

#=> ["Sharon", "Leo", "Leila", "Arun"]


responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}


=begin
    Metodo #reduce
    
    
    El método #reduce (también llamado #inject) es posiblemente el enumerable más difícil de entender para los nuevos codificadores. 
    La idea general es que toma una matriz o hash y la reduce a un solo objeto. 
    Debe usar #reduce cuando desee obtener una salida de un solo valor.
    
    También podemos establecer un valor inicial diferente para el acumulador 
    pasando directamente un valor al método #reduce.
=end

my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26

my_numbers = [5, 6, 7, 8]

my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026

#MEtodo interesante de hash 

=begin
Si bien como valor predeterminado es decir estamos determinando 
el objeto que nos va a devolver que va a ser un hash 
estamos utilizando un acumulador que es el result 
que es aquella variable destinada a almacenar la cantidad 
de veces que aparece una misma clave 
y vote que es cada elemento del Array de votes 
partiendo de entender esto 
lo interesante aqui ya estamos determinando el resultado a devolver el hash
y tenemos el acumulador y la variable que recorre la lista y devuelve
cuando estamos sumando mas uno en lo que es el bloque de instrucciones que se jecutara dentro 
lo que estamos haciendo al acumular ese resultado es guardando indirectamente 
estas repeticiones 
=end

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
    result[vote] += 1 # Porque esto sobreescribe la cantidad de veces que va a aparecer la misma clave 
    result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}


# Anteriormente, mencionamos que los enumerables como #map y #select devuelven nuevas matrices, pero no modifican las matrices en las que se les llamó.

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']


# los métodos bang se pueden identificar fácilmente por sus signos de exclamación (!) al final de su nombre. Todos los métodos bang son destructivos y modifican el objeto al que se llaman.

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`


=begin
    Valores devueltos de enumerables
    
    Una opción es poner el resultado de un método enumerable en una variable local:
    
    Una opción aún mejor sería encapsular el método enumerable en una definición de método:
=end


friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

def invited_friends(friends)
    friends.select { |friend| friend != 'Brian' }
end

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends(friends)
#=> ["Sharon", "Leo", "Leila", "Arun"]