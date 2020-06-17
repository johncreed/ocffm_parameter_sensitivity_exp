import sys
import re

def match(line, fout=sys.stdout):
    integer_pattern="[0-9]+"
    float_pattern="[0-9]+[.][0-9]+"
    number_pattern= "(" + float_pattern + "|" + integer_pattern + ")"
    white_space="\s+"

    if (re.fullmatch(white_space, line) or len(line) == 0):
        return

    match = re.search("log", line)
    if match:
        # parse param log
        param = re.search(number_pattern, line)
        print("{}\t".format(param.group(0)), end="", file=fout)
    else:
        # parse p@5
        pair_pattern="\s*\(\s*{}\s*,\s*{}\s*\)\s*".format(number_pattern, number_pattern)
        log_pattern = "{}{}{}".format(number_pattern, pair_pattern, pair_pattern)
        match = re.search(log_pattern, line)
        print("{}\t{}\n".format(match.group(2), match.group(4)), end="", file=fout)

def parse(filename):
    with open(filename, 'r') as rf:
        param_type = re.search("(\S*).log", filename)
        with open( "{}.txt".format(param_type.group(1)), 'w' ) as fout:
            for line in rf:
                match(line, fout)

if __name__ == "__main__":
    filename = sys.argv[1]
    parse(filename)

