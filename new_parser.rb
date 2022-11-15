module TextFile
    
    def file_to_array(filename)
        file = File.open(filename, "r:ISO-8859-1:utf-8")
        arr = []
        file.readlines.each do |line|
            match = line.scan(/(\d{2}\/\d{7})\s*([a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ'\s]+)/)
            #match = line.scan(/\d{2}\/\d{7}\s*[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ'\s]+/)
            if match.length > 0
                arr.append(match)
            end
        end
        file.close
        return arr
    end

    def array_to_file(filename, arr)
        # order array by block given
        arr = yield(arr)
        
        new_file = File.open(filename, "w")
        arr.each do |elem|
            new_file.write("#{elem[0][0]}\t#{elem[0][1]}")
            #new_file.write("#{elem[0]}")
        end
        new_file.close
    end

end

include TextFile

# reader file and parser to array
array = TextFile.file_to_array("parser_files/engsoft.txt")
#TextFile.array_to_file("parser_files/base_parser.txt", array)



# order by register number
TextFile.array_to_file("parser_files/registernumber_order.txt", array) do |arr|
    sorted = arr.sort() { |a, b| a[0] <=> b[0] }
end

# orber by name
TextFile.array_to_file("parser_files/name_order.txt", array) do |arr|
    sorted = arr.sort() { |a, b| a[1] <=> b[1] }
end


