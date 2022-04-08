/*
 Navicat Premium Data Transfer

 Source Server         : Zen
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 110.42.226.214:3306
 Source Schema         : vaccine_project

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 07/04/2022 20:57:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Hospital
-- ----------------------------
DROP TABLE IF EXISTS `Hospital`;
CREATE TABLE `Hospital`  (
  `HospitalNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医院编号',
  `HospitalName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '医院名称',
  PRIMARY KEY (`HospitalNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Hospital
-- ----------------------------
INSERT INTO `Hospital` VALUES ('H0A2021001', 'A省人民医院');
INSERT INTO `Hospital` VALUES ('H0A2021002', 'A省g市人民医院');
INSERT INTO `Hospital` VALUES ('H0B2021001', 'B省k医科大学一院');
INSERT INTO `Hospital` VALUES ('H0B2021002', 'B省k医科大学二院');
INSERT INTO `Hospital` VALUES ('H0C2021001', 'C市人民医院');

-- ----------------------------
-- Table structure for InStorage
-- ----------------------------
DROP TABLE IF EXISTS `InStorage`;
CREATE TABLE `InStorage`  (
  `HospitalNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医院编号',
  `WarehouseNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库编号',
  `InAmount` int(0) NOT NULL COMMENT '入库量',
  `InTime` datetime(0) NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`HospitalNo`, `WarehouseNo`, `InAmount`, `InTime`) USING BTREE,
  INDEX `FK_InStorage_Warehouse`(`WarehouseNo`) USING BTREE,
  CONSTRAINT `FK_InStorage_Hospital` FOREIGN KEY (`HospitalNo`) REFERENCES `Hospital` (`HospitalNo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_InStorage_Warehouse` FOREIGN KEY (`WarehouseNo`) REFERENCES `Warehouse` (`WarehouseNo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '入库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of InStorage
-- ----------------------------
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021001', 2, '2022-03-25 10:02:43');
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021001', 5, '2021-09-02 00:00:00');
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021001', 10, '2022-03-15 10:10:46');
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021003', 5, '2022-04-03 21:52:27');
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021003', 10, '2022-03-15 09:44:35');
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021003', 10, '2022-04-03 21:42:13');
INSERT INTO `InStorage` VALUES ('H0A2021001', 'WA12021003', 20, '2022-03-15 09:45:02');

-- ----------------------------
-- Table structure for Person
-- ----------------------------
DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person`  (
  `PersonID` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证件号码',
  `PersonName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `Age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `ResiAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住地',
  `PersonLoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `ContactInfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`PersonID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户（接种者）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Person
-- ----------------------------
INSERT INTO `Person` VALUES ('100001200001010000', '张三', '男', 18, 'A省k市', 'F区O街道100号', '12800000001');
INSERT INTO `Person` VALUES ('100001200001010001', '李四', '男', 19, 'A省k市', 'F区O街道101号', '12800000002');
INSERT INTO `Person` VALUES ('100001200001010002', '王五', '男', 20, 'A省k市', 'F区O街道102号', '12800000003');
INSERT INTO `Person` VALUES ('100001200001010003', '李小明', '男', 21, 'A省k市', 'F区O街道103号', '12800000004');
INSERT INTO `Person` VALUES ('100001200001010004', '王红', '女', 22, 'A省k市', 'F区O街道104号', '12800000005');
INSERT INTO `Person` VALUES ('100001200001010005', '李和平', '男', 23, 'A省k市', 'F区O街道105号', '12800000006');
INSERT INTO `Person` VALUES ('100001200001010006', '刘宏亮', '男', 24, 'A省k市', 'F区O街道106号', '12800000007');
INSERT INTO `Person` VALUES ('100001200001010007', '赵名', '女', 25, 'A省k市', 'F区O街道107号', '12800000008');
INSERT INTO `Person` VALUES ('100001200001010008', '王小红', '女', 26, 'A省m市', 'E区U街道100号', '12800000009');
INSERT INTO `Person` VALUES ('100001200001010009', '吴小', '女', 27, 'A省m市', 'E区U街道101号', '12800000010');
INSERT INTO `Person` VALUES ('100001200001010010', '丁玉应', '男', 28, 'A省m市', 'E区U街道102号', '12800000011');
INSERT INTO `Person` VALUES ('100001200001010011', '张共可', '女', 29, 'A省m市', 'E区U街道103号', '12800000012');
INSERT INTO `Person` VALUES ('100001200001010012', '张林', '男', 30, 'A省m市', 'E区U街道104号', '12800000013');
INSERT INTO `Person` VALUES ('100001200001010013', '吴琳琳', '女', 31, 'B省g市', 'K区I街道100号', '12800000014');
INSERT INTO `Person` VALUES ('100001200001010014', '周宁', '男', 32, 'B省g市', 'K区I街道101号', '12800000015');
INSERT INTO `Person` VALUES ('100001200001010015', '王平', '男', 33, 'B省g市', 'K区I街道102号', '12800000016');
INSERT INTO `Person` VALUES ('100001200001010016', '王力', '男', 34, 'B省h市', 'M区J街道200号', '12800000017');
INSERT INTO `Person` VALUES ('100001200001010017', '李维', '男', 35, 'C市', 'L区M街道200号', '12800000018');
INSERT INTO `Person` VALUES ('100001200001010018', '李晓玲', '女', 36, 'C市', 'L区M街道201号', '12800000019');
INSERT INTO `Person` VALUES ('100001200001010019', '张志军', '男', 37, 'C市', 'L区M街道202号', '12800000020');
INSERT INTO `Person` VALUES ('100001200001010020', '林美', '女', 38, 'C市', 'L区M街道203号', '12800000021');
INSERT INTO `Person` VALUES ('100001200001010021', '丁伟力', '男', 39, 'C市', 'L区M街道204号', '12800000022');
INSERT INTO `Person` VALUES ('100001200001010022', '王建宁', '男', 40, 'C市', 'L区M街道205号', '12800000023');

-- ----------------------------
-- Table structure for Produce
-- ----------------------------
DROP TABLE IF EXISTS `Produce`;
CREATE TABLE `Produce`  (
  `ProducerNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产商编号',
  `VaccineName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疫苗名称',
  `ProduceAmount` int(0) NOT NULL COMMENT '产量',
  `ProduceTime` datetime(0) NOT NULL COMMENT '生产时间',
  PRIMARY KEY (`ProducerNo`, `VaccineName`, `ProduceAmount`, `ProduceTime`) USING BTREE,
  INDEX `FK_Produce_Vaccine`(`VaccineName`) USING BTREE,
  CONSTRAINT `FK_Produce_Producer` FOREIGN KEY (`ProducerNo`) REFERENCES `Producer` (`ProducerNo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生产' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Produce
-- ----------------------------
INSERT INTO `Produce` VALUES ('P0A2021001', 'test', 10, '2022-03-15 10:03:45');
INSERT INTO `Produce` VALUES ('P0A2021001', 'test', 100, '2022-03-07 00:00:00');
INSERT INTO `Produce` VALUES ('P0A2021001', '乙肝疫苗', 10, '2022-03-15 10:08:23');
INSERT INTO `Produce` VALUES ('P0A2021001', '乙肝疫苗', 10, '2022-04-03 21:58:30');
INSERT INTO `Produce` VALUES ('P0A2021001', '乙肝疫苗', 20, '2022-01-01 00:00:00');
INSERT INTO `Produce` VALUES ('P0B2021001', '乙肝疫苗', 5, '2022-03-15 15:35:45');
INSERT INTO `Produce` VALUES ('P0A2021001', '测试', 10, '2022-03-07 00:00:00');

-- ----------------------------
-- Table structure for Producer
-- ----------------------------
DROP TABLE IF EXISTS `Producer`;
CREATE TABLE `Producer`  (
  `ProducerNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产商编号',
  `ProducerName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产商名称',
  `ProducerLoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产地',
  PRIMARY KEY (`ProducerNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生产商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Producer
-- ----------------------------
INSERT INTO `Producer` VALUES ('P0A2021001', 'A生物科技公司', 'A省f市');
INSERT INTO `Producer` VALUES ('P0A2021002', 'B医药科技公司', 'A省g市');
INSERT INTO `Producer` VALUES ('P0B2021001', 'C生物制品所', 'B省k市');
INSERT INTO `Producer` VALUES ('P0B2021002', 'D生物制品所', 'B省m市');
INSERT INTO `Producer` VALUES ('P0C2021001', 'E生物制品所', 'C市');
INSERT INTO `Producer` VALUES ('P0C2021002', 'F制药公司', 'C市');

-- ----------------------------
-- Table structure for ProducerLicense
-- ----------------------------
DROP TABLE IF EXISTS `ProducerLicense`;
CREATE TABLE `ProducerLicense`  (
  `LicenseNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产许可中编号',
  `SupNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监管机构编号',
  `ProducerNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产商编号',
  `LicenseDate` date NULL DEFAULT NULL COMMENT '生产许可证期限',
  PRIMARY KEY (`LicenseNo`) USING BTREE,
  INDEX `FK_ProduceLicense_SupervisionDepart`(`SupNo`) USING BTREE,
  INDEX `FK_ProduceLicense_Producer`(`ProducerNo`) USING BTREE,
  CONSTRAINT `FK_ProduceLicense_Producer` FOREIGN KEY (`ProducerNo`) REFERENCES `Producer` (`ProducerNo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ProduceLicense_SupervisionDepart` FOREIGN KEY (`SupNo`) REFERENCES `SupervisionDepart` (`SupNo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生产许可' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ProducerLicense
-- ----------------------------
INSERT INTO `ProducerLicense` VALUES ('L0A2021001', 'S0A2021001', 'P0A2021001', '2022-04-08');
INSERT INTO `ProducerLicense` VALUES ('L0A2021004', 'S0A2021001', 'P0B2021001', '2021-12-31');
INSERT INTO `ProducerLicense` VALUES ('L0A2021005', 'S0C2021001', 'P0C2021001', '2021-12-25');
INSERT INTO `ProducerLicense` VALUES ('L0A2022002', 'S0A2021001', 'P0B2021001', '2022-05-01');
INSERT INTO `ProducerLicense` VALUES ('L0A2022003', 'S0A2021001', 'P0A2021002', '2022-10-01');
INSERT INTO `ProducerLicense` VALUES ('L0A2022004', 'S0A2021001', 'P0B2021001', '2023-01-01');
INSERT INTO `ProducerLicense` VALUES ('L0A2022005', 'S0A2021001', 'P0C2021001', '2023-01-01');
INSERT INTO `ProducerLicense` VALUES ('L0A2022006', 'S0A2021001', 'P0C2021001', '2022-12-31');
INSERT INTO `ProducerLicense` VALUES ('L0B2022001', 'S0B2021001', 'P0C2021002', '2023-01-01');

-- ----------------------------
-- Table structure for SupervisionDepart
-- ----------------------------
DROP TABLE IF EXISTS `SupervisionDepart`;
CREATE TABLE `SupervisionDepart`  (
  `SupNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监管机构编号',
  `SupName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监管机构名称',
  `SupLoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管辖区域',
  PRIMARY KEY (`SupNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '监管机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SupervisionDepart
-- ----------------------------
INSERT INTO `SupervisionDepart` VALUES ('S0A2021001', 'A省药品监督管理局', 'A省');
INSERT INTO `SupervisionDepart` VALUES ('S0B2021001', 'B省药品监督管理局', 'B省');
INSERT INTO `SupervisionDepart` VALUES ('S0C2021001', 'C省药品监督管理局', 'C市');

-- ----------------------------
-- Table structure for VaccinationInfo
-- ----------------------------
DROP TABLE IF EXISTS `VaccinationInfo`;
CREATE TABLE `VaccinationInfo`  (
  `InfoNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '信息编号',
  `PersonID` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预约人ID',
  `HospitalNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接种单位编号',
  `VaccineNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '疫苗编号',
  `Batch` tinyint(0) NULL DEFAULT NULL COMMENT '接种剂次',
  `AppointTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预约日期',
  `VaccinationTime` datetime(0) NULL DEFAULT NULL COMMENT '接种时间',
  `FinishFlag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完成情况',
  PRIMARY KEY (`InfoNo`) USING BTREE,
  INDEX `FK_VaccinationInfo_Hospital`(`HospitalNo`) USING BTREE,
  INDEX `FK_VaccinationInfo_Vaccine`(`VaccineNo`) USING BTREE,
  INDEX `PersonID_Index`(`PersonID`) USING BTREE,
  CONSTRAINT `FK_VaccinationInfo_Hospital` FOREIGN KEY (`HospitalNo`) REFERENCES `Hospital` (`HospitalNo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VaccinationInfo_Person` FOREIGN KEY (`PersonID`) REFERENCES `Person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VaccinationInfo_Vaccine` FOREIGN KEY (`VaccineNo`) REFERENCES `Vaccine` (`VaccineNo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '接种信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of VaccinationInfo
-- ----------------------------
INSERT INTO `VaccinationInfo` VALUES ('Info210001', '100001200001010000', 'H0A2021001', 'V0A2021001', 1, '2021-09-25', '2021-09-25 11:00:00', '已接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210002', '100001200001010000', 'H0A2021001', 'V0A2021002', 2, '2022-3-15', '2022-03-15 12:25:00', '已接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210003', '100001200001010000', 'H0A2021001', 'V0A2021003', 3, '2022-3-16', '2022-03-13 15:40:00', '已接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210004', '100001200001010001', 'H0A2021001', 'V0A2021004', 1, '2022-4-1', '2022-04-01 10:30:00', '已接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210005', '100001200001010001', 'H0A2021001', 'V0A2021005', 2, '2022-10-1', '2022-02-28 11:30:00', '已接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210006', '100001200001010002', 'H0A2021001', 'V0A2022126', 1, '2022-5-1', '2022-05-01 12:30:00', '已接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210007', '100001200001010003', 'H0A2021001', 'V0A2022127', 1, '2022-4-3', NULL, '未接种');
INSERT INTO `VaccinationInfo` VALUES ('Info210008', '100001200001010004', 'H0A2021001', 'V0A2022128', 1, '2022-4-31', NULL, '未接种');

-- ----------------------------
-- Table structure for Vaccine
-- ----------------------------
DROP TABLE IF EXISTS `Vaccine`;
CREATE TABLE `Vaccine`  (
  `VaccineNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疫苗编号',
  `VaccineName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疫苗名称',
  `HospitalNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属医院编号',
  `ProducerNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产商编号',
  `ProductionDate` date NULL DEFAULT NULL COMMENT '生产日期',
  `ExpirationDate` date NULL DEFAULT NULL COMMENT '保质期',
  `Flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '疫苗使用情况',
  `CountFlag` tinyint(0) NULL DEFAULT NULL COMMENT '统计标识',
  PRIMARY KEY (`VaccineNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '疫苗' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Vaccine
-- ----------------------------
INSERT INTO `Vaccine` VALUES ('V0A2021001', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2021-09-01', '2022-09-01', '已接种', 2);
INSERT INTO `Vaccine` VALUES ('V0A2021002', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2021-09-01', '2022-09-01', '已接种', 2);
INSERT INTO `Vaccine` VALUES ('V0A2021003', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2021-09-01', '2022-09-01', '已接种', 2);
INSERT INTO `Vaccine` VALUES ('V0A2021004', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2021-09-01', '2022-09-01', '已接种', 2);
INSERT INTO `Vaccine` VALUES ('V0A2021005', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2021-09-01', '2022-09-01', '已接种', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022006', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022007', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022008', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022009', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022010', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022011', 'test', 'H0A2021001', 'P0A2021002', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022012', 'test', 'H0A2021001', 'P0A2021002', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022013', 'test', 'H0A2021001', 'P0A2021002', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022014', 'test', 'H0A2021001', 'P0A2021002', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022015', 'test', 'H0A2021001', 'P0A2021002', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022016', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022017', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022018', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022019', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022020', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022021', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022022', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022023', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022024', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022025', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022026', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022027', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022028', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022029', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022030', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022031', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022032', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022033', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022034', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022035', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022036', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022037', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022038', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022039', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022040', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022041', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022042', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022043', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022044', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022045', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022046', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022047', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022048', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022049', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022050', 'test', 'H0A2021001', 'P0A2021001', '2022-03-07', '2023-03-07', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022051', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022052', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022053', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022054', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022055', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022056', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022057', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022058', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022059', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022060', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022061', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022062', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022063', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022064', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022065', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022066', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022067', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022068', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022069', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022070', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022071', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022072', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022073', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022074', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022075', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022076', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022077', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022078', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022079', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022080', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022081', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022082', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022083', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022084', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022085', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022086', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022087', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022088', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022089', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022090', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022091', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022092', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022093', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022094', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022095', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022096', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022097', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022098', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022099', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022100', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022101', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022102', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022103', 'test', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022104', 'test', '无', 'P0A2021002', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022105', 'test', '无', 'P0A2021002', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022106', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022107', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022108', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022109', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022110', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022111', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022112', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022113', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022114', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022115', '测试', '无', 'P0A2021001', '2022-03-07', '2023-03-07', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022116', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022117', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022118', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022119', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022120', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022121', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022122', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022123', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022124', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022125', 'test', '无', 'P0A2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022126', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '已接种', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022127', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '已占用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022128', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '已占用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022129', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022130', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022131', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022132', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022133', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022134', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022135', '乙肝疫苗', 'H0A2021001', 'P0A2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0A2022136', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022137', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022138', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022139', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022140', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022141', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022142', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022143', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022144', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0A2022145', '乙肝疫苗', '无', 'P0A2021001', '2022-04-03', '2023-04-03', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0B2022002', '乙肝疫苗', 'H0A2021001', 'P0B2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0B2022003', '乙肝疫苗', 'H0A2021001', 'P0B2021001', '2022-03-15', '2023-03-15', '未使用', 2);
INSERT INTO `Vaccine` VALUES ('V0B2022004', '乙肝疫苗', '无', 'P0B2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0B2022005', '乙肝疫苗', '无', 'P0B2021001', '2022-03-15', '2023-03-15', NULL, NULL);
INSERT INTO `Vaccine` VALUES ('V0B2022006', '乙肝疫苗', '无', 'P0B2021001', '2022-03-15', '2023-03-15', NULL, NULL);

-- ----------------------------
-- Table structure for VaccineOrder
-- ----------------------------
DROP TABLE IF EXISTS `VaccineOrder`;
CREATE TABLE `VaccineOrder`  (
  `HospitalNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医院编号',
  `ProducerNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产商编号',
  `VaccineName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疫苗名称',
  `OrderAmount` int(0) NOT NULL COMMENT '订购量',
  `OrderTime` datetime(0) NOT NULL COMMENT '订购日期',
  PRIMARY KEY (`HospitalNo`, `ProducerNo`, `VaccineName`, `OrderAmount`, `OrderTime`) USING BTREE,
  INDEX `FK_VaccineOrder_Producer`(`ProducerNo`) USING BTREE,
  CONSTRAINT `FK_VaccineOrder_Hospital` FOREIGN KEY (`HospitalNo`) REFERENCES `Hospital` (`HospitalNo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VaccineOrder_Producer` FOREIGN KEY (`ProducerNo`) REFERENCES `Producer` (`ProducerNo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订购疫苗' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of VaccineOrder
-- ----------------------------
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021001', 'test', 5, '2022-03-15 09:44:36');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021001', 'test', 5, '2022-04-03 21:52:28');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021001', 'test', 10, '2022-04-03 21:42:14');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021001', 'test', 20, '2022-03-15 09:45:03');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021001', '乙肝疫苗', 5, '2021-09-01 00:00:00');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021001', '乙肝疫苗', 10, '2022-03-15 10:10:46');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0A2021002', 'test', 5, '2022-03-15 09:44:36');
INSERT INTO `VaccineOrder` VALUES ('H0A2021001', 'P0B2021001', '乙肝疫苗', 2, '2022-03-25 10:02:43');

-- ----------------------------
-- Table structure for Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Warehouse`;
CREATE TABLE `Warehouse`  (
  `WarehouseNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库编号',
  `VaccineName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储疫苗名称',
  `WarehouseName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `Temperature` int(0) NULL DEFAULT NULL COMMENT '仓库温度',
  `Stock` int(0) NULL DEFAULT NULL COMMENT '库存量',
  PRIMARY KEY (`WarehouseNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医院仓库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Warehouse
-- ----------------------------
INSERT INTO `Warehouse` VALUES ('WA12021001', '乙肝疫苗', 'A省人民医院1仓库', 3, 1000);
INSERT INTO `Warehouse` VALUES ('WA12021002', '甲肝疫苗', 'A省人民医院2仓库', 4, 2000);
INSERT INTO `Warehouse` VALUES ('WA12021003', 'test', 'A省人民医院3仓库', 1, 2000);
INSERT INTO `Warehouse` VALUES ('WA12021004', '测试', 'A省人民医院4仓库', 3, 2000);
INSERT INTO `Warehouse` VALUES ('WA22021001', '卡介苗', 'A省g市人民医院1仓库', 2, 2500);
INSERT INTO `Warehouse` VALUES ('WB12021001', 'Covid19灭活', 'B省k医科大学一院2仓库', 5, 1500);
INSERT INTO `Warehouse` VALUES ('WB12021002', '乙肝疫苗', 'B省k医科大学一院2仓库', 3, 1800);
INSERT INTO `Warehouse` VALUES ('WB22021001', 'Covid19灭活', 'B省k医科大学二院1仓库', 2, 2000);
INSERT INTO `Warehouse` VALUES ('WC12021001', '甲肝疫苗', 'C市人民医院1仓库', 4, 5000);
INSERT INTO `Warehouse` VALUES ('WC12021002', '卡介苗', 'C市人民医院2仓库', 4, 2500);
INSERT INTO `Warehouse` VALUES ('WC12021003', 'Covid19腺病毒载体', 'C市人民医院3仓库', 3, 6000);

-- ----------------------------
-- Table structure for WarehouseArea
-- ----------------------------
DROP TABLE IF EXISTS `WarehouseArea`;
CREATE TABLE `WarehouseArea`  (
  `WarehouseNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '仓库编号',
  `HospitalNo` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医院编号',
  `VaccineName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储疫苗名称',
  PRIMARY KEY (`WarehouseNo`) USING BTREE,
  INDEX `FK_WarehouseArea_Hospital2`(`HospitalNo`) USING BTREE,
  CONSTRAINT `FK_WarehouseArea_Hospital2` FOREIGN KEY (`HospitalNo`) REFERENCES `Hospital` (`HospitalNo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_WarehouseArea_Warehouse2` FOREIGN KEY (`WarehouseNo`) REFERENCES `Warehouse` (`WarehouseNo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '仓库区域' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of WarehouseArea
-- ----------------------------
INSERT INTO `WarehouseArea` VALUES ('WA12021001', 'H0A2021001', '乙肝疫苗');
INSERT INTO `WarehouseArea` VALUES ('WA12021002', 'H0A2021001', '甲肝疫苗');
INSERT INTO `WarehouseArea` VALUES ('WA12021003', 'H0A2021001', 'test');
INSERT INTO `WarehouseArea` VALUES ('WA12021004', 'H0A2021001', '测试');
INSERT INTO `WarehouseArea` VALUES ('WA22021001', 'H0A2021002', '卡介苗');
INSERT INTO `WarehouseArea` VALUES ('WB12021001', 'H0B2021001', 'Covid19灭活');
INSERT INTO `WarehouseArea` VALUES ('WB12021002', 'H0B2021001', '乙肝疫苗');
INSERT INTO `WarehouseArea` VALUES ('WB22021001', 'H0B2021002', 'Covid19灭活');
INSERT INTO `WarehouseArea` VALUES ('WC12021001', 'H0C2021001', '甲肝疫苗');
INSERT INTO `WarehouseArea` VALUES ('WC12021002', 'H0C2021001', '卡介苗');
INSERT INTO `WarehouseArea` VALUES ('WC12021003', 'H0C2021001', 'Covid19腺病毒载体');

SET FOREIGN_KEY_CHECKS = 1;
