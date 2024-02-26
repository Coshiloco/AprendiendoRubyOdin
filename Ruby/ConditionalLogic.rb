#La fundamentacion del condicional mas basico 

room_tidy = true

if room_tidy == true
    puts "I can play video games"
end

#Los únicos valores falsos en Ruby son los valores nil y false en sí. ¡Eso es todo! Todo lo demás se considera cierto. ¡Incluso la cadena ""false" es verdadera en expresiones condicionales! 

if 1 < 2
    puts "Hot diggity , 1 is less than 2!"
end

#Si solo hay una linea de codigo 

puts "Hot diggity damn, 1 is less than 2" if 1 < 2

# El if else 
if attack_by_land == true
    puts "release the goat"
else
    puts "release the shark"
end

#COn el elsif
if attack_by_land == true
    puts "release the goat"
elsif attack_by_sea == true
    puts "release the shark"
else
    puts "release Kevin the octopus"
end

#Logica booleana con operadores 
5 == 5 #=> true
5 == 6 #=> false

5 != 7 #=> true
5 != 5 #=> false

7 > 5 #=> true
5 > 7 #=> false

5 < 7 #=> true
7 < 5 #=> false

7 >= 7 #=> true
7 >= 5 #=> true

5 <= 5 #=> true
5 <= 7 #=> true

5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true

#equal? Comprueba si ambos valores son exactamente el mismo objeto en la memoria.

a = 5
b = 5
a.equal?(b) #=> true

#Esta expresión es verdadera debido a la forma en que las computadoras almacenan los enteros en la memoria. Aunque dos variables diferentes tienen el número 5, apuntan al mismo objeto en la memoria.


a = "hello"
b = "hello"
a.equal?(b) #=> false

#Esto sucede porque las computadoras no pueden almacenar cadenas de la misma manera eficiente que almacenan números. Aunque los valores de las variables son los mismos, el equipo ha creado dos objetos de cadena separados en la memoria.

#Hay un operador especial en Ruby que se le conoce como el operador de nave espacial. Este operador es utilizado para comparar dos valores. Devuelve 0 si el primer valor es igual al segundo, 1 si el primer valor es mayor que el segundo, y -1 si el primer valor es menor que el segundo.

5 <=> 10    #=> -1
10 <=> 10   #=> 0
10 <=> 5    #=> 1

#Operadores logicos

#que son &&& (y), || (o) y ! (no).

if 1 < 2 && 5 < 6
    puts "Party at Kevin's!"
end
# This can also be written as
if 1 < 2 and 5 < 6
    puts "Party at Kevin's!"
end

=begin
Una cosa a tener en cuenta con los operadores &&& y || es el orden de la lógica. Las expresiones siempre se evalúan de izquierda a derecha.

Con el operador &&&, ambas expresiones deben devolver true. Si la primera expresión encontrada devuelve false, 
la segunda expresión nunca se comprueba. Para el intérprete de Ruby, no tiene sentido evaluar la segunda mitad, 
ya que la expresión general nunca puede devolver true.

Con el operador ||, si la primera expresión se evalúa como verdaderatrue, 
la segunda expresión nunca se comprueba porque la expresión completa ya es true y se ejecuta el código del bloque.

Esto se conoce como evaluación de cortocircuito.
=end

if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
    puts "Party at Kevin's!"
end
# This can also be written as
if 10 < 2 or 5 < 6
    puts "Party at Kevin's!"
end


=begin
El operador ! invierte la lógica de la expresión. Por lo tanto, 
si la expresión en sí misma devuelve false, el uso del operador ! hace que la expresión sea true y se ejecutará el código dentro del bloque.
=end


if !false     #=> true

if !(10 < 5)  #=> true

#Case Statements 

=begin
Es una forma ordenada de escribir varias expresiones condicionales.
que darian como resultado un if..elsif
=end

grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
    when 'A' then "Hell yeah!"
    when 'D' then "Don't tell your mother."
    else "'YOU SHALL NOT PASS!' -Gandalf"
end

#Para hacer una manipulacion mas compleja del case statement eliminamos el then y este seria un ejemplo

grade = 'F'

case grade
when 'A'
    puts "You're a genius"
    future_bank_account_balance = 5_000_000
when 'D'
    puts "Better luck next time"
    can_i_retire_soon = false
else
    puts "'YOU SHALL NOT PASS!' -Gandalf"
    fml = true
end

#Unless Statement

=begin
El unless statement es el opuesto del if statement.
Solo procesa el bloque de código si la expresión es false.
Al igual que con if, puede escribir una instrucción unless en una línea 
y también puede agregar una cláusula else
Debe usar una instrucción unless cuando desee no hacer algo si una condición es true, ya que puede hacer 
que el código sea más legible que usar if !true.
=end


age = 19
unless age < 18
    puts "Get a job."
end


age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
    puts "Down with that sort of thing."
else
    puts "Careful now!"
end

#Operadores ternarios

=begin
Es un if..else que hace que el codigo sea mucho mas conciso 
Su sintaxis es declaración condicional ? <execute si es conditional statement ? <execute if true> : <execute if false>. Puede asignar el valor devuelto de la expresión a una variable.
Aquí, debido a que la expresión se evaluó como false, el código después de : se asignó a la response.

Escribir esto como un if...else sería mucho más detallada:
Sin embargo, si sus declaraciones condicionales son complicadas, entonces usar un if...else puede ayudar a que el código sea más legible. Recuerda, por encima de todo, que tu código debe ser legible y comprensible para otras personas, especialmente en la etapa de desarrollo. Siempre puede optimizar su código para que sea eficiente una vez que esté terminado y se esté moviendo a un entorno de producción donde la velocidad importa.
=end 

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."



