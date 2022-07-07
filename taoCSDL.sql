<<<<<<< HEAD
# use webBanHang;
#
#
# DROP TABLE chiTietDH;
# DROP TABLE donHang;
# DROP TABLE taiKhoan;
# DROP TABLE sanPham;
# DROP TABLE loaiSanPham;
#
#
#
# CREATE TABLE taiKhoan (
#     idAccount INT(4) AUTO_INCREMENT PRIMARY KEY,
#     fullName VARCHAR(50) NOT NULL,
#     phoneNumber VARCHAR(10) NOT NULL UNIQUE,
#     passWord VARCHAR(20) NOT NULL,
#     role VARCHAR(10) DEFAULT 'user'
# );
#
# CREATE TABLE loaiSanPham (
#     idCategory INT(4) AUTO_INCREMENT PRIMARY KEY,
#     nameCategory VARCHAR(100) NOT NULL UNIQUE,
#     productQuantity INT DEFAULT 0
# );
#
#
# CREATE TABLE sanPham (
#     idProduct INT(4) AUTO_INCREMENT PRIMARY KEY,
#     idCategory INT(4) NOT NULL,
#     nameProduct VARCHAR(100) NOT NULL UNIQUE,
#     imgProduct TEXT NOT NULL,
#     price DOUBLE NOT NULL,
#     quantity INT DEFAULT 0,
#     CONSTRAINT fk_1 FOREIGN KEY(idCategory) REFERENCES loaiSanPham(idCategory)
# );
#
#
# CREATE TABLE donHang (
#     idOrder INT(4) AUTO_INCREMENT PRIMARY KEY,
#     idAcc INT(4) NOT NULL,
#     orderDate DATETIME DEFAULT NOW(),
#     statusDelivery VARCHAR(30) DEFAULT 'Đang giao',
#     address VARCHAR(200) NOT NULL,
#     totalValue DOUBLE DEFAULT 0,
#     CONSTRAINT fk_2 FOREIGN KEY (idAcc)
#         REFERENCES taiKhoan (idAccount)
# );
#
# CREATE TABLE chiTietDH(
# 	idOrder int(4) not null,
#     idProduct int(4) not null,
#     quantity int not null,
#     CONSTRAINT pk PRIMARY KEY(idOrder,idProduct),
#     CONSTRAINT fk_3 FOREIGN KEY(idOrder) REFERENCES donHang(idOrder),
# 	CONSTRAINT fk_4 FOREIGN KEY(idProduct) REFERENCES sanPham(idProduct)
#     );
# -- trigger don hang
# -- chen
# delimiter //
# DROP TRIGGER IF EXISTS after_insert_chiTietDH //
# CREATE TRIGGER after_insert_chiTietDH AFTER INSERT
# ON chiTietDH
# FOR EACH ROW
# BEGIN
# 	UPDATE donHang
#     SET totalValue=totalValue+ new.quantity*(SELECT price FROM sanPham WHERE idProduct=new.idProduct)
#     WHERE idOrder=new.idOrder;
# END//
# delimiter ;
# -- xoa
# delimiter //
# DROP TRIGGER IF EXISTS after_delete_chiTietDH //
# CREATE TRIGGER after_delete_chiTietDH AFTER DELETE
# ON chiTietDH
# FOR EACH ROW
# BEGIN
# 	UPDATE donHang
#     SET totalValue=totalValue- old.quantity*(SELECT price FROM sanPham WHERE idProduct=old.idProduct)
#     WHERE idOrder=old.idOrder;
# END//
# delimiter ;
#
#
# -- update
# delimiter //
# DROP TRIGGER IF EXISTS after_update_chiTietDH //
# CREATE TRIGGER after_update_chiTietDH AFTER UPDATE
# ON chiTietDH
# FOR EACH ROW
# BEGIN
# 	UPDATE donHang
#     SET totalValue=totalValue+(new.quantity-old.quantity)*(SELECT price FROM sanPham WHERE idProduct=old.idProduct)
#     WHERE idOrder=old.idOrder;
# END//
# delimiter ;
#
#
#
#
# -- trigger sản phẩm
# -- chen
# delimiter //
# DROP TRIGGER IF EXISTS after_insert_sanPham //
# CREATE TRIGGER after_insert_sanPham AFTER INSERT
# ON sanPham
# FOR EACH ROW
# BEGIN
# 	UPDATE loaiSanPham
#     SET productQuantity=productQuantity+1
#     WHERE idCategory=new.idCategory;
# END//
# delimiter ;
#
#
# -- xoa
# delimiter //
# DROP TRIGGER IF EXISTS after_delete_sanPham //
# CREATE TRIGGER after_delete_sanPham AFTER DELETE
# ON sanPham
# FOR EACH ROW
# BEGIN
# 	UPDATE loaiSanPham
#     SET productQuantity=productQuantity-1
#     WHERE idCategory=old.idCategory;
# END//
# delimiter ;
#
# -- update
# delimiter //
# DROP TRIGGER IF EXISTS after_update_sanPham //
# CREATE TRIGGER after_update_sanPham AFTER UPDATE
# ON sanPham
# FOR EACH ROW
# BEGIN
# 	UPDATE loaiSanPham
#     SET productQuantity=productQuantity-1
#     WHERE idCategory=old.idCategory;
#
#     UPDATE loaiSanPham
#     SET productQuantity=productQuantity+1
#     WHERE idCategory=new.idCategory;
# END//
# delimiter ;
#
#
# -- chen data
#
# INSERT into taiKhoan( fullName ,phoneNumber , passWord ,role ) VALUES	("Hoàng Công Hậu","0345066663","1","admin"),
# 																		("Đỗ Hồng Huy","0345066661","1","user"),
#                                                                         ("Hoàng Công Hậu","0345064663","1","user"),
#                                                                         ("Hoàng Công Hậu","0345063663","1","user");
#
# INSERT INTO loaiSanPham(nameCategory) VALUES 	("Laptop"),("Smart Phone"),("Phụ kiện");
#
# INSERT INTO sanPham(idCategory ,nameProduct ,imgProduct ,price ,quantity) VALUES	(1,"asus vivobook","",1000,10),
# 																					(1,"dell","",1500,10),
#                                                                                     (1,"hp","",700,10),
#                                                                                     (2,"iPhone","",2000,10),
#                                                                                     (2,"xiao Mi","",1500,10),
#                                                                                     (3,"chuột","",1000,10),
#                                                                                     (3,"tai nghe","",1000,10);
#
# INSERT INTO donHang(idAcc ,address)	VALUES (2,"Hoàng Mai"),(3,"Thanh Xuân"),(4,"Tân Mai");
#
#
# INSERT INTO	 chiTietDH(idOrder ,idProduct ,quantity) VALUES	 (1,1,12),(1,2,1),(2,3,2),(2,4,1),(3,5,3),(3,6,1);
#
#
#
=======
use webBanHang;


