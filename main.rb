require_relative "acoes"

puts "Digite um afazer:"
texto = gets.chomp

acoes = texto.scan(/\b(#{Acao::TODAS.join('|')})\b/i).flatten

tags = texto.scan(/#[a-zA-ZÀ-ÿ0-9_]+/)

emails = texto.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/)

urls = texto.scan(%r{https?:\/\/[^\s]+}i)

horarios = []
horarios += texto.scan(/\b(?:[01]?\d|2[0-3]):[0-5]\d\b/)
horarios += texto.scan(/\b(?:[01]?\d|2[0-3])\s+[0-5]\d\b/)
horarios += texto.scan(/\b(?:[01]?\d|2[0-3])\s*horas?\b/i)
horarios += texto.scan(/\b(?:[aà]s)\s+(?:[01]?\d|2[0-3])\b/i)

datas = []
datas += texto.scan(/\b\d{1,2}\/\d{1,2}(?:\/\d{4})?\b/)
datas += texto.scan(/\b(?:hoje|amanh[aã]|depois de amanh[aã])\b/i)
datas += texto.scan(/\b\d{1,2}(?:\s+de)?\s+(?:janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)(?:\s+de\s+\d{4})?\b/i)

pessoas = []

texto.scan(
  /com\s+((?:\p{Lu}\p{L}+(?:\s+e\s+\p{Lu}\p{L}+)*)?)/u
) do |nome|
  pessoas << nome[0] unless nome[0].empty?
end

puts "\n=== Resultado ==="

puts "Pessoas:"
pessoas.each { |p| puts "- #{p}" }

puts "Ações:"
acoes.each { |a| puts "- #{a}" }

puts "Datas:"
datas.each { |d| puts "- #{d}" }

puts "Horários:"
horarios.each { |h| puts "- #{h}" }

puts "Tags:"
tags.each { |tag| puts "- #{tag}" }

puts "Emails:"
emails.each { |email| puts "- #{email}" }

puts "URLs:"
urls.each { |url| puts "- #{url}" }
