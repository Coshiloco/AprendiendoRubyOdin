=begin
un Hash es una colección de pares 
clave-valor donde cada clave es única dentro del hash y está asociada a un valor.


Este ejemplo muestra un hash con dos pares clave-valor. La primera clave es un número (9) que apunta al valor "nine", y la segunda clave es un símbolo (:six) que apunta al número 6.

Los símbolos (:symbol) son objetos inmutables y eficientes en Ruby, 
utilizados a menudo como claves en los hashes. 
La ventaja de usar símbolos como claves es que, a diferencia de las cadenas de texto, 
los mismos símbolos en diferentes partes de tu programa son exactamente el mismo objeto, 
lo que puede mejorar el rendimiento al reducir el uso de memoria y 
acelerar la comparación de claves.
=end

my_hash = {
    "a random word" => "ahoy",
    "Dorothy's math test score" => 94,
    "an array" => [1, 2, 3],
    "an empty hash within a hash" => {}
}

my_hash = Hash.new
my_hash               #=> {}


hash = { 9 => "nine", :six => 6 }


=begin
    Acceso a los valores de un hash
    Se accede a los valores de un hash utilizando la sintaxis de corchetes [] 
    y la clave correspondiente.
    Si intenta acceder a una clave que no existe en el hash, devolverá nil:
    Afortunadamente, los hashes tienen un método 
    fetch que generará un error cuando intente acceder a una clave que no está en su hash.
    Como alternativa, este método puede devolver un valor predeterminado 
    en lugar de generar un error si no se encuentra la clave dada
=end

shoes = {
    "summer" => "sandals",
    "winter" => "boots"
}

shoes["summer"]   #=> "sandals"

shoes["hiking"]   #=> nil

shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"


=begin
    Agregar y modificar pares clave-valor
    Para agregar un nuevo par clave-valor a un hash,
    se utiliza la sintaxis de corchetes [] con una nueva clave y el valor correspondiente.
    Si la clave ya existe en el hash, el valor asociado con esa clave se sobrescribirá.
=end

shoes["fall"] = "sneakers"

shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}

shoes["summer"] = "flip-flops"

shoes     #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}


=begin
    Eliminar pares clave-valor
    Para eliminar un par clave-valor de un hash,
    se utiliza el método delete con la clave correspondiente.
=end

shoes.delete("summer")    #=> "flip-flops"

shoes                     #=> {"winter"=>"boots", "fall"=>"sneakers"}


=begin
    Metodos 
    Un par de métodos útiles que son específicos de los hashes son los métodos #keys y #values, 
    que como era de esperar devuelven las claves y los valores de un hash, respectivamente. 
    Tenga en cuenta que ambos métodos devuelven matrices.
=end

books = {
    "Infinite Jest" => "David Foster Wallace",
    "Into the Wild" => "Jon Krakauer"
}

books.keys      #=> ["Infinite Jest", "Into the Wild"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer"]

=begin
    Fusion de dos hashes
    De vez en cuando, te encontrarás 
    con una situación en la que dos hashes desean unirse en unión sagrada. 
    Afortunadamente, 
    hay un método para eso. (¡No se requiere ministro ordenado!)
    
    Tenga en cuenta que los valores del hash que se fusiona (en este caso, los valores de hash2) 
    sobrescriben los valores del hash que obtiene... uh, 
    fusionado en (hash1 aquí) cuando los dos hash1 tienen una clave que es la misma.

=end

hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)      #=> { "a" => 100, "b" => 254, "c" => 300 }

=begin
    Simbolos como claves de hash
    Los símbolos son objetos inmutables y eficientes en Ruby,
    utilizados a menudo como claves en los hashes.
    La ventaja de usar símbolos como claves es que, a diferencia de las cadenas de texto,
    los mismos símbolos en diferentes partes de tu programa son exactamente el mismo objeto,
    lo que puede mejorar el rendimiento al reducir el uso de memoria y acelerar la comparación de claves.
    
    
    En esta lección, usamos principalmente cadenas para las claves hash, pero en el mundo real, 
    casi siempre verás símbolos (como :this_guy) utilizados como claves. 
    Esto se debe principalmente a que los símbolos tienen un rendimiento mucho mayor que las cadenas en Ruby, 
    pero también permiten una sintaxis mucho más limpia al definir hashes. He aquí la belleza:

    Ese último ejemplo hace que se me salten las lágrimas, ¿no? Fíjate en que el hash rocket y 
    los dos puntos que representan un símbolo se han mezclado. Sin embargo, 
    desafortunadamente esto solo funciona para símbolos, así que no intente { 9: "value" } 
    o obtendrá un error de sintaxis.
    
    Cuando usas la sintaxis más limpia de 'símbolos' para crear un hash, 
    aún tendrás que usar la sintaxis de símbolo estándar cuando intentes acceder a un valor. 
    En otras palabras, independientemente de cuál de las dos opciones de sintaxis 
    anteriores utilice al crear un hash, 
    ambas crean claves de símbolo a las que se accede de la misma manera.
=end


# 'Rocket' syntax
american_cars = {
    :chevrolet => "Corvette",
    :ford => "Mustang",
    :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
    honda: "Accord",
    toyota: "Corolla",
    nissan: "Altima"
}

american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"