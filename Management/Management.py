import sys
import datetime

from PublicFunctions.GetDBConn import ConnDB
from PublicFunctions.DateJudgement import judgeDate
from PyQt5 import QtGui, QtWidgets, QtCore
from PyQt5.QtCore import *
from PyQt5.QtWidgets import QApplication, QMainWindow, QHeaderView, QMessageBox

from ManagementUI import Ui_MainWindow
import ManLicenseSearchUI as u2
import ManVacInfoSearchUI as u3
import ManProInfoSearchUI as u4
import ManVacOrdSearchUI as u5
import ManStoreSearchUI as u6
import ManWarehouseAreaUI as u7
import pymysql


class StartDesinger(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)

    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(669, 313)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(60, 0, 552, 146))
        self.label.setObjectName("label")
        self.lineEdit = QtWidgets.QLineEdit(self.centralwidget)
        self.lineEdit.setGeometry(QtCore.QRect(260, 150, 191, 31))
        self.lineEdit.setObjectName("lineEdit")
        self.label_2 = QtWidgets.QLabel(self.centralwidget)
        self.label_2.setGeometry(QtCore.QRect(180, 150, 60, 43))
        self.label_2.setObjectName("label_2")
        self.label_3 = QtWidgets.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(180, 196, 60, 43))
        self.label_3.setObjectName("label_3")
        self.lineEdit_2 = QtWidgets.QLineEdit(self.centralwidget)
        self.lineEdit_2.setGeometry(QtCore.QRect(260, 200, 191, 31))
        self.lineEdit_2.setObjectName("lineEdit_2")
        self.pushButton = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton.setGeometry(QtCore.QRect(290, 240, 93, 41))
        self.pushButton.setObjectName("pushButton")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 669, 26))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        self.pushButton.clicked.connect(MainWindow.Sing)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate

        MainWindow.setWindowTitle(_translate("MainWindow", "疫苗接种信息管理系统"))
        self.label.setText(_translate("MainWindow", ""))
        self.label_2.setText(_translate("MainWindow", "Photo"))
        self.label_3.setText(_translate("MainWindow", "TextLabel"))
        self.pushButton.setText(_translate("MainWindow", "登录"))
        self.label.setPixmap(QtGui.QPixmap("images/top.png"))
        self.label.setStyleSheet("{border-radius:20px;}")
        self.label_2.setPixmap(QtGui.QPixmap("images/UserName.png"))
        self.label_3.setPixmap(QtGui.QPixmap("images/Password.png"))

    def Sing(self):

        User = self.lineEdit.text()
        PasswordText = self.lineEdit_2.text()
        if len(PasswordText) < 6:
            QMessageBox.information(None, 'Error', '        密码必须为六位     ')
            return

        try:
            file = open('Admin/CaacUser' + User + '.txt', 'r')
        except Exception as e:
            QMessageBox.information(None, '登陆失败', '     查无此用户       ')
            return

        file.seek(6)
        MessageName = file.readline()
        Password = file.readline()
        Password = Password[10:]

        Judege = (User in MessageName)
        if Judege:
            Judege = (PasswordText in Password)
            if Judege:
                QMessageBox.information(None, '登陆成功', '     密码正确        ')
                win0.close()
                win.show()
            else:
                QMessageBox.information(None, '登陆失败', '       密码输入错误      ')
            return
        else:
            QMessageBox.information(None, '登陆失败', '     查无此用户       ')
            return


