# VaccineProject——基于PyQt5的疫苗接种信息管理系统
Uploaded by Blank_z0 2022/3/25 10:55
## 依赖外部模块
Pymysql 1.0.2

PyQt 5

## 设计说明
共分为以下四种用户

+ Supervision Department——管理机构用户
+ Hospital User——医院用户
+ Producer User——生产商用户
+ Peroson User——个人用户
## 代码架构说明

### 公用函数

* 代码位置：PublicFunctions文件夹下

* GetDBConn.py

  连接数据库的函数文件

* DateJudgement.py

  判断日期合法性的函数

### 个人用户

* 代码位置：Person文件夹下

#### 启动位置

Person.py

包含全部业务函数，函数说明如下：

| **函数名**               | **语义**                     |
| ------------------------ | ---------------------------- |
| SearchVaccinationinfo    | 查询全部的接种和预约信息     |
| SubmitNewVaccinationInfo | 提交预约记录                 |
| SearchHospital           | 子函数，查询所有可接种的医院 |
| SearchPersonInfo         | 查询个人信息                 |

#### UI文件

* PersonInfo.py

  登录进入的主界面，可以查询个人信息，跳转其它界面

* SearchInfo.py

  查询接种、预约信息的界面

* MakeAppointment.py

  提交接种预约的界面

### 医院用户

* 代码位置：Hospital文件夹下

#### 启动位置

Hospital.py

包含全部业务函数，函数说明如下：

| **函数名**            | **语义**                     |
| --------------------- | ---------------------------- |
| UpdateVaccinationInfo | 更新接种信息                 |
| GetWarehouseArea      | 查询本院的仓库存储信息       |
| GetInStorageData      | 查询本院的疫苗入库信息       |
| GetVaccineOrder       | 查询本院提交的订单信息       |
| BuyVaccine            | 购买疫苗的函数               |
| LastVaccine           | BuyVaccine的子函数，查询余量 |
| GetVaccinationInfo    | 查询本院的接种信息和预约信息 |

#### UI文件

* HospitalUI.py

  主界面，可以查询接种信息，跳转界面

* HospVacAppointmentUI.py

  更新接种预约的界面

* HospVacOrderUI.py

  查询疫苗购买订单的界面

* HospVacPurchaseUI.py

  进行疫苗购买的界面

* HospVacStorageUI.py

  查询疫苗入库信息的界面

* HospWarehouseInfoUI.py

  查询仓库存储信息的界面

### 生产商用户

* 代码位置：Producer文件夹下

#### 启动位置

Producer.py

包含全部业务函数，函数说明如下：

| **函数名**      | **语义**       |
| --------------- | -------------- |
| GetLicense      | 查询生产许可证 |
| GetVaccineOrder | 查看疫苗订单   |
| GetProduceData  | 查看生产信息   |
| ProduceVaccine  | 生产疫苗       |

#### UI文件

* ProducerInfoUI.py

  主界面，可查询生产许可证，跳转其它界面

* VacOrderUI.py

  查询疫苗订单的界面

* VacProSearchUI.py

  查询疫苗生产记录的界面

* VacProduceUI.py

  进行疫苗生产的界面

### 管理机构用户

* 代码位置：位于Management文件夹下

#### 启动位置

Management.py

包含全部业务函数，函数说明如下：

| **函数名**            | **语义**             |
| --------------------- | -------------------- |
| GiveProduceLicense    | 颁发生产许可证       |
| GetWarehouseArea      | 查看仓库存储关系     |
| SearchInStorageInfo   | 查看医院疫苗入库信息 |
| SearchVaccineOrder    | 查看疫苗订单信息     |
| SearchProduceInfo     | 查看疫苗生产信息     |
| SearchVaccinationInfo | 查看接种、预约信息   |
| SearchProduceLicense  | 查看生产许可证信息   |

#### UI文件

* ManagementUI.py

  主界面，可以颁发生产许可证，跳转其它界面

* ManLicenseSearchUI.py

  查询生产许可证的界面

* ManProInfoSearchUI.py

  查询疫苗生产信息的界面

* ManStoreSearchUI.py

  查询疫苗入库信息的界面

* ManVacInfoSearchUI.py

  接种和预约信息查询的界面

* ManVacOrdSearchUI.py

  疫苗订单查询的界面

* ManWarehouseAreaUI.py

  查询仓库存储信息的界面



## 用户名和密码设计

* 每个用户名和密码位于 xx用户/Admin 下，例如Hospital的用户名和密码位于 Hospital/Admin
* 每个用户的用户名和数据库中的编号一致
* Hospital Producer Management 用户的用户名和密码相同
* 所有Person用户的用户名为其PersonID，密码默认为123456



