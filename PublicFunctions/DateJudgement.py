import datetime
def judgeDate(inputDate):
    today=datetime.datetime.today()
    [year,month,day]=inputDate.split('-')
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
