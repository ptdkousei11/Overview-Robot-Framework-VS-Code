def count_line_contain_VoIP_or_Nortel(arr):
    a = 0
    for i in arr:
        if 'VoIP' in i:
            a = a + 1
        if 'Nortel' in i:
            a = a + 1
    return a