class SecondWindow(QMainWindow):
    def slot1(self):
        win2.close()

    def __init__(self, parent = None):
        super(SecondWindow, self).__init__(parent)
        self.ui = u2.Ui_MainWindow()
        self.ui.setupUi(self)
        # 注意,两个次窗口类里，用self.ui.pushButton，不能直接self.pushButton
        self.ui.pushButton.clicked.connect(self.SearchProduceLicense)

    def SearchProduceLicense(self):
        # 查看生产商的生产许可证
        conn = ConnDB()
        cursor = conn.cursor()
        # TODO:从前端窗口获取信息，生产商ID可以存在也可以为空
        ProducerNo = self.ui.lineEdit.text()
        SearchLicenseByProducer = "SELECT * FROM `ProducerLicense` WHERE ProducerNo=%s"
        SearchAllLicense = "SELECT * FROM `ProducerLicense`"
        if ProducerNo != '':
            cursor.execute(SearchLicenseByProducer, ProducerNo)
            licenseData = cursor.fetchall()
            print(licenseData)
            # TODO:在前端窗口打印查询结果
        else:
            cursor.execute(SearchAllLicense)
            licenseData = cursor.fetchall()
            print(licenseData)
            # TODO:在前端窗口打印查询结果
        if licenseData:
            x = 0
            for i in licenseData:
                y = 0
                for j in i:
                    self.ui.tableWidget.setItem(x, y, QtWidgets.QTableWidgetItem(str(licenseData[x][y])))
                    y = y + 1
                x = x + 1
        else:
            QMessageBox.information(self, '没有信息', '没有查询到信息！', QMessageBox.Close)
        cursor.close()
        conn.close()


class ThirdWindow(QMainWindow):
    def slot1(self):
        win3.close()

    def __init__(self, parent = None):
        super(ThirdWindow, self).__init__(parent)
        self.ui = u3.Ui_MainWindow()
        self.ui.setupUi(self)
        # 注意,两个次窗口类里，用self.ui.pushButton，不能直接self.pushButton
        self.ui.pushButton_3.clicked.connect(self.SearchVaccinationInfo)

    def SearchVaccinationInfo(self):
        # 查看接种信息
        conn = ConnDB()
        cursor = conn.cursor()
        # TODO:从前端窗口获取信息，三种信息可以存在也可以为空
        PersonID = self.ui.lineEdit.text()
        HospitalINo = self.ui.lineEdit_2.text()
        VaccineNo = self.ui.lineEdit_3.text()
        SearchByPerson = "SELECT * FROM `VaccinationInfo` WHERE PersonID=%s"
        SearchByHospital = "SELECT * FROM `VaccinationInfo` WHERE HospitalNo=%s"
        SearchByPersonAndHospital = "SELECT * FROM `VaccinationInfo` WHERE PersonID=%s AND HospitalNo=%s"
        SearchByVaccine = "SELECT * FROM `VaccinationInfo` WHERE VaccineNo=%s"
        SearchByPersonAndVaccine = "SELECT * FROM `VaccinationInfo` WHERE PersonID=%s and VaccineNo=%s"
        SearchByHospitalAndVaccine = "SELECT * FROM `VaccinationInfo` WHERE HospitalNo=%s and VaccineNo=%s"
        SearchByAll = "SELECT * FROM `VaccinationInfo` WHERE PersonID=%s and HospitalNo=%s and VaccineNo=%s"
        DefaultSearch = "SELECT * FROM `VaccinationInfo`"

        if PersonID != '' and HospitalINo != '' and VaccineNo != '':
            cursor.executemany(SearchByAll, [(PersonID, HospitalINo, VaccineNo)])
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        elif PersonID != '' and HospitalINo != '':
            cursor.executemany(SearchByPersonAndHospital, [(PersonID, HospitalINo)])
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        elif HospitalINo != '' and VaccineNo != '':
            cursor.executemany(SearchByHospitalAndVaccine, [(HospitalINo, VaccineNo)])
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        elif PersonID != '' and VaccineNo != '':
            cursor.executemany(SearchByPersonAndVaccine, [(PersonID, VaccineNo)])
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        elif PersonID != '':
            cursor.execute(SearchByPerson, PersonID)
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        elif HospitalINo != '':
            cursor.execute(SearchByHospital, HospitalINo)
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        elif VaccineNo != '':
            cursor.execute(SearchByVaccine, VaccineNo)
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        else:
            cursor.execute(DefaultSearch)
            infoData = cursor.fetchall()
            print(infoData)
            # TODO:在前端窗口打印查询结果
        if infoData:
            x = 0
            for i in infoData:
                y = 0
                for j in i:
                    self.ui.tableWidget.setItem(x, y, QtWidgets.QTableWidgetItem(str(infoData[x][y])))
                    y = y + 1
                x = x + 1
        else:
            QMessageBox.information(self, '没有信息', '没有查询到信息！', QMessageBox.Close)
        cursor.close()
        conn.cursor()


