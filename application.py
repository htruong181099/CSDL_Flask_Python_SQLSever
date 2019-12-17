import os
from flask import *
import pypyodbc
from flask_session import Session # an additional extension to sessions which allows them
                                  # to be stored server-side

app = Flask(__name__)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

connection = pypyodbc.connect('Driver={SQL Server};'
                                'Server=YRZ80LJ5VFZN9LQ\SQLEXPRESS;'
                                'Database=Ass2;'
                                'Trusted_Connection=yes;')
db = connection.cursor()


@app.route("/")
def index():
    category = db.execute("SELECT * FROM DanhMucSanPham").fetchall()
    items = db.execute("SELECT * FROM SanPham").fetchall()
    return render_template("index.html",category=category,items=items)

@app.route("/signin", methods = ["GET"])
def signin():
    if request.method == 'GET':
        return render_template("signin.html")

@app.route("/signup", methods = ["GET","POST"])
def signup():
    if request.method == 'GET':
        return render_template("signup.html")
    elif request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        name = request.form.get('name')
        try:
            # db.execute("INSERT INTO KhachHang(Email,MatKhau,HoTen) VALUES (?,?,?)",[email,password,name])
            # db.commit()
            db.execute("exec them_tai_khoan_khach_hang @email=?, @matkhau=?, @hoten=?",[email,password,name])
            db.commit()
            return render_template("signin.html",suc=1)
        except:
            return render_template("signup.html",error=1)

@app.route("/logout", methods = ["GET"])
def logout():
    session.pop('users', None)
    session.pop('user_id', None)
    return index()

@app.route("/signinstatus", methods = ["POST"])
def signinstatus():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        users = db.execute("exec tim_khach_hang_theo_email @email = ?",[email]).fetchone()
        out = "<h1>Login Failed</h1><a href=\"/signin\">Trở lại đăng nhập</a>"
        if users is None:
            return out
        print((email,password,users))
        if email == users[0] and password == users[1]:
            session['users'] = users[0]
            session['user_id'] = users[2]
            return index()
        else:
            return out

@app.route("/shop", methods = ["GET"])
def shop():
    if request.method == 'GET':
        sp = db.execute("""exec tim_cac_san_pham_cua_cua_hang_theo_id ?""",[session['shop_id']]).fetchall()
        shop=db.execute("SELECT * FROM CuaHang WHERE MaCuaHang=?",[session['shop_id']]).fetchone()
        return render_template("shop.html",sp=sp,shop=shop)
    else:
        sp = db.execute("""exec tim_cac_san_pham_cua_cua_hang_theo_id ?""",[session['shop_id']]).fetchall()
        shop=db.execute("SELECT * FROM CuaHang WHERE MaCuaHang=?",[session['shop_id']]).fetchone()
        return render_template("shop.html",sp=sp,shop=shop)

@app.route("/user_profile",methods=['GET','POST'])
def user():
    if request.method == 'GET':
        us=db.execute("SELECT * FROM KhachHang WHERE MaKhachHang=?",[session['user_id']]).fetchone()
        return render_template("user.html",user=us)
    elif request.method == 'POST':
        HoTen= request.form.get('HoTen')
        SDT = request.form.get('SDT')
        SoTaiKhoan = request.form.get('SoTaiKhoan')
        TenNganHang = request.form.get('TenNganHang')
        TenNguoiThuHuong = request.form.get('TenNguoiThuHuong')
        try:
            db.execute("""UPDATE KhachHang SET HoTen = ?,
                        SDT = ?,
                        SoTaiKhoan = ?,
                        TenNganHang = ?,
                        TenNguoiThuHuong = ?,
                        WHERE MaKhachHang = ?""",
                        [HoTen,SDT,SoTaiKhoan,TenNganHang,TenNguoiThuHuong,session['user_id']])
            db.commit()
            us=db.execute("SELECT * FROM KhachHang WHERE MaKhachHang=?",[session['user_id']]).fetchone()
            return render_template("user.html",user=us,suc=1)
        except:
            us=db.execute("SELECT * FROM KhachHang WHERE MaKhachHang=?",[session['user_id']]).fetchone()
            return render_template("user.html",user=us,error=1)

@app.route("/shop/profile", methods = ["POST"])
def shop_profile():
    if request.method == 'POST':
        HoTenChuCuaHang = request.form.get('HoTenChuCuaHang')
        TenCuaHang = request.form.get('TenCuaHang')
        Sodienthoai = request.form.get('Sodienthoai')
        SoTaiKhoan = request.form.get('SoTaiKhoan')
        TenNganHang = request.form.get('TenNganHang')
        TenNguoiThuHuong = request.form.get('TenNguoiThuHuong')
        MaTrungTam = request.form.get('MaTrungTam')
        print(MaTrungTam)
        try:
            db.execute("""UPDATE CuaHang SET HoTenChuCuaHang = ?,
                        TenCuaHang = ?,
                        SDT = ?,
                        SoTaiKhoan = ?,
                        TenNganHang = ?,
                        TenNguoiThuHuong = ?,
                        MaTrungTam = ?
                        WHERE MaCuaHang = ?""",
                        [HoTenChuCuaHang,TenCuaHang,Sodienthoai,SoTaiKhoan,TenNganHang,TenNguoiThuHuong,MaTrungTam,session['shop_id']])
            db.commit()
            return shop()
        except:
            return "failed"

