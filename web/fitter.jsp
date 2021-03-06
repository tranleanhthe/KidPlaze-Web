<%-- 
    Document   : fitter
    Created on : Mar 24, 2017, 04:09:30 AM
    Author     : tranl
--%>

<%@page import="DTO.KHACHHANG"%>
<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DTO.NHASANXUAT"%>
<%@page import="DAO.NHASANXUAT_DAO"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page import="DTO.SANPHAM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SANPHAM_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Đồ chơi cho bé - Đồ chơi trẻ em An toàn Giá Tốt</title>
        <meta name="description" content=" Đồ chơi cho bé đồ chơi trẻ em an toàn độc đáo phù hợp với từng giai đoạn. Giúp bé phát triển thính giác thị giác khả năn vận động di chuyển linh hoạt ngay từ lúc mới sinh" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="style1.css">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="style3.css">
        <link rel="stylesheet" type="text/css" href="style.css">

    </head>
    <script>
        $(document).ready(function () {
            var menu = $('#login_content');
            menu.stop(true, true).hide( );
            $("#top_login").mouseenter(function (event) {

                $('#login_content').delay(200).show(600);

            });
            $("#top_login").mouseleave(function (event) {

                menu.stop(true, true).delay(200).hide(600);

            });
        });

    </script>
    <body class=" catalog-category-view categorypath-do-choi-cho-be-html category-do-choi-cho-be"> <a class="sr-only" href="#content">Skip to main content</a>
        <section class="mt-container">
            <div class="mt-menu mt-effect-slide">
                <div class="mt-menu-active">
                    <div class="navbar-header">
                        <div class="navbar-toggle" type="button" data-toggle="collapse">
                            <div class="collapsed-icon pull-left">
                                <span class="sr-only">Navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span></div> 
                            <span class="title-canvas">Menu</span> 
                            <button type="button" class="mt-close-canvas"></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-overlay"></div>
            <section class="mt-wrapper">
                <div class="wrapper">

                    <div class="container col2-left-layout" id="content">
                        <div class="before-main"></div> <noscript><div class="global-site-notice noscript"><div class="notice-inner"><p> <strong>JavaScript seems to be disabled in your browser.</strong><br /> You must have JavaScript enabled in your browser to utilize the functionality of this website.</p></div></div> </noscript>
                        <div class="row">
                            <div style="float: right;" class="col-main col-lg-9 col-md-9 col-sm-9 col-push-9 col-xs-12">
                                <ul class="messages ispeed-messages"></ul>
                                <div class="before-content"></div>
                                <div class="catalog-banner catalog-banner-head" style="display: none;" data-start="" data-end="">
                                    <a href="http://www.kidsplaza.vn/search/result/?q=navy+star"> <img src="//k.r.worldssl.net/media/catalog/category/banner-danh-muc_3.png" /> </a>
                                </div>
                                <div>
                                    <h1 class="page-title">Đồ chơi cho bé</h1>

                                </div>
                                <ul class="messages ispeed-messages"></ul>
                                <div class="category-products">
                                    <ul class="show-grid grid-4 products-grid">

                                        <%
                                            SANPHAM_DAO sp_dao = new SANPHAM_DAO();
                                            ArrayList<SANPHAM> list_sp = new ArrayList<SANPHAM>();
                                            try {
                                                list_sp = (ArrayList<SANPHAM>) request.getAttribute("DanhSachSanPham");
                                            } catch (Exception e) {

                                            }

                                            for (SANPHAM sp : list_sp) {
                                        %>
                                        <li class="item first odd">
                                            <a href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>" class="product-image" target="_blank"> <img src="<%=sp.getHinhAnh()[0]%>" width="160" height="160" alt="Xúc xắc vòng tròn Canpol 2/896" /> </a>
                                            <h3 class="product-name"> <a href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>" target="_blank"> <%=sp.getTenSanPham()%> </a></h3>
                                            <div class="price-gift">
                                                <div class="price-box-outer">
                                                    <div class="price-box"> <span id="product-price-44868" class="regular-price"> <span class="price"><%=sp.getDonGiaString()%> ₫</span> </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%}%>
                                        <%
                                            if (list_sp.isEmpty()) {
                                        %>
                                        <h4>Không tìm thấy sản phẩm nào<h4>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div class="toolbar-bottom">
                                    <div class="toolbar" role="toolbar">
                                        <%
                                            if (list_sp.size() >= 12) {
                                                int start = 0;
                                                try {
                                                    start = (Integer) request.getAttribute("start");
                                                } catch (Exception e) {
                                                    start = 0;
                                                }
                                                if (start != -1) {
                                        %>
                                        <a href="PhanTrang?start=<%=start%>" method="GET">
                                            <button class="btn btn-primary">Xem thêm nhiều sản phẩm</button> 
                                        </a>
                                        <%}
                                            }%>
                                    </div>
                                </div><a href='#ajaxcart' class="fancybox1" id="fancybox1" style="display:none;">click</a>
                                <div style="display:none;">
                                    <div class="ajaxcart" id="ajaxcart">
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    <div id="cart-messages"> <span id="m-success"></span></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-bottom: 10px;"><strong>Bạn có <span id="cart-totals"></span> sản phẩm trong giỏ hàng.</strong></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div id="cart-content-after"></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <div id="cart-total"></div>
                                                </td>
                                            </tr>
                                            <tr>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                
                                <div class="after-content"></div>
                            </div>
                            <div class="col-left sidebar col-lg-3 col-md-3 col-sm-3 col-pull-3 hidden-xs ">
                                <div class="col-left-center">
                                    <div class="col-left-top">
                                        <div class="col-left-bottom">
                                            <div class="block block-layered-nav">
                                                <div class="block-content">
                                                    <div class="layered-filter-box">
                                                        <dl id="narrow-by-list-category" class="narrow-by-list" style="margin: 20px">

                                                            <ol>
                                                                <%
                                                                    LOAISANPHAM_DAO dao_loaisp = new LOAISANPHAM_DAO();
                                                                    ArrayList<LOAISANPHAM> list = dao_loaisp.getLoaiSanPham();

                                                                    for (LOAISANPHAM loai : list) {

                                                                        if (loai.getDanhMucCha().length() == 0) {

                                                                            ArrayList<LOAISANPHAM> list2 = dao_loaisp.getLoaiSanPhamCon(loai.getMaLoaiSanPham(), list);
                                                                            if (list2.size() == 0) {
                                                                %>
                                                                <li> <a href="XemDanhMuc?MaLoai=<%=loai.getMaLoaiSanPham()%>"> <%=loai.getTenLoaiSanPham()%> </a> </li>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                <li> 
                                                                    <a href="XemDanhMuc?MaLoai=<%=loai.getMaLoaiSanPham()%>"> <%=loai.getTenLoaiSanPham()%> </a>
                                                                    <div class="children-level-2">
                                                                        <ol>
                                                                            <%
                                                                                for (int i = 0; i < list2.size(); i++) {
                                                                            %>
                                                                            <li> <a href="XemDanhMuc?MaLoai=<%=list2.get(i).getMaLoaiSanPham()%>"> <%=list2.get(i).getTenLoaiSanPham()%></a></li>
                                                                                <%}%>
                                                                        </ol>

                                                                    </div>
                                                                </li>

                                                                <%}
                                                                        }
                                                                    }%>
                                                            </ol>

                                                    </div>
                                                    <div class="layered-filter-box">
                                                        <dl id="narrow-by-list-attribute" class="narrow-by-list"><dt id="layer-filter-brand" class="expand"> <label> Thương hiệu <i id="layer-filter-brand-icon" class="fa fa-sort-desc"></i> </label></dt>
                                                            <dd id="layer-filter-brand-data" class="layer-filter-data">
                                                                <div class="panel-body">
                                                                    <ol class="list mtfilter_layer_filter_attribute">
                                                                        <%
                                                                            NHASANXUAT_DAO nsx_dao = new NHASANXUAT_DAO();
                                                                            ArrayList<NHASANXUAT> list_sx = nsx_dao.getSoLuong();
                                                                            for (NHASANXUAT sx : list_sx) {
                                                                        %>
                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name" href="XemNhaSanXuat?MaNSX=<%=sx.getMaNSX()%>" title="<%=sx.getTenNSX()%>"> <i class="fa fa-square-o"></i> <%=sx.getTenNSX()%> </a> <span class="filter-item-name-normalize" style="display: none"> <%=sx.getTenNSX()%> </span><span class="badge pull-right">(<%=sx.getSoLuong()%>)</span>
                                                                        </li>
                                                                        <%}%>
                                                                    </ol>
                                                                </div>
                                                            </dd>


                                                            <dt id="layer-filter-xuat-xu" class="expand"> <label> Xuất xứ <i id="layer-filter-xuat-xu-icon" class="fa fa-sort-desc"></i> </label></dt>

                                                            <!--Xuất xứ-->
                                                            <dd id="layer-filter-xuat-xu-data" class="layer-filter-data">
                                                                <div class="panel-body">
                                                                    <ol class="list mtfilter_layer_filter_attribute">
                                                                        <%
                                                                            for (NHASANXUAT sx : list_sx) {
                                                                        %>
                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name " href="XemNhaSanXuat?MaNSX=<%=sx.getMaNSX()%>" title="<%=sx.getQuocGia()%>"> <i class="fa fa-square-o"></i> <%=sx.getQuocGia()%> </a> <span class="filter-item-name-normalize" style="display: none"> <%=sx.getQuocGia()%> </span><span class="badge pull-right">(<%=sx.getSoLuong()%>)</span></li>
                                                                            <%}%>
                                                                    </ol>
                                                                </div>
                                                            </dd>

                                                            <dt id="layer-filter-price" class="expand"> <label> Giá <i id="layer-filter-price-icon" class="fa fa-sort-desc"></i> </label></dt>
                                                            <dd id="layer-filter-price-data" class="layer-filter-data">
                                                                <div class="panel-body">
                                                                    <ol class="list mtfilter_layer_filter_price">
                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name " href="XemGiaTien?begin=0&end=100000" title="0 ₫ - 100.000 ₫"> 
                                                                                <i class="fa fa-square-o"></i>
                                                                                <span class="price">0 ₫</span> - <span class="price">100.000 ₫</span> 
                                                                            </a> 
                                                                            <span class="filter-item-name-normalize" style="display: none"> 
                                                                                <span class="price">0 ₫</span> - <span class="price">100.000 ₫</span> </span><span class="badge pull-right">(<%=sp_dao.SoLuong(0, 100000)%>)</span>
                                                                        </li>

                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name " href="XemGiaTien?begin=100000&end=200000"
                                                                               title="100.000 ₫ - 200.000 ₫"> <i class="fa fa-square-o"></i> <span class="price">100.000 ₫</span> - <span class="price">200.000 ₫</span> </a> <span class="filter-item-name-normalize" style="display: none"> <span class="price">100.000 ₫</span>  - <span class="price">200.000 ₫</span> </span><span class="badge pull-right">(<%=sp_dao.SoLuong(100000, 200000)%>)</span>
                                                                        </li>

                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name " href="XemGiaTien?begin=200000&end=300000"
                                                                               title="200.000 ₫ - 300.000 ₫"> <i class="fa fa-square-o"></i> <span class="price">200.000 ₫</span> - <span class="price">300.000 ₫</span> </a> <span class="filter-item-name-normalize" style="display: none"> <span class="price">200.000 ₫</span>  - <span class="price">300.000 ₫</span> </span><span class="badge pull-right">(<%=sp_dao.SoLuong(200000, 300000)%>)</span>
                                                                        </li>

                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name " href="XemGiaTien?begin=300000&end=400000"
                                                                               title="300.000 ₫ - 400.000 ₫"> <i class="fa fa-square-o"></i> <span class="price">300.000 ₫</span> - <span class="price">400.000 ₫</span> </a> <span class="filter-item-name-normalize" style="display: none"> <span class="price">300.000 ₫</span>  - <span class="price">400.000 ₫</span> </span><span class="badge pull-right">(<%=sp_dao.SoLuong(300000, 400000)%>)</span>
                                                                        </li>

                                                                        <li class="filter-item">
                                                                            <a class="filter-item-name " href="XemGiaTien?begin=400000&end=0"
                                                                               title="400.000 ₫ - more"> <i class="fa fa-square-o"></i> <span class="price">400.000 ₫</span> - <span class="price">More</span> </a> <span class="filter-item-name-normalize" style="display: none"> <span class="price">300.000 ₫</span>  - <span class="price">More</span> </span><span class="badge pull-right">(<%=sp_dao.SoLuongMore(400000)%>)</span>
                                                                        </li>
                                                                    </ol>
                                                                </div>
                                                            </dd>
                                                            <!--                                                            <dt id="layer-filter-gioi-tinh" class="expand"> <label> Giới tính <i id="layer-filter-gioi-tinh-icon" class="fa fa-sort-desc"></i> </label></dt>
                                                                                                                        <dd id="layer-filter-gioi-tinh-data" class="layer-filter-data">
                                                                                                                            <div class="panel-body">
                                                                                                                                <ol class="list mtfilter_layer_filter_attribute">
                                                                                                                                    <li class="filter-item">
                                                                                                                                        <a class="filter-item-name " href="http://www.kidsplaza.vn/do-choi-cho-be.html?gclid=Cj0KEQiA88TFBRDYrOPKuvfY2pIBEiQA97Z8MXn9qVK6AwuH2vB1paJGANNcZELRxkh_NIpGJznXL4QaAvwL8P8HAQ&amp;sex=2440&amp;utm_medium=keyword&amp;utm_source=%5BGA%5D_none-do-choi-cho-be-v1A-cpc"
                                                                                                                                           title="Bé trai, Bé gái"> <i class="fa fa-square-o"></i> Bé trai, Bé gái </a> <span class="filter-item-name-normalize" style="display: none"> Be trai, Be gai </span><span class="badge pull-right">(11)</span></li>
                                                                                                                                </ol>
                                                                                                                            </div>
                                                                                                                        </dd>
                                                            
                                                                                                                        <dt id="layer-filter-khuyen-mai" class="expand"> <label> Khuyến mãi <i id="layer-filter-khuyen-mai-icon" class="fa fa-sort-desc"></i> </label></dt>
                                                                                                                        <dd id="layer-filter-khuyen-mai-data" class="layer-filter-data">
                                                                                                                            <div class="panel-body">
                                                                                                                                <ol class="list discountfilter_catalog_layer_filter_discount">
                                                                                                                                    <li class="filter-item">
                                                                                                                                        <a class="filter-item-name " href="http://www.kidsplaza.vn/do-choi-cho-be.html?discount=1&amp;gclid=Cj0KEQiA88TFBRDYrOPKuvfY2pIBEiQA97Z8MXn9qVK6AwuH2vB1paJGANNcZELRxkh_NIpGJznXL4QaAvwL8P8HAQ&amp;utm_medium=keyword&amp;utm_source=%5BGA%5D_none-do-choi-cho-be-v1A-cpc"
                                                                                                                                           title="Đang giảm giá"> <i class="fa fa-square-o"></i> Đang giảm giá </a> <span class="filter-item-name-normalize" style="display: none"> Dang giam gia </span><span class="badge pull-right">(44)</span></li>
                                                                                                                                </ol>
                                                                                                                            </div>
                                                                                                                        </dd>-->

                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="after-main"></div>
                    </div>
                    <div class="ht-container-outer">
                        <div class="promotions-blocks hidden-xs">
                            <a class="saleoffs-block" target="_blank" href="TrangChu" style="display: block;" alt="Con là số 1"> <img src="images/line-con-la-so-1.png" /> </a>
                        </div>
                        <div class="ht-container">
                            <div class="ht-inner">
                                <div class="ht-left">
                                    <div class="store-location">
                                        <ul>
                                            <li id="header_promotion_tab_01" class="mini-logo">
                                                <a href="TrangChu"><img src="images/mini-logo.png" /></a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <header id="header" style="margin-top: 65px">
                        <div class="container">
                            <div class="header-mid">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 header-mid-left">
                                        <a href="TrangChu" title="Hệ thống siêu thị Mẹ và Bé Kids Plaza" class="logo"> <img src="images/logo_new.png" alt="Hệ thống siêu thị Mẹ và Bé Kids Plaza" /> </a>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 header-mid-right">
                                        <div class="row">
                                            <div class="foothead">
                                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 foothead-left">

                                                    <form id="search_mini_form" action="TimKiem" method="get" class="UI-SEARCHAUTOCOMPLETE" data-tip="Bố mẹ tìm gì cho bé hôm nay" data-url="http://www.kidsplaza.vn/search/result/ajax/" data-minchars="3" data-delay="500">
                                                        <div class="input-group top-search"> <input disabled="disabled" id="category_search" type="hidden" name="cat" value="" /><input id="search" type="text" name="search" value="" class="form-control input-text UI-SEARCH UI-NAV-INPUT" maxlength="888888"
                                                                                                                                                                                        /> <span class="input-group-btn"> <button type="submit" title="Tìm kiếm" class="btn btn-kid btn-seach"> <span class="ico-search"><span></span></span>
                                                                </button>
                                                            </span>
                                                            <div class="searchautocomplete-loader UI-LOADER" style="display:none;"></div>
                                                        </div>
                                                        <div style="display:none" id="search_autocomplete" class="UI-PLACEHOLDER search-autocomplete"></div>
                                                    </form>
                                                </div>
                                                <div class="locatis col-lg-4 col-md-4 hidden-sm hidden-xs foothead-right">
                                                    <div class="row cart-top-right">
                                                        <div id="top_login" class="top-login pull-left">
                                                            <%
                                                                String status = "";
                                                                String Email = "null";
                                                                try {
                                                                    status = (String) request.getAttribute("status");
                                                                    Email = (String) request.getSession().getAttribute("Email");

                                                                } catch (Exception e) {

                                                                }

                                                                String name = "";
                                                                try {
                                                                    if (Email.equals("null") == false) {
                                                                        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
                                                                        KHACHHANG kh2 = kh_dp.getKhachHang(Email);
                                                                        name = kh2.getTenKhachHang();
                                                                    }
                                                                } catch (Exception e) {
                                                                    name = "";
                                                                }
                                                            %>
                                                            <div class="toplogin" id="topLogin">
                                                                <div class="right-login hidden-sm hidden-xs">
                                                                    <p class="p-account-link">
                                                                        <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>" class="account-icon-link"> <span class="ico-user"><span></span></span> <span class="link-box"> Xin chào <%=name%><strong> <span id="account_link_id">Tài khoản</span> <span class="caret"></span> </strong>
                                                                            </span>
                                                                        </a>
                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div id="login_content">
                                                                <div id="customer_menu_links">
                                                                    <ul>
                                                                        <li> <i class="glyphicon glyphicon-user"></i> <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>">Tài khoản của tôi</a></li>                            
                                                                        <li> <i class="glyphicon glyphicon-log-out"></i> <a href="DangXuat">Đăng xuất</a></li>
                                                                    </ul>
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="vr"></div>
                                                        <div class="top-cart" id="cart-top" data-title="Sản phẩm vừa thêm">
                                                            <a class="cart-content hidden-sm  hidden-xs" href="GioHang.jsp"> <span class="ico-cart"> <span id="cart_summary_qty" class="cart-summary" style="display: none;">0</span> </span>
                                                            </a>
                                                            <div class="cart-items" style="display: none">
                                                                <div id="cart_items_not_empty" style="display: none;">
                                                                    <div id="cart_items_not_empty_inner" style="display: none;"></div>
                                                                    <div class="cart-action"> <span id="cart_summary_total" class="cart-total pull-left">0</span> <a href="http://www.kidsplaza.vn/checkout/onepage/">Tiến Hành Thanh toán&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a></div>
                                                                </div>
                                                                <div id="cart_items_empty" style="display: none;">
                                                                    <p class="empty">Không có sản phẩm nào</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="divheight clearfix"></div>   
                    </header>
                    <footer id="footer">
                        <div id="footer_inner">
                            <div class="footer-top">

                            </div>

                            <div class="clearfix"></div>
                            <div class="page-tags" style="color: #fff; text-align: center; padding-top: 10px;"></div>
                            <div class="clearfix"></div>
                            <div class="switch-device" style="padding-bottom:20px;"> <a id="switch-to-mobile">
                                    Copyright Kid Plaza
                                </a></div>
                        </div>
                    </footer>

                    <div id="back-to-top" class="back-to-top" style="display: none;">
                        <div class="btt-inner"> <a href="#" title="Lên đầu trang"><span>Lên đầu trang</span></a></div>
                    </div>
                </div>
            </section>
        </section>

    </body>

</html>
