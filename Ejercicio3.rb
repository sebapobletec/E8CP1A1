def how_many_words(filename)
  file = File.open( filename ,'r')
  movies = file.read
  movies = movies.split(/\W+/)
  return movies.count
end

def how_many_of_these_words(filename, string)
  file = File.open( filename ,'r')
  movies = file.read
  movies = movies.split(/\W+/)
  suma = 0
  movies.each do |x|
    suma = suma + 1 if x.to_s.downcase.eql?string.downcase
    end
  return suma
end


puts how_many_words('peliculas.txt')
puts how_many_of_these_words('peliculas.txt',"la")
