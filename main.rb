puts "Digite um afazer:"
texto = gets.chomp

tags = texto.scan(/#[a-zA-ZÀ-ÿ0-9_]+/)

puts "\n=== Resultado ==="

puts "Tags:"
tags.each do |tag|
  puts "- #{tag}"
end