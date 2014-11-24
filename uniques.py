
import sys

def uniques(line):
    uniques = []
    for num in line.split(','):
        if int(num) not in uniques:
            uniques.append(int(num))
    return ','.join(str(num) for num in uniques)

test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    if test.strip() == "":
        break
    print uniques(test.strip())
test_cases.close()
