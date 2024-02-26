=begin
    Creacion d eun metodo en Ruby
    Puede crear sus propios métodos personalizados en Ruby utilizando la siguiente sintaxis:
    el retorno implcito de Ruby
    def my_name
        "Joe Smith"
    end
    puts my_name
    # => Joe Smith
    El método my_name no toma ningún argumento y devuelve la cadena "Joe Smith".
    El método se define utilizando la palabra clave def seguida del nombre del método y 
    cualquier argumento que el método tome entre paréntesis.
    Ruby tiene un retorno implícito, lo que significa que no es necesario usar 
    la palabra clave return para devolver un valor.
=end

def my_name
    "Joe Smith"
end

puts my_name # => Joe Smith

=begin
    Nombre de los metodos
    Estas son algunas de las cosas que no puede hacer con los nombres de los métodos:
    No puede nombrar su método como una de las aproximadamente 40 palabras reservadas de Ruby, 
    como end, while o for. 
    Echa un vistazo a la lista completa aquí.
    No puede utilizar ningún símbolo que no sea _, ?, !, y =.
    No puede usar ?, !, o = en ningún otro lugar que no sea al final del nombre.
    No se puede comenzar el nombre de un método con un número.
=end

method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid


=begin
    Parametros y argumentos de los metodos en Ruby
    
    Cuando desee devolver algo que no sea un resultado fijo, 
    debe proporcionar los parámetros de sus métodos. 
    Los parámetros son variables que el método recibirá cuando se le llame. 
    Puede tener interacciones más significativas y 
    útiles con los métodos mediante el uso de parámetros para hacerlos más versátiles.
    
    los parámetros actúan como variables de marcador de posición en la plantilla de tu método, 
    mientras que los argumentos son las variables reales que se pasan al método cuando se llama. 
    Por lo tanto, en el ejemplo anterior, name es un parámetro y ""John" es un argumento. Sin embargo, 
    los dos términos se usan comúnmente indistintamente, así que no te preocupes demasiado por esta
    distinción.
=end


def greet(name)
    "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!


=begin
    Parametros predeterminados en los metodos de Ruby
    
    
    ¿Qué sucede si no siempre desea proporcionar argumentos para cada parámetro que acepta su método? 
    Ahí es donde los parámetros predeterminados pueden ser útiles. 
    Volviendo a nuestro ejemplo anterior, ¿qué pasa si no sabemos el nombre de la persona? 
    Podemos cambiar nuestro método greet para usar un name predeterminado de "extraño":
=end

def greet(name = "stranger")
    "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!

=begin
    ¿Que metodos devuelven los metodos de Ruby?
=end

def my_name
    "Joe Smith"
end

puts my_name #=> "Joe Smith"

def my_name
    return "Joe Smith"
end

puts my_name #=> "Joe Smith"

def even_odd(number)
    if number % 2 == 0
        "That is an even number."
    else
        "That is an odd number."
    end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.

def my_name
    return "Joe Smith"
    "Jane Doe"
end

puts my_name #=> "Joe Smith"

def even_odd(number)
    unless number.is_a? Numeric
        return "A number was not entered."
    end
    
    if number % 2 == 0
        "That is an even number."
    else
        "That is an odd number."
    end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.


=begin
    Diferencia entre puts y return en Ruby
    
    puts es un método que imprime cualquier argumento que le pases a la consola.
    return es el resultado final de un método que se puede usar en otros lugares del código.
=end

def puts_squared(number)
    puts number * number
end

def return_squared(number)
    number * number
end

x = return_squared(20) #=> 400
y = 100
sum = x + y #=> 500

puts "The sum of #{x} and #{y} is #{sum}."
#=> The sum of 400 and 100 is 500.


=begin
    Metodos de encadenamiento en Ruby
    
    encadenar metodos integrados en Ruby o con los metodos que usted cree
    
    Este uso del = asignaría el resultado de la operación .join(" ") a una variable 
    si lo precediera una. 
    Por ejemplo: let joinedString = ["to", "be", "or", "not", "to", "be"].join(" "). 
    Esto convierte el array en una cadena de texto.
    
=end

phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"

["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"

=begin
    Metodos de predicado en Ruby
    
    Cuando los metodos terminan con un signo de interrogacion (?)
    se les llama metodos de predicado
    Estos metodos devuelven verdadero o falso
    
    
    También puede crear su propio método con un ? 
    al final de su nombre para indicar que devuelve un valor booleano. 
    Ruby no aplica esta convención de nomenclatura, 
    pero más adelante te lo agradecerás por seguir esta pauta.
=end

puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true

puts 12.between?(10, 15)  #=> true

=begin
    Metodos de explosión en Ruby
    
    Una regla general en programación es que no desea que los métodos sobrescriban 
    los objetos en los que se llaman. 
    Esto le protege de sobrescribir irreversiblemente sus datos por accidente. 
    Puede sobrescribir los datos reasignando explícitamente una variable 
    (como whisper whisper = whisper.downcase).
    
    Al agregar un ! al final del método, se indica que este método realiza su acción 
    y, simultáneamente, sobrescribe el valor del objeto original con el resultado.
    
    Escribir whisper.downcase! es el equivalente a escribir 
    whisper whisper = whisper.downcase whisper.downcase!.
=end


whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"
