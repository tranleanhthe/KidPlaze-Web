<%-- 
    Document   : DoanhThu
    Created on : May 9, 2017, 11:13:26 AM
    Author     : tranl
--%>

<%@page import="DAO.NHANVIEN_DAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.DONDATHANG"%>
<%@page import="DAO.DONDATHANG_DAO"%>
<%@page import="DTO.KHACHHANG"%>
<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DTO.BINHLUAN"%>
<%@page import="DAO.BINHLUAN_DAO"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="DTO.SANPHAM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SANPHAM_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doanh Thu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- Bootstrap Core CSS -->
        <link href="web-admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->

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
        <link href="web-admin/css/style_admin.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="css/morris.css" type="text/css"/>
        <link href="web-admin/css/style.css" rel='stylesheet' type='text/css' />
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
            <!-- Navigation -->
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

                            <li class="m_2"><a href="ThongTinAdmin"><i class="fa fa-user"></i> Thông Tin Cá Nhân</a></li>

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

            <div id="page-wrapper" style="background-color: white">
                <div class="graphs">
                    <div class="four-grids">
                        <div class="col-md-3 four-grid" id="danhsachkhachhang">
                            <div class="four-agileits">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-user" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3> Số lượng khách hàng</h3>
                                    <%
                                        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
                                        int soluongKH = kh_dp.countKH();
                                    %>
                                    <h4><%=soluongKH%></h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 four-grid" id="danhsachsanpham">
                            <div class="four-agileinfo">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3> Số loại sản phẩm</h3>
                                    <%
                                        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
                                        int soluong = sp_dp.SoLuongLoai();
                                    %>
                                    <h4>  <%=soluong%> </h4>

                                </div>

                            </div>
                        </div>
                        <script>
            $(document).ready(function () {
                $("#donhangdangxuly").on('click', function () {
                    window.location.href = "DuyetDonDatHang";
                });
                $("#donhangthanhcong").on('click', function () {
                    window.location.href = "DanhSachDonDatHangThanhCong";
                });
                $("#danhsachkhachhang").on('click', function () {
                    window.location.href = "DanhSachKhachHang";
                });
                $("#danhsachsanpham").on('click', function () {
                    window.location.href = "DanhSachSanPham";
                });
            });
                        </script>
                        <div class="col-md-3 four-grid" id="donhangdangxuly">
                            <div class="four-w3ls">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <%
                                        DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();

                                    %>
                                    <h3>Đơn đặt hàng đang xử lý</h3>
                                    <h4><%=ddh_dp.TongDDH()%></h4>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 four-grid" id="donhangthanhcong">
                            <div class="four-wthree">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3>Đơn hàng thành công</h3>
                                    <h4><%=ddh_dp.SoLuongDonDatHangThangCong()%></h4>

                                </div>

                            </div>
                        </div>
                        <br>
                        <hr>

                        <div style="margin-top:30px" class="row" id="col-tk2">
                            <div class=""  style="margin-top:100px">
                                <div class="card">
                                    <div class="card-body" style="margin-top: 150px;">
                                        <div class="widget widget-report-table">
                                            <header class="widget-header m-b-15">
                                            </header>
                                            <div class="widget-body p-15">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã SP</th>
                                                            <th>Số lượng</th>
                                                            <th>Lợi nhuận</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            ArrayList<SANPHAM> list_sp = ddh_dp.listSPTop();
                                                            for (int i = 0; i < list_sp.size(); i++) {
                                                                for (int j = i + 1; j < list_sp.size(); j++) {
                                                                    int SoLuongBanI = ddh_dp.SoLuongDaGiao(list_sp.get(i).getMaSanPham());
                                                                    int GiaTienI = (list_sp.get(i).getDonGia() - list_sp.get(i).getGiaGoc() - list_sp.get(i).getGiamGia()) * SoLuongBanI;
                                                                    int SoLuongBanJ = ddh_dp.SoLuongDaGiao(list_sp.get(j).getMaSanPham());
                                                                    int GiaTienJ = (list_sp.get(j).getDonGia() - list_sp.get(j).getGiaGoc() - list_sp.get(j).getGiamGia()) * SoLuongBanJ;
                                                                    if (GiaTienI < GiaTienJ) {
                                                                        Collections.swap(list_sp, i, j);
                                                                    }
                                                                }
                                                                //int SoLuongBan = ddh_dp.SoLuongDaGiao(sp.getMaSanPham());
                                                                //int GiaTien = (sp.getDonGia() - sp.getGiaGoc() - sp.getGiamGia()) * SoLuongBan;
                                                            }
                                                            int count = 0;
                                                            for (SANPHAM sp : list_sp) {
                                                                int SoLuongBan = ddh_dp.SoLuongDaGiao(sp.getMaSanPham());
                                                                int GiaTien = (sp.getDonGia() - sp.getGiaGoc() - sp.getGiamGia()) * SoLuongBan;
                                                                if (count == 6) {
                                                                    break;
                                                                }
                                                        %>
                                                        <tr>
                                                            <td><%=sp.getMaSanPham()%></td>
                                                            <td><%=SoLuongBan%></td>
                                                            <td><%=SANPHAM.convertToVND(GiaTien)%></td>
                                                        </tr>
                                                        <%count++;
                                                            }%>
                                                    </tbody>
                                                </table> 
                                                <button style="margin-left:450px; margin-top:-10px" class="btn btn-primary"><a style="color:black" href="XemChiTietTopSanPham">Xem Thêm</a></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--
                                                        <div class="col-sm-4 w3-agileits-crd"  style="margin-top:30px">
                            
                                                            <div class="card card-contact-list">
                                                                <div class="agileinfo-cdr">
                                                                    <div class="card-header">
                                                                        <h3>Contacts</h3>
                                                                    </div>
                                                                    <div class="card-body p-b-20">
                                                                        <div class="list-group">
                                                                            <a class="list-group-item media" href="">
                                                                                <div class="pull-left">
                                                                                    <img class="lg-item-img" src="images/in1.jpg" alt="">
                                                                                </div>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left">
                                                                                        <div class="lg-item-heading">Lorem</div>
                                                                                        <small class="lg-item-text">lorem@gmail.com</small>
                                                                                    </div>
                                                                                    <div class="pull-right">
                                                                                        <div class="lg-item-heading">Ceo</div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a class="list-group-item media" href="">
                                                                                <div class="pull-left">
                                                                                    <img class="lg-item-img" src="images/in2.jpg" alt="">
                                                                                </div>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left">
                                                                                        <div class="lg-item-heading">Ipsum</div>
                                                                                        <small class="lg-item-text">ipsum@hotmail.com</small>
                                                                                    </div>
                                                                                    <div class="pull-right">
                                                                                        <div class="lg-item-heading">Director</div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a class="list-group-item media" href="">
                                                                                <div class="pull-left">
                                                                                    <img class="lg-item-img" src="images/in3.jpg" alt="">
                                                                                </div>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left">
                                                                                        <div class="lg-item-heading">Unknown</div>
                                                                                        <small class="lg-item-text">unknown@gmail.com</small>
                                                                                    </div>
                                                                                    <div class="pull-right">
                                                                                        <div class="lg-item-heading">Manager</div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a class="list-group-item media" href="">
                                                                                <div class="pull-left">
                                                                                    <img class="lg-item-img" src="images/in4.jpg" alt="">
                                                                                </div>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left">
                                                                                        <div class="lg-item-heading">Specimen</div>
                                                                                        <small class="lg-item-text">specimen@hotmail.com</small>
                                                                                    </div>
                                                                                    <div class="pull-right">
                                                                                        <div class="lg-item-heading">Assistan</div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                            
                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 w3-agile-crd">
                                                            <div class="card">
                                                                <div class="card-body card-padding">
                                                                    <div class="widget">
                                                                        <header class="widget-header">
                                                                            <h4 class="widget-title">Activities</h4>
                                                                        </header>
                                                                        <hr class="widget-separator">
                                                                        <div class="widget-body">
                                                                            <div class="streamline">
                                                                                <div class="sl-item sl-primary">
                                                                                    <div class="sl-content">
                                                                                        <small class="text-muted">5 mins ago</small>
                                                                                        <p>Williams has just joined Project X</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="sl-item sl-danger">
                                                                                    <div class="sl-content">
                                                                                        <small class="text-muted">25 mins ago</small>
                                                                                        <p>Jane has sent a request for access</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="sl-item sl-success">
                                                                                    <div class="sl-content">
                                                                                        <small class="text-muted">40 mins ago</small>
                                                                                        <p>Kate added you to her team</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="sl-item">
                                                                                    <div class="sl-content">
                                                                                        <small class="text-muted">45 minutes ago</small>
                                                                                        <p>John has finished his task</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="sl-item sl-warning">
                                                                                    <div class="sl-content">
                                                                                        <small class="text-muted">55 mins ago</small>
                                                                                        <p>Jim shared a folder with you</p>
                                                                                    </div>
                                                                                </div>
                            
                                                                            </div>
                                                                        </div>
                            
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
