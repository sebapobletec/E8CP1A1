def how_many_lines(filename)
  file = File.open( filename ,'r')
  movies = file.readlines
  lenght = movies.count
  file.close()
  return lenght
end

print how_many_lines('peliculas.txt')
