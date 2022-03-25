import sys
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *

from Hospital import MyMainWindow


# 对话框
class logindialog(QDialog):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setWindowTitle('登录界面')
        self.resize(200, 200)
        self.setFixedSize(self.width(), self.height())
        self.setWindowFlags(Qt.WindowCloseButtonHint)

        ###### 设置界面控件
        self.frame = QFrame(self)
        self.verticalLayout = QVBoxLayout(self.frame)

        self.lineEdit_account = QLineEdit()
        self.lineEdit_account.setPlaceholderText("请输入账号")
        self.verticalLayout.addWidget(self.lineEdit_account)

        self.lineEdit_password = QLineEdit()
        self.lineEdit_password.setPlaceholderText("请输入密码")
        self.verticalLayout.addWidget(self.lineEdit_password)

        self.pushButton_enter = QPushButton()
        self.pushButton_enter.setText("确定")
        self.verticalLayout.addWidget(self.pushButton_enter)

        self.pushButton_quit = QPushButton()
        self.pushButton_quit.setText("取消")
        self.verticalLayout.addWidget(self.pushButton_quit)

        ###### 绑定按钮事件
        self.pushButton_enter.clicked.connect(self.on_pushButton_enter_clicked)
        self.pushButton_quit.clicked.connect(QCoreApplication.instance().quit)

    def on_pushButton_enter_clicked(self):
        # 账号判断
        if self.lineEdit_account.text() == "":
            return

        # 密码判断
        if self.lineEdit_password.text() == "":
            return

        # 通过验证，关闭对话框并返回1
        self.accept()


# 程序入门
if __name__ == "__main__":
    app = QApplication(sys.argv)
    dialog = logindialog()
    if dialog.exec_() == QDialog.Accepted:
        the_window = MyMainWindow()
        the_window.show()
        sys.exit(app.exec_())
