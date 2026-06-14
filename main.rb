puts "Digite um afazer:"
texto = gets.chomp

tags = texto.scan(/#[a-zA-ZÀ-ÿ0-9_]+/)

emails = texto.scan(
  /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/
)

urls = texto.scan(
  %r{https?:\/\/[^\s]+}i
)

puts "\n=== Resultado ==="

puts "Tags:"
tags.each do |tag|
  puts "- #{tag}"
end

puts "\nEmails:"
emails.each { |email| puts "- #{email}" }

puts "\nURLs:"
urls.each { |url| puts "- #{url}" }