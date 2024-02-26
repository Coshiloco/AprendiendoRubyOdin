=begin
    Matrices anidadas o arrays bidimensionales
    
    
    Si desea que se devuelva un valor nulo al intentar acceder a un índice de un elemento 
    anidado inexistente, 
    puede utilizar el método #dig. Este método también se puede utilizar cuando se accede 
    a un índice inexistente dentro de un elemento anidado existente.
    
    Al cambiar el valor del primer elemento de la primera matriz anidada, 
    el primer elemento cambia en las tres matrices anidadas. 
    Este mismo comportamiento ocurrirá con cadenas, hashes o cualquier otro objeto mutable.
=end

test_scores = [
    [97, 76, 79, 93],
    [79, 84, 76, 79],
    [88, 67, 64, 76],
    [94, 55, 67, 81]
]

teacher_mailboxes = [
    ["Adams", "Baker", "Clark", "Davis"],
    ["Jones", "Lewis", "Lopez", "Moore"],
    ["Perez", "Scott", "Smith", "Young"]
]

teacher_mailboxes[0][0]
#=> "Adams"
teacher_mailboxes[1][0]
#=> "Jones"
teacher_mailboxes[2][0]
#=> "Perez"

teacher_mailboxes[0][-1]
#=> "Davis"
teacher_mailboxes[-1][0]
#=> "Perez"
teacher_mailboxes[-1][-2]
#=> "Smith"

teacher_mailboxes[3][0]
#=> NoMethodError
teacher_mailboxes[0][4]
#=> nil

teacher_mailboxes.dig(3, 0)
#=> nil
teacher_mailboxes.dig(0, 4)
#=> nil



=begin
    mutable = Array.new(3, Array.new(2))
Estás creando una matriz mutable con tres elementos, 
donde cada elemento es una referencia a la misma matriz [nil, nil].
Esto significa que los tres elementos de la matriz superior 
apuntan al mismo objeto en memoria. 
Cuando modificas uno de los elementos de una de las submatrices, 
como en mutable[0][0] = 1000, estás modificando ese objeto en memoria, 
lo cual se refleja en todas las referencias a ese objeto dentro de la matriz superior. 
Por eso ves el cambio reflejado en todas las submatrices:

immutable = Array.new(3) { Array.new(2) }
En este caso, el bloque { Array.new(2) } se ejecuta tres veces, 
creando tres objetos de matriz diferentes, 
cada uno con su propia ubicación en memoria. 
Aquí, cada elemento de immutable es una matriz [nil, nil] independiente. 
Por lo tanto, cuando modificas uno de ellos, como en immutable[0][0] = 1000,
solo afectas a esa submatriz específica, dejando las otras intactas:

Puede agregar otro elemento al final de la matriz anidada 
mediante el método #push o el operador de pala <<. 
Si desea agregar un elemento a una matriz anidada específica,
deberá especificar el índice de la matriz anidada.


Con esta sintaxis similar, puede agregar o 
quitar elementos de toda la matriz anidada o de un elemento anidado específico.
=end

mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]



immutable = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]


test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]


=begin
    Interacion sobre matrices anidadas
    
    #Flatten es para juntar las matrices y coger todos los elementos uno por uno 
=end

teacher_mailboxes.each_with_index do |row, row_index|
    puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

teacher_mailboxes.each_with_index do |row, row_index|
    row.each_with_index do |teacher, column_index|
        puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
    end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]


teacher_mailboxes.flatten.each do |teacher|
    puts "#{teacher} is amazing!"
  end
  #=> Adams is amazing!
  #=> Baker is amazing!
  #=> Clark is amazing!
  #=> Davis is amazing!
  #=> Jones is amazing!
  #=> Lewis is amazing!
  #=> Lopez is amazing!
  #=> Moore is amazing!
  #=> Perez is amazing!
  #=> Scott is amazing!
  #=> Smith is amazing!
  #=> Young is amazing!
  #=> ["Adams", "Baker", "Clark", "Davis", "Jones", "Lewis", "Lopez", "Moore", "Perez", "Scott", "Smith", "Young"]
  
=begin
    Este bloque utiliza dos métodos iterativos/enumerables de Ruby, any? y all?, para evaluar las puntuaciones:

.any?: Este método devuelve true si al menos uno de los elementos de la colección cumple con la condición especificada en el bloque. En este caso, la "condición" es otro bloque de código que utiliza el método .all?.

.all?: Este método evalúa si todos los elementos de una colección cumplen con la condición especificada en su bloque asociado. Devuelve true solo si todos los elementos de la colección pasan la prueba definida en el bloque; de lo contrario, devuelve false.

Así, el código pregunta: "¿Hay al menos un conjunto de puntuaciones (una submatriz en test_scores) donde todas las puntuaciones sean mayores que 80?".

Desglosemos la evaluación de test_scores.any?:

Para la primera submatriz [97, 76, 79, 93], scores.all? { |score| score > 80 } devuelve false porque no todos los scores son mayores que 80.
Para la segunda submatriz [79, 84, 76, 79], también devuelve false por la misma razón.
Lo mismo ocurre con la tercera [88, 67, 64, 76] y la cuarta [94, 55, 67, 81] submatrices; en cada caso, al menos un score es 80 o menos.

El acceso a un elemento específico en un hash anidado es muy similar a una matriz anidada. 
Se hace llamando a hash[:x][:y] 
donde :x es la clave del hash y :y es la clave del hash anidado.
=end


test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
#=> false


#Hashes anidades 

vehicles = {
    alice: {year: 2019, make: "Toyota", model: "Corolla"},
    blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
    caleb: {year: 2020, make: "Honda", model: "Accord"}
}

vehicles[:alice][:year]
#=> 2019
vehicles[:blake][:make]
#=> "Volkswagen"
vehicles[:caleb][:model]
#=> "Accord"


vehicles[:zoe][:year]
#=> NoMethodError
vehicles.dig(:zoe, :year)
#=> nil
vehicles[:alice][:color]
#=> nil
vehicles.dig(:alice, :color)
#=> nil

vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

vehicles[:dave][:color] = "red"
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

vehicles.delete(:blake)
#=> {:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

vehicles[:dave].delete(:color)
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

vehicles.select { |name, data| data[:year] >= 2020 }
#=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [nil, :caleb, :dave]

vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
#=> [:caleb, :dave]

vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]
