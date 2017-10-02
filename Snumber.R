import glob, os, re

# create regex to search for UHL 'S numbers'
# Start with S, followed by 7 digits

regex = re.compile('S\d{7}')

# set directory to search
parent_dir = r"C:\Users\Dell\Google Drive\Python code\Letters"

# only searches text files (ending .txt)
# .findall finds matches for regex (S number) in letters
for text_file in glob.glob(os.path.join(parent_dir, '*.txt')):
    
    file = open(text_file)
    contents = file.read()
    Snum = regex.findall(contents)
    if len(Snum)>0:
        strNum = Snum
    else:
        strNum = 'na'
    print(text_file)
    print(strNum)
    print('\n')

# need to output as dict
# also adapt for Word files (with different Unicode encoding etc)
# probably only save irst item in Snum (currently a list, can contain duplicates)