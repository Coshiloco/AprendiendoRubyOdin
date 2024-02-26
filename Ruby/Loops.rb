
=begin
    El bucle de bucle (di qué????) es el loop de 
    Ruby que simplemente no se detiene. 
    Es un bucle infinito que continuará a menos 
    que solicite específicamente que se detenga, 
    usando el comando break. Lo más común es que 
    break se use con una condición, 
    como se ilustra en el ejemplo siguiente.  
=end

i = 0
loop do
    i += 1
    puts "i is #{i}"
    break if i > 5
end

=begin
    Bucle While
    El bucle while es un bucle que se ejecuta
    excepto que se declara la condición que se romperá del bucle por adelantado.
    y cuando esa condicion es verdadera, el bucle se detiene.
    se ejecutará hasta que se cumpla 
    su condición de interrupción, 
    que podría ser para un número variable de 
    bucles o un número de bucles 
    que inicialmente se desconoce.
=end


i = 0
while i < 10 do
    puts "i is #{i}"
    i += 1
end


while gets.chomp != "yes" do
    puts "Are we there yet?"
end

=begin
    Bucle Until
    El bucle until es lo opuesto al bucle while. 
    Un bucle while continúa mientras la condición sea verdadera, 
    mientras que un bucle until continúa mientras la condición sea falsa.
    
    ¿Y si sabemos exactamente cuántas veces queremos que se ejecute nuestro bucle? 
    Ruby nos permite usar algo llamado rango para definir un intervalo. Todo lo que 
    tenemos que hacer es darle a Ruby el valor inicial, 
    el valor final y si queremos que el rango sea inclusivo o exclusivo.
=end

i = 0
until i >= 10 do
    puts "i is #{i}"
    i += 1
end

until gets.chomp == "yes" do
    puts "Do you like Pizza?"
end

(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d')  # a, b, c, d

#Bucle For 

=begin
Un bucle for se utiliza para iterar a través de una colección de información, 
como una matriz o un rango. Estos bucles son útiles 
si necesita hacer algo un número determinado de veces mientras usa un iterador.

=end

#Bucles de Tiempo

=begin
Si necesita ejecutar un bucle durante un número 
específico de veces, no busque más allá del bucle #times confiable. Funciona 
iterando a través de un bucle un número específico de veces e incluso 
agrega la bonificación de acceder al número por el que está iterando actualmente.


En Ruby, el uso de |variable| dentro de un bloque de código, 
como se ve en 5.times do |number|, 
define una variable que recibe el valor de cada iteración del bucle. 
Esta sintaxis es específica de los bloques en Ruby 
y se utiliza para pasar argumentos a los bloques de código.
=end


5.times do
    puts "Hello, world!"
end




5.times do |number|
    puts "Alternative fact number #{number}"
end

#Bucles Upto y Downto

=begin
Los métodos Ruby #upto y #downto hacen exactamente lo que 
pensarías que hacen por sus nombres. 
Puede utilizar estos métodos para iterar desde un número inicial hasta 
otro número, respectivamente.
=end

5.upto(10) { |num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) { |num| print "#{num} " }   #=> 10 9 8 7 6 5