DROP TABLE chiTietDH;
DROP TABLE donHang;
DROP TABLE taiKhoan;
DROP TABLE sanPham;
DROP TABLE loaiSanPham;



CREATE TABLE taiKhoan (
    idAccount INT(4) AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(10) NOT NULL UNIQUE,
    passWord VARCHAR(20) NOT NULL,
    role VARCHAR(10) DEFAULT 'user'
);

CREATE TABLE loaiSanPham (
    idCategory INT(4) AUTO_INCREMENT PRIMARY KEY,
    nameCategory VARCHAR(100) NOT NULL UNIQUE,
    productQuantity INT DEFAULT 0
);


CREATE TABLE sanPham (
    idProduct INT(4) AUTO_INCREMENT PRIMARY KEY,
    idCategory INT(4) NOT NULL,
    nameProduct VARCHAR(100) NOT NULL UNIQUE,
    imgProduct TEXT NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT DEFAULT 0,
    CONSTRAINT fk_1 FOREIGN KEY(idCategory) REFERENCES loaiSanPham(idCategory)
);


CREATE TABLE donHang (
    idOrder INT(4) AUTO_INCREMENT PRIMARY KEY,
    idAcc INT(4) NOT NULL,
    orderDate DATETIME DEFAULT NOW(),
    statusDelivery VARCHAR(30) DEFAULT 'Đang giao',
    address VARCHAR(200) NOT NULL,
    totalValue DOUBLE DEFAULT 0,
    CONSTRAINT fk_2 FOREIGN KEY (idAcc)
        REFERENCES taiKhoan (idAccount)
);

