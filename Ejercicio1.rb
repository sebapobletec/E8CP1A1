def create_index(string1, string2)
  file = File.open('index.html', 'w')
  file.puts "<p>"+string1+"</p>"
  file.puts "<p>"+string2+"</p>"
  file.close
  return nil
end

def create_list(array)
  file = File.open('index.html','a')
  if array != []
    file.puts "<ul>"
    array.each{|x| file.puts "\t<li>"+x+"</li>"}
    file.puts "</ul>"
  end
  file.close
  return nil
end

def p_color(color)
  file = File.open('index.html','r')
  lines = file.readlines
  lines.map{|x|
    puts x
    x.gsub!("<p>","<p style= background-color:"+color+">")
  }
  print lines
  file.close
  file = File.open('index.html', 'w')
  file.puts lines
  file.close()
  return nil
end

lista = ["número1", "número2", "número3"]
#lista = []
create_index("Hola", "Adiós")
create_list(lista)
p_color("blue")