class FourthWindow(QMainWindow):
    def slot1(self):
        win4.close()

    def __init__(self, parent = None):
        super(FourthWindow, self).__init__(parent)
        self.ui = u4.Ui_MainWindow()
        self.ui.setupUi(self)
        # 注意,两个次窗口类里，用self.ui.pushButton，不能直接self.pushButton
        self.ui.pushButton.clicked.connect(self.SearchProduceInfo)

    def SearchProduceInfo(self):
        # 查看生产记录
        conn = ConnDB()
        cursor = conn.cursor()
        ProducerNo = self.ui.lineEdit.text()
        SearchByProducer = "SELECT * FROM `Produce` WHERE ProducerNo=%s"
        SearchAll = "SELECT * FROM `Produce`"
        if ProducerNo != '':
            cursor.execute(SearchByProducer, ProducerNo)
            ProducerData = cursor.fetchall()
            # TODO:在前端表格输出查询结果
            print(ProducerData)
        else:
            cursor.execute(SearchAll)
            ProducerData = cursor.fetchall()
            # TODO:在前端表格输出查询结果
            print(ProducerData)
        if ProducerData:
            x = 0
            for i in ProducerData:
                y = 0
                for j in i:
                    self.ui.tableWidget.setItem(x, y, QtWidgets.QTableWidgetItem(str(ProducerData[x][y])))
                    y = y + 1
                x = x + 1
        else:
            QMessageBox.information(self, '没有信息', '没有查询到信息！', QMessageBox.Close)
        cursor.close()
        conn.close()


class FifthWindow(QMainWindow):
    def slot1(self):
        win5.close()

    def __init__(self, parent = None):
        super(FifthWindow, self).__init__(parent)
        self.ui = u5.Ui_MainWindow()
        self.ui.setupUi(self)
        # 注意,两个次窗口类里，用self.ui.pushButton，不能直接self.pushButton
        self.ui.pushButton.clicked.connect(self.SearchVaccineOrder)

    def SearchVaccineOrder(self):
        # 查看疫苗订单
        conn = ConnDB()
        cursor = conn.cursor()
        # TODO:从前端输入以下信息(可选)
        HospitalNo = self.ui.lineEdit.text()
        ProducerNo = self.ui.lineEdit_2.text()

        SearchByHospital = "SELECT * FROM `VaccineOrder` WHERE HospitalNo=%s"
        SearchByProducer = "SELECT * FROM `VaccineOrder` WHERE ProducerNo=%s"
        SearchByHospitalAndProducer = "SELECT * FROM `VaccineOrder` WHERE HospitalNo=%s AND ProducerNo=%s"
        DefaultSearch = "SELECT * FROM `VaccineOrder`"
        if HospitalNo != '' and ProducerNo != '':
            cursor.executemany(SearchByHospitalAndProducer, [(HospitalNo, ProducerNo)])
            vaccineOrderData = cursor.fetchall()
            print(vaccineOrderData)
            # TODO:前端表格中输出查询结果
        elif HospitalNo != '':
            cursor.execute(SearchByHospital, HospitalNo)
            vaccineOrderData = cursor.fetchall()
            print(vaccineOrderData)
            # TODO:前端表格中输出查询结果
        elif ProducerNo != '':
            cursor.execute(SearchByProducer, ProducerNo)
            vaccineOrderData = cursor.fetchall()
            print(vaccineOrderData)
            # TODO:前端表格中输出查询结果
        else:
            cursor.execute(DefaultSearch)
            vaccineOrderData = cursor.fetchall()
            print(vaccineOrderData)
        if vaccineOrderData:
            x = 0
            for i in vaccineOrderData:
                y = 0
                for j in i:
                    self.ui.tableWidget.setItem(x, y, QtWidgets.QTableWidgetItem(str(vaccineOrderData[x][y])))
                    y = y + 1
                x = x + 1
        else:
            QMessageBox.information(self, '没有信息', '没有查询到信息！', QMessageBox.Close)
        cursor.close()
        conn.close()


