import pymysql


def ConnDB():
    connect = pymysql.connect(
        host = '110.42.226.214',
        port = 3306,
        user = 'root',
        password = 'Dbddyyzsd233!',
        db = 'vaccine_project'
    )
    return connect