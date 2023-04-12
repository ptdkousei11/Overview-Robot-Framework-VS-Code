import re


def get_packages(arr, recordID):
    a = ' '
    for i in arr:
        if recordID in i:
            a = a + i + "\n"
    return a


def split_arr(str):
    x = re.sub("[,]", "", str)
    x = re.sub("</IPDR>", "</IPDR>\n", x, 2)
    x = re.split("\n", x)
    return x
