import re


def verify_element(arr, string):
    a = 0
    for i in arr:
        if string in i:
            a = 1
    if a == 0:
        return "No match"
    if a == 1:
        return "Yes, there is at least one match!"
