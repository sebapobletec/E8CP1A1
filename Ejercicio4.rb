menu = 1
file = File.open('products.txt', 'r')
files = file.readlines
files = files.map(&:chomp)
files = files.map { |line| line.split(/\W+/) }
products = []

files.map do |array|
  products.push({Product: array[0].to_s, Stock_s1: array[1], Stock_s2: array[2], Stock_s3: array[3]})
end

while menu != 6
  print "\n*****MENÚ PRINCIPAL*****\nElige tu opción:\n1. Mostar la cantidad de productos existentes\n2. Consultar stock por producto\n3. Muestra los productos no registrados\n4. Productos con stock menor a X\n5. Agregar un nuevo producto\n6. Salir\n************\n"
  menu = gets.chomp.to_i
  puts "\n"
  sleep(0.5)

  if menu == 1
    submenu = 0
    while submenu!=4
    print "\n*****MENÚ DE PRODUCTOS*****\nElige la opción:\n1. Mostrar la existencia de los productos\n2. Mostrar existencia por tienda\n3. Mostrar existencia total\n4. Volver al menu\n************\n"
    submenu = gets.chomp.to_i
    puts "\n"
    sleep(0.5)

      if submenu  == 1
        print "El stock de cada producto es:\n"
        products.each do |products|
          sumaproduct = products[:Stock_s1].to_i+ products[:Stock_s2].to_i+ products[:Stock_s3].to_i
          puts "#{products[:Product]} "+ sumaproduct.to_s
        end
        sleep(1)
      end

      if submenu == 2
        print "El stock de cada tienda es:\n"
        sumastore1 = 0
        products.each do |products|
        sumastore1 = sumastore1 + products[:Stock_s1].to_i
        end
        puts "Tienda 1 " + sumastore1.to_s

        sumastore2 = 0
        products.each do |products|
        sumastore2 = sumastore2 + products[:Stock_s2].to_i
        end
        puts "Tienda 2 " + sumastore2.to_s

        sumastore3 = 0
        products.each do |products|
        sumastore3 = sumastore3 + products[:Stock_s3].to_i
        end
        puts "Tienda 3 " + sumastore3.to_s
        sleep(1)
      end

      if submenu  == 3
        print "El stock total es:\n"
        sumatotal = 0
        products.each do |products|
          sumatotal = sumatotal + products[:Stock_s1].to_i+ products[:Stock_s2].to_i+ products[:Stock_s3].to_i
        end
        puts sumatotal
        sleep(1)
      end

    end
  end

  if menu == 2
    print "\nIngresa el nombre del producto\n"
    nameproduct = gets.chomp
    indexproduct = nil
    products.each_with_index do |products, index|
      indexproduct = index if products[:Product] == nameproduct
    end
    if indexproduct != nil
      sumaproduct = products[indexproduct][:Stock_s1].to_i+ products[indexproduct][:Stock_s2].to_i+ products[indexproduct][:Stock_s3].to_i
      puts "El stock del " + nameproduct +" es " + sumaproduct.to_s
      sleep 1
    else
      puts "\nEl producto no existe\n"
      sleep 1
    end
  end

  if menu == 3
    products.each do |products|
      puts "El producto #{products[:Product]} tiene stock sin registrar en la tienda 1\n" if products[:Stock_s1] == 'NR'
      puts "El producto #{products[:Product]} tiene stock sin registrar en la tienda 2\n" if products[:Stock_s2] == 'NR'
      puts "El producto #{products[:Product]} tiene stock sin registrar en la tienda 3\n" if products[:Stock_s3] == 'NR'
    end
    sleep 1
  end

  if menu == 4
    puts "\nIngres el valor de stock mínimo a consultar\n"
    minstock = gets.chomp.to_i
    puts "\n"
    products.each do |products|
      sumaproduct = products[:Stock_s1].to_i+ products[:Stock_s2].to_i+ products[:Stock_s3].to_i
      puts "El #{products[:Product]} tiene un stock total menor a #{minstock}" if sumaproduct<minstock
    end
    sleep 1
  end

  if menu == 5
    puts "\nIngrese el nuevo producto y su stock de cada tienda en el siguiente formato\nProducto2, 20, 0, 3"
    newproduct = gets.chomp.to_s
    newproduct = newproduct.split(/\W+/)
    if newproduct.length == 4
      products.push({Product: newproduct[0].to_s, Stock_s1: newproduct[1], Stock_s2: newproduct[2], Stock_s3: newproduct[3]})
      file = File.open('products.txt','a')
      file.puts "#{newproduct[0]}, #{newproduct[1]}, #{newproduct[2]}, #{newproduct[3]}"
      file.close
      sleep 1
      puts "\nProducto ingresado correctamente\n"
      sleep 1
    else
      puts "\nProducto no ingresado, recuerda utilizar el formato\n"
      sleep 1
  end

  if menu <1 || menu>6
    puts "Opción inválida"
    sleep 1
  end
end
end
