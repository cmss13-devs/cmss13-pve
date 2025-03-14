import time

def read_replacement_pairs(filename):
    """
    Reads replacement pairs from the given file.
    Each line in the file should contain a pair of strings separated by whitespace.
    """
    replacements = {}
    with open(filename, 'r') as file:
        for line in file:
            print(line)
            parts = line.strip().split(maxsplit=1)

            if len(parts) == 2:
                original, replacement = parts
                replacements[original] = replacement
    return replacements

def replace_strings_in_file(input_filename, replacements):
    """
    Replaces strings in the input file based on the provided replacements dictionary.
    """
    with open(input_filename, 'r') as file:
        content = file.read()

    for original, replacement in replacements.items():
        content = content.replace(original, replacement)
        print(original + " " + replacement)
    with open(input_filename, 'w') as file:
        file.write(content)

def main():
    replacements = read_replacement_pairs('baycode.txt')
    replace_strings_in_file('full nerva.dmm', replacements)

if __name__ == "__main__":
    main()
