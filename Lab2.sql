# Câu 1:  Hi?n th? thông tin các b?ng d? li?u trên.

SELECT *
FROM Sanpham;

SELECT *
FROM Hangsx;

SELECT *
FROM Nhanvien;

SELECT *
FROM Nhap;

SELECT *
FROM Xuat;

# Câu 2: Đưa ra thông tin masp, tensp, tenhang,soluong, mausac, giaban, donvitinh, mota c?a các s?n ph?m s?p x?p theo chi?u gi?m d?n giá bán.

SELECT sp.masp, sp.tensp, hs.tenhang, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
FROM Sanpham AS sp
INNER JOIN Hangsx AS hs
ON sp.mahangsx = hs.mahangsx
ORDER BY sp.giaban DESC;


# Câu 3: Đưa ra thông tin các s?n ph?m có trong c?a hàng do công ty có tên h?ng là samsung s?n xu?t.

SELECT sp.masp, sp.tensp, hs.tenhang, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
FROM Sanpham AS sp
INNER JOIN Hangsx AS hs
ON sp.mahangsx = hs.mahangsx
WHERE hs.tenhang = 'samsung';


# Câu 4: Đưa ra thông tin các nhân viên N? ? ph?ng ‘K? toán’.

SELECT *
FROM Nhanvien
WHERE gioitinh = N'N?' AND phong = N'K? toán';


# Câu 5: Đưa ra thông tin phi?u nh?p g?m: sohdn, masp, tensp, tenhang, soluongN, dongiaN, tiennhap=soluongN*dongiaN, 
mausac, donvitinh, ngaynhap, tennv, phong. S?p x?p theo chi?u tăng d?n c?a hóa đơn nh?p.

SELECT n.sohdn, n.masp, sp.tensp, hs.tenhang, n.soluongN, n.dongiaN, n.soluongN*n.dongiaN AS tiennhap, sp.mausac, sp.donvitinh, n.ngaynhap, nv.tennv, nv.phong
FROM Nhap AS n
INNER JOIN Sanpham AS sp
ON n.masp = sp.masp
INNER JOIN Hangsx AS hs
ON sp.mahangsx = hs.mahangsx
INNER JOIN Nhanvien AS nv
ON n.manv = nv.manv
ORDER BY n.sohdn ASC;


# Câu 6: Đưa ra thông tin phi?u xu?t g?m: sohdx, masp, tensp, tenhang, soluongX, giaban, tienxuat=soluongX*giaban, mausac, donvitinh, 
ngayxuat, tennv, phong trong tháng 10 năm 2018, s?p x?p theo chi?u tăng d?n c?a sohdx.

SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, Nhanvien.tennv, Nhanvien.phong
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;


# Câu 7: Đ? đưa ra các thông tin v? các hóa đơn mà h?ng samsung đ? nh?p trong năm 2017, g?m: sohdn, masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong, ta có th? s? d?ng câu l?nh sau:

SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Nhap.soluongN, Nhap.dongiaN, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2017 AND Hangsx.tenhang = 'samsung';

# Câu 8: Đ? đưa ra Top 10 hóa đơn xu?t có s? lư?ng xu?t nhi?u nh?t trong năm 2018, s?p x?p theo chi?u gi?m d?n c?a soluongX, ta có th? s? d?ng câu l?nh sau:

SELECT TOP 10 Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, Nhanvien.tennv, Nhanvien.phong
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 

# Câu 9: Đưa ra thông tin 10 s?n ph?m có giá bán cao nh?t trong c?a hàng, theo chi?u gi?m d?n gía  bán.

SELECT TOP 10 *
FROM Sanpham
ORDER BY giaban DESC;

# Câu 10: Đưa ra các thông tin s?n ph?m có gía bán t? 100.000 đ?n 500.000 c?a h?ng samsung.

SELECT Sanpham.*
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND giaban BETWEEN 100000 AND 500000;


# Câu 13:Đưa ra sohdn, ngaynhap có tiền nhập phải trả cao nhất trong năm 2018

SELECT TOP 1 sohdn, ngaynhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2018
ORDER BY soluongN*dongiaN DESC;

# Câu 14:Đưa ra 10 mặt hàng có soluongN nhiều nhất trong năm 2019.

SELECT TOP 10 masp, SUM(soluongN) as TongSoLuongN
FROM Nhap
WHERE YEAR(ngaynhap) = 2019
GROUP BY masp
ORDER BY TongSoLuongN DESC;

# Câu 15:Đưa ra masp,tensp của các sản phẩm do công ty ‘Samsung’ sản xuất do nhân viên có
mã ‘NV01’ nhập.

SELECT Sanpham.masp, tensp
FROM Sanpham 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE Hangsx.tenhang = 'Samsung' AND Nhap.manv = 'NV01';

# Câu 16:Đưa ra sohdn,masp,soluongN,ngayN của mặt hàng có masp là ‘SP02’, được nhân
viên ‘NV02’ xuất.

SELECT sohdn, Nhap.masp, soluongN, ngaynhap
FROM Nhap
JOIN Xuat ON Nhap.sohdn = Xuat.sohdx
WHERE Nhap.masp = 'SP02' AND Xuat.manv = 'NV02';

# Câu 17:Đưa ra manv,tennv đã xuất mặt hàng có mã ‘SP02’ ngày ’03-02-2020’.

SELECT manv, tennv
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-02-03';