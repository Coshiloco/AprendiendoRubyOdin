# Imprinting the data type of a variable

#Enteros

#Suma
puts 1 + 1 
#Resta 
puts 2 - 1
#Multiplicacion
puts 2 * 2
#Division
puts 4 / 2
#Exponente
puts 2 ** 2
puts 3 ** 4
#Modulo
puts 5 % 2
puts 6 % 2


#Flotantes
puts 17 / 5

#Para obtener una respuesta precisa con decimales
puts 17.0 / 5

#Conversion de tipos de números
puts 13.to_f
puts 13.0.to_i
puts 13.9.to_i

#Metodos numéricos utiles
puts "Metodos numericos utiles"

#Meotdo para determinar si un numero es par o no
puts 6.even?
puts 7.even?

#Metodo para determinar si un numero es impar o no
puts 6.odd?
puts 7.odd?

#Formas de concatenar u interpolar cadenas en Ruby
puts "Welcome " + "to " + "Ruby Hijo de Puta"
puts "Welcome " << "to " << "Ruby Hijo de Puta"
puts "Welcome to #{'Ruby Hijo de Puta'}"
puts "Welcome ".concat("to ").concat("Ruby Hijo de Puta")

#Metodos para aplicar arrays a cadenas 
puts "Metodos para aplicar arrays a cadenas"

puts "hello"[0]
puts "hello"[0..1]
puts "hello"[0, 4]
puts "hello"[-1]

for i in 0..4
    puts "hello"[i]
end 


#Caracteres de escape


\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
# \'  #=> Single quotation mark

# Metodos para aplicar caracteres de escape
#capitalize

"hello".capitalize #=> "Hello"
#include?

"hello".include?("lo")  #=> true

"hello".include?("z")   #=> false
#upcase

"hello".upcase  #=> "HELLO"
#downcase

"Hello".downcase  #=> "hello"
#empty?

"hello".empty?  #=> false

"".empty?       #=> true
#length

"hello".length  #=> 5
#reverse

"hello".reverse  #=> "olleh"
#split

"hello world".split  #=> ["hello", "world"]

"hello".split("")    #=> ["h", "e", "l", "l", "o"]
#strip

" hello, world   ".strip  #=> "hello, world"

"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"

5.to_s        #=> "5"

nil.to_s      #=> ""

:symbol.to_s  #=> "symbol"


:my_symbol

"string" == "string"  #=> true

"string".object_id == "string".object_id  #=> false

:symbol.object_id == :symbol.object_id    #=> true