@app.route("/shop/add", methods = ["POST"])
def addItem():
    if request.method == 'POST':
        TenSanPham = request.form.get('ten')
        ThongTin = request.form.get('thongtin')
        MoTa = request.form.get('mota')
        GiaBan = request.form.get('gia')
        SoLuong = request.form.get('soluong')
        try:
            # c = db.execute("INSERT INTO SanPham (TenSanPham,ThongTin,MoTa,GiaBan) OUTPUT Inserted.MaSanPham VALUES (?,?,?,?)",[TenSanPham,ThongTin,MoTa,GiaBan]).fetchone()
            # db.commit()
            # db.execute("INSERT INTO KinhDoanh_SanPham_CuaHang (MaSanPham,MaCuahang,SoLuong) VALUES (?,?,?)",[c[0],session['shop_id'],SoLuong])
            # db.commit()
            sp=db.execute("""exec them_san_pham
                        @macuahang =?,
                        @ten =?,
                        @thongtin =?,
                        @mota =?,
                        @giaban =?,
                        @soluong =?""",
                        [session['shop_id'],TenSanPham,ThongTin,MoTa,GiaBan,SoLuong])
            db.commit()
            return shop()
        except:
            return render_template("shop.html",error=1)


@app.route("/shop/signin", methods = ["GET"])
def shop_signin():
    if request.method == 'GET':
        try:
            if session['shop']:
                return shop()
        except:
            return render_template("shop_signin.html")

@app.route("/shop/signup", methods = ["GET","POST"])
def shop_signup():
    if request.method == 'GET':
        return render_template("shop_signup.html")
    elif request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        shop_name = request.form.get('shop_name')
        name = request.form.get('name')
        center = request.form.get('center')
        try:
            # db.execute("INSERT INTO CuaHang (Email,MatKhau,TenCuaHang,HoTenChuCuaHang,MaTrungTam) VALUES (?,?,?,?,?)",[email,password,shop_name,name,center])
            db.execute("""exec them_tai_khoan_cua_hang
                        @email =?,
                        @matkhau =?,
                        @tencuahang =?,
                        @hotenchu =?,
                        @matrungtam =?""",[email,password,shop_name,name,center])
            db.commit()
            return shop()
        except:
            sp = db.execute("""SELECT s.MaSanPham,TenSanPham,GiaBan,SoLuong
                            From SanPham as s join KinhDoanh_SanPham_CuaHang as k on s.MaSanPham = k.MaSanPham
                            WHERE MaCuaHang = ?""",[session['shop_id']]).fetchall()
            return render_template("shop_signup.html",error=1,sp=sp)
        
@app.route("/shop/signinstatus", methods = ["POST"])
def shop_signinstatus():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        users = db.execute("SELECT Email, MatKhau, MaCuaHang FROM CuaHang WHERE Email=?",[email]).fetchone()
        out = "<h1>Login Failed</h1><a href=\"/shop/signin\">Trở lại đăng nhập</a>"
        if users is None:
            return out
        print((email,password,users))
        if email == users[0] and password == users[1]:
            session['shop'] = users[0]
            session['shop_id'] = users[2]
            return shop()
        else:
            return out

@app.route("/shop/logout", methods = ["GET"])
def shop_logout():
    session.pop('shop', None)
    session.pop('shop_id', None)
    return render_template("shop_signin.html")

@app.route("/search", methods = ["GET"])
def search():
    if request.method == 'GET':
        search = request.args.get('search')
        sp1 = db.execute("exec tim_cac_san_pham_cua_cua_hang_theo_ten @tencuahang = ?",[search]).fetchall()
        session['search_cuahang'] = search
        search = "%"+search+"%"
        # sp = db.execute("SELECT * FROM SanPham WHERE TenSanPham Like ?",[search]).fetchall()
        sp = db.execute("exec tim_san_pham_theo_ten @ten = ?",[search]).fetchall()
        return render_template("search.html",sp=sp,sp1=sp1)


@app.route("/shop/sanpham/<int:id>",methods = ['GET','POST'])
def sanpham(id):
    if request.method == 'GET':
        sp = db.execute("""SELECT s.MaSanPham,TenSanPham,ThongTin,MoTa,GiaBan,SoLuong
                FROM SanPham as s Join KinhDoanh_SanPham_CuaHang as k on s.MaSanPham = k.MaSanPham WHERE s.MaSanPham=?
                """,[id]).fetchone()
        return render_template("sanpham.html",sp =sp)
    elif request.method == 'POST':
        TenSanPham = request.form.get('ten')
        ThongTin = request.form.get('thongtin')
        MoTa = request.form.get('mota')
        GiaBan = request.form.get('gia')
        SoLuong = request.form.get('soluong')
        db.execute("""UPDATE SanPham SET TenSanPham=?,ThongTin=?,MoTa=?,GiaBan=? WHERE MaSanPham = ?""",[TenSanPham,ThongTin,MoTa,GiaBan,id])
        db.commit()
        db.execute("""UPDATE KinhDoanh_SanPham_CuaHang SET SoLuong=? WHERE MaSanPham = ?""",[SoLuong,id])
        db.commit()
        sp = db.execute("""SELECT s.MaSanPham,TenSanPham,ThongTin,MoTa,GiaBan,SoLuong
                FROM SanPham as s Join KinhDoanh_SanPham_CuaHang as k on s.MaSanPham = k.MaSanPham WHERE s.MaSanPham=?
                """,[id]).fetchone()
        return render_template("sanpham.html",sp =sp,suc=1)

@app.route("/shop/delete", methods = ["POST"])
def deleteItem():
    id = request.form.get("id")
    db.execute("DELETE FROM KinhDoanh_SanPham_CuaHang WHERE MaSanPham = ?",[id])
    db.commit()
    db.execute("DELETE FROM SanPham WHERE MaSanPham=?",[id])
    db.commit()
    return shop()