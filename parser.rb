file = File.open("engsoft.txt", "r:ISO-8859-1:utf-8")
arr = []
file.readlines.each do |line|
    match = line.scan(/(\d{2}\/\d{7})\s*([a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ'\s]+)/)
    #match = line.scan(/\d{2}\/\d{7}\s*[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ'\s]+/)
    if match.length > 0
        arr.append(match)
    end
end
file.close


new_file = File.open("newtxt.txt", "w")
arr.each do |elem|
    new_file.write("#{elem[0][0]}\t#{elem[0][1]}")
    #new_file.write("#{elem[0]}")
end
new_file.close

puts %Q{#{arr}}
