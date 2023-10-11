file_data = File.read("collections.txt")

companies_names = file_data.scan(/(?<=\n)\w+-?\w+/)
debts = file_data.scan(/((?<=\$)\d+,\d+)/)
