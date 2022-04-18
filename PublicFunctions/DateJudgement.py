import datetime
def judgeDate(inputDate):
    if inputDate=='':
        return False
    today=datetime.datetime.today()
    date=inputDate.split('-')
    if not (len(date)==3):
        return False
    [year,month,day]=date
    if year=='' or month=='' or day=='':
        return False
    monthDate=[0,31,28,31,30,31,30,31,31,30,31,30,31]
    if int(year)<0:
        return False
    if int(month)>12 or int(month)<=0:
        return False
    if int(day)<=0 or int(day)>monthDate[int(month)]:
        return False
    stdDate = datetime.datetime.strptime(inputDate, "%Y-%m-%d")
    if stdDate<=today:
        return False    #必须大于今天的日期
    return True

if __name__=="__main__":
    date=input()
    print(judgeDate(date))