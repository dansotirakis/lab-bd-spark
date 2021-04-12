import csv

switcher = {
    1: "csv",
    2: "avro",
    3: "text",
    4: "others"
}

type_data = switcher.get(int(input("What\'s a type for data : ")), "Invalid data type")

value = "../../../data/" + type_data + "/" + input("File for this working : ") + "." + type_data

with open(str(value), encoding='utf-8', mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    line_count = 0
    for row in csv_reader:

        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
            print()
        print(row)
        line_count += 1
    print(f'Processed {line_count} lines.')
