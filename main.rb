require_relative "acoes"

puts "Digite um afazer:"
texto = gets.chomp

acoes = texto.scan(/\b(#{Acao::TODAS.join('|')})\b/i).flatten

tags = texto.scan(/#[a-zA-ZÀ-ÿ0-9_]+/)

emails = texto.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/)

urls = texto.scan(%r{https?:\/\/[^\s]+}i)

horarios = []
horarios += texto.scan(/\b(?:[01]?\d|2[0-3])\s+[0-5]\d\b/)
horarios += texto.scan(/\b(?:[01]?\d|2[0-3])\s*horas?\b/i)
horarios += texto.scan(/às\s+(?:[01]?\d|2[0-3])/i)

datas = []
datas += texto.scan(/\b\d{1,2}\/\d{1,2}(?:\/\d{4})?\b/)
datas += texto.scan(/\b(?:hoje|amanhã|depois de amanhã)\b/i)
datas += texto.scan(/\b\d{1,2}(?:\s+de)?\s+(?:janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)(?:\s+de\s+\d{4})?\b/i)

acoes = texto.scan(/\b(#{Acao::TODAS.join('|')})\b/i).flatten

pessoas = []

texto.scan(
  /com\s+([A-ZÁÀÂÃÉÊÍÓÔÕÚÇ][a-záàâãéêíóôõúç]+(?:\s+e\s+[A-ZÁÀÂÃÉÊÍÓÔÕÚÇ][a-záàâãéêíóôõúç]+)*)/
) do |nome|
  pessoas << nome[0]
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