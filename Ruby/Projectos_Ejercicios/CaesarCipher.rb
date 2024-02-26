

def caesar_cipher(string, shift)
    new_string = ""
    string.each_char do |char|
            if char.match?(/[A-Za-z]/)
            
            # Lo utilizamos como base del desplazamiento es decir si tenemos la D mayuscula la base seran las mayusculas en ASCII que estaria depslaza esa D 3 posiciones 
            base = char.ord < 91 ? 'A'.ord : 'a'.ord
            
            #El modulo de 26 porque son 26 letras en el alfabeto y si nos pasamos de la Z o z volvemos a empezar
            new_char = ((char.ord - base - shift) % 26) + base
            
            # Agrega el nuevo caracter al resultado
            new_string += new_char.chr
            
            else 
                new_string += char
            end
    end
    
    return new_string
    
end


#Probamos la funcion 

resultado = caesar_cipher("Hola Soy Pablete", 3)

puts resultado