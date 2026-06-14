puts "Digite um afazer:"
texto = gets.chomp

tags = texto.scan(/#[a-zA-ZÀ-ÿ0-9_]+/)

emails = texto.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/)

urls = texto.scan(%r{https?:\/\/[^\s]+}i)

horarios = []
horarios += texto.scan(/\b(?:[01]?\d|2[0-3])\s+[0-5]\d\b/)
horarios += texto.scan(/\b(?:[01]?\d|2[0-3])\s*horas?\b/i)
horarios += texto.scan(/às\s+(?:[01]?\d|2[0-3])/i)

puts "\n=== Resultado ==="

puts "Horários:"
horarios.each { |h| puts "- #{h}" }

puts "Tags:"
tags.each { |tag| puts "- #{tag}" }

puts "\nEmails:"
emails.each { |email| puts "- #{email}" }

puts "\nURLs:"
urls.each { |url| puts "- #{url}" }