class SixthWindow(QMainWindow):
    def slot1(self):
        win6.close()

    def __init__(self, parent = None):
        super(SixthWindow, self).__init__(parent)
        self.ui = u6.Ui_MainWindow()
        self.ui.setupUi(self)
        # 注意,两个次窗口类里，用self.ui.pushButton，不能直接self.pushButton
        self.ui.pushButton.clicked.connect(self.SearchInStorageInfo)

    def SearchInStorageInfo(self):
        # 查看疫苗入库记录
        conn = ConnDB()
        cursor = conn.cursor()
        # TODO:从前端输入医院ID(可选)
        HospitalNo = self.ui.lineEdit.text()
        SearchInStorageByHospital = "SELECT * FROM `InStorage` WHERE HospitalNo=%s"
        SearchAll = "SELECT * FROM `InStorage`"
        if HospitalNo != '':
            cursor.execute(SearchInStorageByHospital, HospitalNo)
            InStorageData = cursor.fetchall()
            print(InStorageData)
            # TODO:前端表格中输出查询结果
        else:
            cursor.execute(SearchAll)
            InStorageData = cursor.fetchall()
            print(InStorageData)
            # TODO:前端表格中输出查询结果

        if InStorageData:
            x = 0
            for i in InStorageData:
                y = 0
                for j in i:
                    self.ui.tableWidget.setItem(x, y, QtWidgets.QTableWidgetItem(str(InStorageData[x][y])))
                    y = y + 1
                x = x + 1
        else:
            QMessageBox.information(self, '没有信息', '没有查询到信息！', QMessageBox.Close)
        cursor.close()
        conn.close()


class SeventhWindow(QMainWindow):
    def slot1(self):
        win7.close()

    def __init__(self, parent = None):
        super(SeventhWindow, self).__init__(parent)
        self.ui = u7.Ui_MainWindow()
        self.ui.setupUi(self)
        # 注意,两个次窗口类里，用self.ui.pushButton，不能直接self.pushButton
        self.ui.pushButton.clicked.connect(self.GetWarehouseArea)

    def GetWarehouseArea(self):
        # 查询仓库存储关系信息
        conn = ConnDB()
        cursor = conn.cursor()
        # TODO:从前端输入医院ID(可选)
        HospitalNo = self.ui.lineEdit.text()

        GetWarehouseByHospital = "SELECT * FROM `WarehouseArea` WHERE HospitalNo=%s"
        GetWarehouseAll = "SELECT * FROM `WarehouseArea`"
        if HospitalNo != '':
            cursor.execute(GetWarehouseByHospital, HospitalNo)
            warehouseData = cursor.fetchall()
            print(warehouseData)
            # TODO:前端表格输出查询结果
        else:
            cursor.execute(GetWarehouseAll)
            warehouseData = cursor.fetchall()
            print(warehouseData)
            # TODO:前端表格输出查询结果

        if warehouseData:
            x = 0
            for i in warehouseData:
                y = 0
                for j in i:
                    self.ui.tableWidget.setItem(x, y, QtWidgets.QTableWidgetItem(str(warehouseData[x][y])))
                    y = y + 1
                x = x + 1

        else:
             QMessageBox.information(self, '没有信息', '没有查询到信息！', QMessageBox.Close)

        cursor.close()
        conn.close()


