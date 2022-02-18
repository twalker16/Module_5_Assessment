from cmath import log


log_file = open("um-server-01.txt") #opens um-server-01.txt file


def sales_reports(log_file): #defines function of sales_report that takes in the argument log_file
    for line in log_file: #loops through each line of  the argument log_file
        line = line.rstrip() #sets line equal to the contents of line withough trailing (noting, nothing is getting removed because there is no argument in the method)
        day = line[0:3] #acts as slice, copying index 0-2 (stopping before 3) to the variable day => day = Mon or Tue, ect.
        if day == "Mon": #if day is equal to "Tue", but I changed it to "Mon"
            print(line) #print line, which is the same function as console.log('line')


sales_reports(log_file) #run the function sales_reports, passing in the argument of log_file (which was defined as the contents of the um-server-01.txt file).

log_file.close()#added this because the file was never closed.