CREATE TABLE chiTietDH(
	idOrder int(4) not null,
    idProduct int(4) not null,
    quantity int not null,
    CONSTRAINT pk PRIMARY KEY(idOrder,idProduct),
    CONSTRAINT fk_3 FOREIGN KEY(idOrder) REFERENCES donHang(idOrder),
	CONSTRAINT fk_4 FOREIGN KEY(idProduct) REFERENCES sanPham(idProduct)
    );
-- trigger don hang
-- chen
delimiter //
DROP TRIGGER IF EXISTS after_insert_chiTietDH //
CREATE TRIGGER after_insert_chiTietDH AFTER INSERT
ON chiTietDH
FOR EACH ROW
BEGIN
	UPDATE donHang
    SET totalValue=totalValue+ new.quantity*(SELECT price FROM sanPham WHERE idProduct=new.idProduct)
    WHERE idOrder=new.idOrder;
END//
delimiter ;
-- xoa
delimiter //
DROP TRIGGER IF EXISTS after_delete_chiTietDH //
CREATE TRIGGER after_delete_chiTietDH AFTER DELETE
ON chiTietDH
FOR EACH ROW
BEGIN
	UPDATE donHang
    SET totalValue=totalValue- old.quantity*(SELECT price FROM sanPham WHERE idProduct=old.idProduct)
    WHERE idOrder=old.idOrder;
END//
delimiter ;


-- update
delimiter //
DROP TRIGGER IF EXISTS after_update_chiTietDH //
CREATE TRIGGER after_update_chiTietDH AFTER UPDATE
ON chiTietDH
FOR EACH ROW
BEGIN
	UPDATE donHang
    SET totalValue=totalValue+(new.quantity-old.quantity)*(SELECT price FROM sanPham WHERE idProduct=old.idProduct)
    WHERE idOrder=old.idOrder;
END//
delimiter ;




-- trigger sản phẩm
-- chen
delimiter //
DROP TRIGGER IF EXISTS after_insert_sanPham //
CREATE TRIGGER after_insert_sanPham AFTER INSERT
ON sanPham
FOR EACH ROW
BEGIN
	UPDATE loaiSanPham
    SET productQuantity=productQuantity+1
    WHERE idCategory=new.idCategory;
END//
delimiter ;


-- xoa
delimiter //
DROP TRIGGER IF EXISTS after_delete_sanPham //
CREATE TRIGGER after_delete_sanPham AFTER DELETE
ON sanPham
FOR EACH ROW
BEGIN
	UPDATE loaiSanPham
    SET productQuantity=productQuantity-1
    WHERE idCategory=old.idCategory;
END//
delimiter ;

-- update
delimiter //
DROP TRIGGER IF EXISTS after_update_sanPham //
CREATE TRIGGER after_update_sanPham AFTER UPDATE
ON sanPham
FOR EACH ROW
BEGIN
	UPDATE loaiSanPham
    SET productQuantity=productQuantity-1
    WHERE idCategory=old.idCategory;

    UPDATE loaiSanPham
    SET productQuantity=productQuantity+1
    WHERE idCategory=new.idCategory;
END//
delimiter ;


-- chen data

INSERT into taiKhoan( fullName ,phoneNumber , passWord ,role ) VALUES	("Hoàng Công Hậu","0345066663","1","admin"),
																		("Đỗ Hồng Huy","0345066661","1","user"),
                                                                        ("Hoàng Công Hậu","0345064663","1","user"),
                                                                        ("Hoàng Công Hậu","0345063663","1","user");

INSERT INTO loaiSanPham(nameCategory) VALUES 	("Laptop"),("Smart Phone"),("Phụ kiện");

INSERT INTO sanPham(idCategory ,nameProduct ,imgProduct ,price ,quantity) VALUES	(1,"asus vivobook","",1000,10),
																					(1,"dell","",1500,10),
                                                                                    (1,"hp","",700,10),
                                                                                    (2,"iPhone","",2000,10),
                                                                                    (2,"xiao Mi","",1500,10),
                                                                                    (3,"chuột","",1000,10),
                                                                                    (3,"tai nghe","",1000,10);

INSERT INTO donHang(idAcc ,address)	VALUES (2,"Hoàng Mai"),(3,"Thanh Xuân"),(4,"Tân Mai");


INSERT INTO	 chiTietDH(idOrder ,idProduct ,quantity) VALUES	 (1,1,12),(1,2,1),(2,3,2),(2,4,1),(3,5,3),(3,6,1);



>>>>>>> 5ceb7304f5e57431b77b0cf55921bae29b1ee776