class MyMainWindow(QMainWindow, Ui_MainWindow):
    def slot1(self):
        win2.show()

    def slot2(self):
        win3.show()

    def slot3(self):
        win4.show()

    def slot4(self):
        win5.show()

    def slot5(self):
        win6.show()

    def slot6(self):
        win7.show()

    def __init__(self):
        super(MyMainWindow, self).__init__()
        self.setupUi(self)
        # 【读取】功能
        self.pushButton.clicked.connect(self.GiveProducerLicense)

    def GiveProducerLicense(self):
        # 颁发生产许可证
        # TODO:从前端获取信息
        conn = ConnDB()
        cursor = conn.cursor()
        ProducerFlag=False
        SupFlag=False
        SupNo = self.lineEdit.text()
        ProducerNo = self.lineEdit_2.text()
        LicenseDate = self.lineEdit_3.text()
        LicenseNo = 'L' + SupNo[1:3] + str(datetime.date.today().year)
        FindAllProducerSql="SELECT ProducerNo FROM `Producer`"
        FindAllSupSql="SELECT SupNo FROM `SupervisionDepart`"
        cursor.execute(FindAllProducerSql)
        AllProducer=cursor.fetchall()
        cursor.execute(FindAllSupSql)
        AllSup=cursor.fetchall()
        #判断管理机构编号是否合法
        for tmp in AllSup:
            if SupNo in tmp:
                SupFlag=True

        if SupFlag==False:
            #非法情况
            QMessageBox.information(self, '失败', '管理机构ID非法！', QMessageBox.Close)
            cursor.close()
            conn.close()
            return
        #判断生产商编号是否合法
        for tmp in AllProducer:
            if ProducerNo in tmp:
                ProducerFlag=True

        if ProducerFlag==False:
            #非法情况
            QMessageBox.information(self, '失败', '生产商编号不存在！', QMessageBox.Close)
            cursor.close()
            conn.close()
            return

        #自动编号
        cursor.execute("SELECT LicenseNo FROM `ProducerLicense` WHERE SupNo=%s ORDER BY LicenseNo desc limit 1", SupNo)
        NowLicenseNo=cursor.fetchall()
        if NowLicenseNo:
            NowLicenseNo = int(cursor.fetchall()[0][0][7:])
            print(NowLicenseNo)
        else:
            NowLicenseNo=0
        if NowLicenseNo + 1 < 10:
            LicenseNo = LicenseNo + '00' + str(NowLicenseNo + 1)
        elif int(NowLicenseNo + 1) < 100:
            LicenseNo = LicenseNo + '0' + str(NowLicenseNo + 1)
        else:
            LicenseNo = LicenseNo + str(NowLicenseNo + 1)
        InsertLicense = "INSERT INTO `ProducerLicense` VALUES(%s,%s,%s,%s)"
        #日期判断 合法则颁发 否则失败
        if judgeDate(LicenseDate):
            cursor.executemany(InsertLicense, [(LicenseNo, SupNo, ProducerNo, LicenseDate)])
            conn.commit()
            print('颁发成功!')
            # TODO:前端弹出MessageBox提示颁发成功
            QMessageBox.information(self, '成功', '生产许可证颁发成功！', QMessageBox.Close)
        else:
            QMessageBox.information(self, '失败', '请检查输入的日期是否合法！', QMessageBox.Close)
        cursor.close()
        conn.close()


if __name__ == "__main__":
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)
    win0 = StartDesinger()
    win0.show()
    win = MyMainWindow()
    win2 = SecondWindow()
    win3 = ThirdWindow()
    win4 = FourthWindow()
    win5 = FifthWindow()
    win6 = SixthWindow()
    win7 = SeventhWindow()
    sys.exit(app.exec())
