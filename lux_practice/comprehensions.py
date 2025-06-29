#scores = [45, 78, 88, 56, 90, 62, 33, 99, 70, 50]
#***********************************************************************
#1.1

# passed = [i for i in scores if i > 60]
# print(passed)


#***********************************************************************
#1.2

# grade = []
# for i in scores:
#     if i > 50:
#         grade.append('Pass')
#     else:
#         grade.append('Fail')

# print(scores)
# print(grade)

# grade = ['Pass' if i > 50 else 'Fail' for i in scores]
# print(grade)

#***********************************************************************
#2.1

# students = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve']
# marks = [82, 48, 79, 65, 91]

# sm = dict(zip(students, marks))
# print(sm)

# dict = {k: v for k, v in zip(students, marks)}
# print(dict)

#***********************************************************************
#2.2

# students = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve']
# marks = [82, 48, 79, 65, 91]

# dict_2 = {k: v for k, v in zip(students, marks) if v > 70}
# print(dict_2)

#***********************************************************************
#2.3

students = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve']
marks = [82, 48, 79, 65, 91]

dict_3 = {k: 'Pass' if v > 50 else 'Fail' for k, v in zip(students, marks)}
print(dict_3)
