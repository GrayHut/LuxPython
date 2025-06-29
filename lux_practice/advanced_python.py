#file handling
#types of files include JSON, EXCEL, TXT,  CSV

#we use the builtin function "open()" for file handling

#syntax >> open(filename, mode)
#modes include;
# r - read
# w - write
# a - append >> edits an existing file
# x - create >> creates and edits file
# t - text
# b - binary

f = open('data.csv')

#print(f)

csv = f.read(100)
print(type(csv))
print(csv)
f.close()

#f.open