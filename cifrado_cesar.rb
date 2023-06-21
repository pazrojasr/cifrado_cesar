def cifrado_cesar(cadena, factor_desplazamiento)
  # Convertir el factor_desplazamiento a un valor positivo en el rango de 0-25
  factor_desplazamiento = factor_desplazamiento % 26

  # Convertir la cadena a un arreglo de caracteres
  caracteres = cadena.split("")

  # Iterar sobre cada caracter de la cadena
  caracteres_cifrados = caracteres.map do |caracter|
    # Verificar si el caracter es una letra
    if caracter.match(/[A-Za-z]/)
      offset_ascii = caracter.match(/[A-Z]/) ? 65 : 97
      # Obtener el código ASCII del caracter y calcular el desplazamiento
      ascii_desplazado = (caracter.ord - offset_ascii + factor_desplazamiento) % 26 + offset_ascii
      # Convertir el código ASCII desplazado de nuevo a caracter
      caracter_desplazado = ascii_desplazado.chr
    else
      # Mantener los caracteres que no son letras sin cambios
      caracter
    end
  end

  # Unir los caracteres cifrados en una cadena
  cadena_cifrada = caracteres_cifrados.join("")

  return cadena_cifrada
end

# Solicitar texto original y factor de desplazamiento al usuario
puts "Ingrese el texto original:"
texto_original = gets.chomp

puts "Ingrese el factor de desplazamiento:"
factor_desplazamiento = gets.chomp.to_i

# Aplicar el cifrado César al texto original
texto_cifrado = cifrado_cesar(texto_original, factor_desplazamiento)

# Imprimir el texto cifrado
puts "Texto cifrado: #{texto_cifrado}"
