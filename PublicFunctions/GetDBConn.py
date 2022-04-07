import pymysql


def ConnDB():
    connect = pymysql.connect(
        host = '127.0.0.1',
        port = 3306,
        user = 'root',
        password = '*******!',
        db = 'vaccine_project'
    )
    return connect