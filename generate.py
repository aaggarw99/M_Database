import random, string

def randomword(length):
   return ''.join(random.choice(string.ascii_lowercase) for i in range(length))

filename = "populate_db_large.sql"

# 10,000
# u_columns = 11
u_rows = 10000

# 10,000
# i_columns = 5
i_rows = 10000

# 10,000
# a_columns = 4
a_rows = 10000

# 1000
# d_columns = 5
d_rows = 1000

returnString = ""

with open(filename, "w") as outfile:
        # creates data for USER table
        returnString = "INSERT INTO USER VALUES"
        for x in range(u_rows):
            a_list = [x]
            for a in range(1, 6):
                a_list.append(randomword(10))
            for a in range(0, 2):
                a_list.append(random.randint(1, 70))
            for a in range(0, 4):
                a_list.append(randomword(10))
            returnString += "(" + str(a_list[0]) + ",'" + a_list[1] + "','" + a_list[2] + "','" + a_list[3] + "','" + a_list[4] + "','" + a_list[5] + "',"
            returnString += str(a_list[6]) + "," + str(a_list[7]) + ",'" + a_list[8] + "','" + a_list[9] + "','" + a_list[10] + "'),"
        returnString = returnString[:-1]
        returnString += ";"
        print(returnString)
        outfile.write(returnString+"\n")
        outfile.write("\n")
        returnString = "INSERT INTO INSTRUMENT VALUES"
        for x in range(i_rows):
            a_list = [x]
            a_list.append(randomword(10))
            a_list.append(bool(random.getrandbits(1)))
            a_list.append(randomword(10))
            a_list.append(random.randint(1300, 2017))
            returnString += "(" + str(a_list[0]) + ",'" + a_list[1] + "'," + str(a_list[2]) + ",'" + a_list[3] + "','" + str(a_list[4]) + "'),"
        returnString = returnString[:-1]
        returnString += ";"
        print(returnString)
        outfile.write(returnString+"\n")
        outfile.write("\n")
        returnString = "INSERT INTO FAVORITE_ARTIST VALUES"
        for x in range(a_rows):
            a_list = [x]
            for a in range(0, 2):
                a_list.append(randomword(10))
            a_list.append(random.randint(1, 70))
            returnString += "(" + str(a_list[0]) + ",'" + a_list[1] + "','" + a_list[2] + "','" + str(a_list[3]) + "'),"
        returnString = returnString[:-1]
        returnString += ";"
        print(returnString)
        outfile.write(returnString+"\n")
        outfile.write("\n")
        returnString = "INSERT INTO DAW VALUES"
        for x in range(d_rows):
            a_list = [x]
            a_list.append(randomword(10))
            for a in range(0, 3):
                a_list.append(bool(random.getrandbits(1)))
            returnString += "(" + str(a_list[0]) + ",'" + a_list[1] + "'," + str(a_list[2]) + "," + str(a_list[3]) + "," + str(a_list[4]) + "),"
        returnString = returnString[:-1]
        returnString += ";"
        print(returnString)
        outfile.write(returnString+"\n")
