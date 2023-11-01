import sys
import json

if len(sys.argv) <= 1:
    exit(1)

status = 0

for file in sys.argv[1:]:
    with open(file, encoding="UTF-8") as f:
        try:
            json.load(f)
        except ValueError as exception:
            print("JSON error in {}".format(file))
            print(exception)
            status = 1
        else:
            print("Valid {}".format(file))

exit(status)
