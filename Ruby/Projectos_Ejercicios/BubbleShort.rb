matriz = [4,3,78,2,0,2]

def bubble_sort(matriz)
    n = matriz.length
    loop do
        swapped = false
        (n-1).times do |i|
            if matriz[i] > matriz[i+1]
                matriz[i], matriz[i+1] = matriz[i+1], matriz[i]
                swapped = true
            end
        end
        break unless swapped
    end
end

bubble_sort(matriz)
puts matriz
