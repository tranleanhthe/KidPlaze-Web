<%-- 
    Document   : ThemCoSan
    Created on : Apr 26, 2017, 8:19:39 PM
    Author     : tranl
--%>

<%@page import="DAO.NHANVIEN_DAO"%>
<%@page import="DTO.SANPHAM"%>
<!DOCTYPE HTML>
<%@page import="DTO.NHASANXUAT"%>
<%@page import="DTO.NHASANXUAT"%>
<%@page import="DAO.NHASANXUAT_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Chỉnh Sửa Sản Phẩm</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- Bootstrap Core CSS -->
        <link href="web-admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="web-admin/css/style.css" rel='stylesheet' type='text/css' />
        <!-- Graph CSS -->
        <link href="web-admin/css/lines.css" rel='stylesheet' type='text/css' />
        <link href="web-admin/css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="web-admin/js/jquery.min.js"></script>
        <!----webfonts--->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
        <!---//webfonts--->  
        <!-- Nav CSS -->
        <link href="web-admin/css/custom.css" rel="stylesheet">
        <!-- Metis Menu Plugin JavaScript -->
        <script src="web-admin/js/metisMenu.min.js"></script>
        <script src="web-admin/js/custom.js"></script>
        <!-- Graph JavaScript -->
        <script src="web-admin/js/d3.v3.js"></script>
        <script src="web-admin/s/rickshaw.js"></script>
        <script>
            var CKEDITOR_BASEPATH = 'js/ckeditor/';
        </script>

        <script src="js/ckeditor/ckeditor.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            String username = (String) request.getSession().getAttribute("username");
            if (username == null) {
        %>

        <jsp:forward page="/Admin" />

        <%
            }
            NHANVIEN_DAO nv_dp = new NHANVIEN_DAO();
            String Quyen = nv_dp.getQuyen(username);
        %>
        <div id="wrapper">
            <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">Xin chào <%=username%></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-header text-center">
                                <strong>Tài Khoản</strong>
                            </li>

                            <li class="m_2"><a href="DangXuatAdmin"><i class="fa fa-lock"></i> Đăng Xuất</a></li>	
                        </ul>
                    </li>
                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <%
                                if (Quyen.equals("CTV")) {
                            %>

                            <li>
                                <a href="#"><i></i>Sản Phẩm<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemPhieuNhap">Thêm Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachPhieuNhap">Danh sách Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachSanPham">Danh sách sản phẩm</a>
                                    </li>
                                    <li>
                                        <a href="ThemSanPham">Thêm sản phẩm</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i></i>Danh Mục<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachDanhMuc">Danh sách danh mục</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Nhà cung cấp<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemNhaCungCap?yc=Them">Thêm nhà cung cấp</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachNhaCungCap">Danh sách nhà cung cấp</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Bình luận<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachBinhLuan">Danh sách bình luận</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Khách hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachKhachHang">Danh sách khách hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i></i>Đơn Đặt Hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DuyetDonDatHang">Duyệt Đơn Đặt Hàng</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachDonDatHang">Danh Sách Đơn Đặt Hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <%
                            } else {
                            %>
                            <li>
                                <a href="DoanhThu"><i class="fa fa-dashboard fa-fw nav_icon"></i>Trang Chính</a>
                            </li>

                            <li>
                                <a href="#"><i></i>Thống Kê<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DoanhThu">Doanh Thu</a>
                                    </li>
                                    <li>
                                        <a href="ThongKeTruyCap">Lượt truy cập</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Sản Phẩm<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemPhieuNhap">Thêm Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachPhieuNhap">Danh sách Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachSanPham">Danh sách sản phẩm</a>
                                    </li>
                                    <li>
                                        <a href="ThemSanPham">Thêm sản phẩm</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i></i>Danh Mục<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachDanhMuc">Danh sách danh mục</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Nhà cung cấp<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemNhaCungCap?yc=Them">Thêm nhà cung cấp</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachNhaCungCap">Danh sách nhà cung cấp</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Bình luận<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachBinhLuan">Danh sách bình luận</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Khách hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachKhachHang">Danh sách khách hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Tài khoản<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="TaoTaiKhoanHeThong">Tạo tài khoản hệ thống </a>
                                    </li>
                                    <li>
                                        <a href="DanhSachTaiKhoanHeThong">Danh sách tài khoản</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Đơn Đặt Hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DuyetDonDatHang">Duyệt Đơn Đặt Hàng</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachDonDatHang">Danh Sách Đơn Đặt Hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <%}%>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
            <div id="page-wrapper">
                <div class="graphs">
                    <div class="xs">
                        <%
                            SANPHAM sp_c = (SANPHAM) request.getAttribute("SanPham");
                            String MaPhieuNhap = (String) request.getAttribute("MaPhieuNhap");
                        %>
                        <h3>Sửa sản phẩm <%=sp_c.getTenSanPham()%></h3>
                        <div class="tab-pane active" id="horizontal-form">
                            <form class="form-horizontal" id="form-them" action="ThemSanPhamPhieuNhapCoSan?MaSanPham=<%=sp_c.getMaSanPham()%>&MaPhieuNhap=<%=MaPhieuNhap%>" method="POST">
                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Tên sản phẩm</label>
                                    <div class="col-sm-8">
                                        <input name="sp_name" type="text" class="form-control1" id="focusedinput" value="<%=sp_c.getTenSanPham()%>">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="checkbox" class="col-sm-2 control-label">Danh mục sản phẩm</label>
                                    <div class="col-sm-8">
                                        <%
                                            LOAISANPHAM_DAO daoLoaiSanPham = new LOAISANPHAM_DAO();
                                            ArrayList<LOAISANPHAM> listLoaiSP = daoLoaiSanPham.getLoaiSanPham();
                                            ArrayList<LOAISANPHAM> listLoai = daoLoaiSanPham.getLoaiSanPhamTheMa(sp_c.getMaSanPham());
                                            for (LOAISANPHAM sp : listLoaiSP) {
                                                boolean check = false;
                                                for (LOAISANPHAM sp2 : listLoai) {

                                                    if (sp.getMaLoaiSanPham().equals(sp2.getMaLoaiSanPham()) == true) {
                                                        check = true;
                                        %>

                                        <div class="checkbox-inline1">
                                            <label>
                                                <input name="sp_loai" type="checkbox" value="<%=sp.getMaLoaiSanPham()%>" checked>
                                                <%=sp.getTenLoaiSanPham()%>
                                            </label>
                                        </div>
                                        <%
                                                    break;
                                                }
                                            }
                                            if (check == false) {
                                        %>

                                        <div class="checkbox-inline1">
                                            <label>
                                                <input name="sp_loai" type="checkbox" value="<%=sp.getMaLoaiSanPham()%>">
                                                <%=sp.getTenLoaiSanPham()%>
                                            </label>
                                        </div>
                                        <%}
                                            }%>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nhà sản xuất</label>
                                    <div class="col-sm-8">
                                        <select name="sp_nhasanxuat" multiple="" class="form-control1">
                                            <%
                                                NHASANXUAT_DAO daoNhaSanXuat = new NHASANXUAT_DAO();
                                                ArrayList<NHASANXUAT> listNhaSanXuat = daoNhaSanXuat.getNhaSanXuat();
                                                for (NHASANXUAT sp : listNhaSanXuat) {
                                                    if (sp.getMaNSX().equals(sp_c.getTb_nhasanxuat_MaNSX()) == true) {
                                            %>
                                            <option value="<%=sp.getMaNSX()%>" selected> <%=sp.getTenNSX()%></option>
                                            <%} else {
                                            %>
                                            <option value="<%=sp.getMaNSX()%>"> <%=sp.getTenNSX()%></option>
                                            <%}
                                                }%>                                        
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="txtarea1" class="col-sm-2 control-label">Mô tả sản phẩm</label>
                                    <div class="col-sm-8"><textarea  name="sp_mota" id="txtarea1" cols="50" rows="4" class="form-control1"></textarea></div>
                                </div>
                                <script>
            CKEDITOR.replace('sp_mota', {
                filebrowserImageUploadUrl: '../browerserver.jsp',
                filebrowserBrowseUrl: '../browerserver.jsp',
                filebrowserImageBrowseUrl: '../browerserver.jsp',
                filebrowserUploadUrl: '../browerserver.jsp'
            });
                                </script>

                                <script>
                                    $(document).ready(function () {
                                    <%
                                        String s = sp_c.getMoTa();
                                        String[] lines = s.split("\r\n");
                                        String tong = "";
                                        for (String temp : lines) {
                                            tong += temp;
                                        }
                                    %>

                                        CKEDITOR.instances["txtarea1"].setData('<%=tong%>');
                                    });

                                </script>
                                <div class="form-group">
                                    <label for="mediuminput" class="col-sm-2 control-label">Số Lượng</label>
                                    <div class="col-sm-8">
                                        <input name="sp_soluong" type="number" class="form-control1" id="sp_soluong" value="0">
                                        <p id="sp_soluong_error" style="display:none; color:red">Vui lòng nhập số lượng</p>
                                    </div>


                                </div>

                                <div class="form-group">
                                    <label for="mediuminput" class="col-sm-2 control-label">Giá tiền gốc </label>
                                    <div class="col-sm-8">
                                        <input name="sp_giatiengoc" type="number" class="form-control1" id="mediuminput" value="<%=sp_c.getGiaGoc()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mediuminput" class="col-sm-2 control-label">Giá tiền bán</label>
                                    <div class="col-sm-8">
                                        <input name="sp_giatien" type="number" class="form-control1" id="mediuminput" value="<%=sp_c.getDonGia()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mediuminput" class="col-sm-2 control-label">Khuyến mãi</label>
                                    <div class="col-sm-8">
                                        <input name="sp_giamgia" type="number" class="form-control1" id="mediuminput" value="<%=sp_c.getGiamGia()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-8">
                                        <label>Chọn ảnh làm ảnh đại diện : </label>
                                        <select name="link-image" id="link-image">
                                            <option value="<%=sp_c.getHinhAnh()[0]%>" selected><%=sp_c.getHinhAnh()[0]%></option>
                                            <%
                                                String list[] = sp_c.getHinhAnh();
                                                for (int i = 1; i < list.length; i++) {
                                            %>
                                            <option value="<%=sp_c.getHinhAnh()[i]%>"><%=sp_c.getHinhAnh()[i]%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-8">
                                        <label for="exampleInputFile">Upload image</label>

                                        <a id="pop-up">Pop Up</a>

                                        <script>
                                            $(document).ready(function () {
                                                var pop;

                                                $("#link-image-full").hide();
                                                $("#pop-up").on("click", function () {
                                                    console.log("I click here");
                                                    pop = window.open("../loadimage.jsp", "Pop up image", "width=500, height=500");
                                                    pop.focus();
                                                });
                                            });
                                        </script>

                                        <%
                                            String list_anh = "";

                                            for (int i = 0; i < sp_c.getHinhAnh().length; i++) {
                                                if (i == sp_c.getHinhAnh().length - 1) {
                                                    list_anh = list_anh + sp_c.getHinhAnh()[i];
                                                } else {
                                                    list_anh = list_anh + sp_c.getHinhAnh()[i] + ",";
                                                }
                                            }
                                            SANPHAM.removeCharAt(list_anh, list_anh.length() - 1);
                                        %>
                                        <input name="link-image-full" id="link-image-full" value="<%=list_anh%>" />


                                    </div>
                                </div>

                                <script>
                                    $(document).ready(function () {
                                        $("#huythem").on('click', function () {
                                            window.location.href = "ThemPhieuNhap";
                                        });

                                        $("#them").on('click', function () {
                                            var soluong = $("#sp_soluong").val();
                                            if (soluong <= 0) {
                                                $("#sp_soluong_error").css("display", "block");
                                            } else {
                                                $("#form-them").submit();
                                            }
                                        });
                                    });
                                </script>
                                <input style="display:none" value="abc" id="huythemvalue" name="yc">
                                <div class="col-sm-5"></div>
                                <button type="button" id="them" class="btn-success btn"> Thêm vào phiếu nhập </button>
                                <button type="button" id="huythem" class="btn btn-warning"> Hủy </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- Bootstrap Core JavaScript -->
        <script src="web-admin/js/bootstrap.min.js"></script>
    </body>
</html>
