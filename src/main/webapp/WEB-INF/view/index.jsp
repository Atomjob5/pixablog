<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Photomedia</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="${ctx}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${ctx}/css/magnific-popup.css">
    <link rel="stylesheet" href="${ctx}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/css/themify-icons.css">
    <link rel="stylesheet" href="${ctx}/css/nice-select.css">
    <link rel="stylesheet" href="${ctx}/css/flaticon.css">
    <link rel="stylesheet" href="${ctx}/css/animate.css">
    <link rel="stylesheet" href="${ctx}/css/slicknav.css">
    <link rel="stylesheet" href="${ctx}/css/style.css">
    <!-- <link rel="stylesheet" href="${ctx}/css/responsive.css"> -->
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<input type="hidden" id="lastest" value="${lastest == null ? 6 : lastest}">
<input type="hidden" id="ctx" value="${ctx}">


<!-- header-start -->
<header>
    <div class="header-area ">
        <div id="sticky-header" class="main-header-area white-bg">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-7 col-lg-7">
                        <div class="main-menu  d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a class="active" href="index.jsp">主页</a></li>
                                    <li><a href="#mostLikes">最多点赞</a></li>
                                    <li><a href="#popularNow">当下流行</a></li>
                                    <li><a href="#history">历史画廊</a></li>
                                    <li><a href="#feedback">图片分享</a></li>
                                    <li class="dropdown-divider" role="separator"></li>
                                    <c:if test="${user==null}">
                                        <li><a href="#">行为<i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="#">登陆</a></li>
                                                <li><a href="#">注册</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                    <c:if test="${user!=null}">
                                        <li><a href="#">行为<i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="${ctx}/user/logout.do">Logout</a>/li>
                                            </ul>
                                        </li>
                                    </c:if>

                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-5">
                        <div class="login_resiter d-none d-lg-block">
                            <c:if test="${user!=null}">
                                <p><a href="#"><i class="flaticon-user"></i>${user.name}</a> | <a
                                        href="${ctx}/user/logout.do">Logout</a></p>
                            </c:if>
                            <c:if test="${user==null}">
                                <p><a href="${ctx}/page/toLogin.do"><i class="flaticon-user"></i>login</a> | <a
                                        href="#">Resister</a></p>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header-end -->

<!-- welcome_protomedia_start -->
<div class="welcome_protomedia">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-md-6">
                <h2>
                    在 <span>${instagramCount}</span> 幅创意内容里寻找灵感
                </h2>
                <h3>
                    历史最高点赞的图片
                </h3>
            </div>
        </div>
    </div>
</div>
<!-- welcome_protomedia_end -->

<!-- 最多点赞 -->
<div class="photographi_area" id="mostLikes">
    <div class="container">
        <div class="row">
            <c:forEach items="${mostLikesList}" var="v">
                <div class="col-xl-6 col-md-6">
                    <div class="single_photography photography_bg_1" style="background-image: url('${ctx}${v.url}')">
                        <div class="info">
                            <div class="info_inner">
                                <h3><a href="#">${v.title}</a></h3>
                                <div class="date_catagory d-flex align-items-center justify-content-between">
                                    <fmt:formatDate value="${v.createTime}" pattern="MMMM dd yyyy" var="time"/>
                                    <span>${time}</span>
                                    <span class="catagory"><a pic_id="${v.id}" class="user_like"><img
                                            src="${ctx}/img/elements/unlike.png" alt="unlike"></a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- 最多点赞 -->

<!-- photography_slider_area_start -->
<%--<div class="photography_slider_area">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="photoslider_active owl-carousel">
                    <div class="single_photography">
                        <img src="${ctx}/img/photography/single-1.jpg" alt="">
                        <div class="photo_title">
                            <h4>Photography</h4>
                        </div>
                    </div>
                    <div class="single_photography">
                        <img src="${ctx}/img/photography/single-2.jpg" alt="">
                        <div class="photo_title">
                            <h4>Travel Shot</h4>
                        </div>
                    </div>
                    <div class="single_photography">
                        <img src="${ctx}/img/photography/single-3.jpg" alt="">
                        <div class="photo_title">
                            <h4>Photoshop</h4>
                        </div>
                    </div>
                    <div class="single_photography">
                        <img src="${ctx}/img/photography/single-4.jpg" alt="">
                        <div class="photo_title">
                            <h4>Lens</h4>
                        </div>
                    </div>
                    <div class="single_photography">
                        <img src="${ctx}/img/photography/single-1.jpg" alt="">
                        <div class="photo_title">
                            <h4>Photography</h4>
                        </div>
                    </div>
                    <div class="single_photography">
                        <img src="${ctx}/img/photography/single-2.jpg" alt="">
                        <div class="photo_title">
                            <h4>Travel Shot</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<!-- photography_slider_area_end -->

<!-- 最新发布 -->
<div class="most_recent_blog" id="popularNow">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title mb-33">
                    <h3>当下发布的照片</h3>
                </div>
            </div>
            <div class="col-xl-12 col-md-12">
                <div class="row">
                    <c:forEach items="${currentList}" var="v">
                        <div class="col-xl-4 col-md-4">
                            <div class="single_blog">
                                <div class="blog_thumb">
                                    <a href="#">
                                        <img src="${ctx}${v.url}" alt="">
                                    </a>
                                    <span class="col-form-label-sm"></span>
                                </div>
                                <div class="blog_meta">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <p>
                                                <fmt:formatDate value="${v.createTime}" pattern="MMMM dd  yyyy"
                                                                var="time"/>
                                                <a href="#">${v.sysUser.name} | ${time} </a><span
                                                    class="badge badge-success" id="likesBadge${v.id}">${v.likes}
                                                <c:if test="${v.likes!=null}"> likes</c:if> </span>
                                            </p>
                                            <a pic_id="${v.id}" class="user_like"><img
                                                    src="${ctx}/img/elements/unlike.png" alt="unlike"></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12">
                                            <h3><a href="#">${v.title}</a></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                    <div class="col-xl-12">
                        <div class="btn_area text-center">
                            <a class="boxed-btn" id="loadMore">Load More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 最新发布 -->


<!-- 上个月最多点赞 -->
<div class="photo_gallery" id="history">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title mb-33">
                    <h3>历史上榜图片</h3>
                </div>
            </div>
            <div class="col-xl-12">
                <div class="photo_gallery_active owl-carousel">
                    <c:forEach items="${historyMostLikesList}" var="v">
                        <div class="single_photo_gallery" style="background-image: url('${ctx}${v.url}')">
                            <div class="photo_caption">
                                <h3>${v.title}</h3>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 上个月最多点赞 -->


<!-- 上传图片 -->
<div class="subscribe_newsletter" id="feedback">
    <div class="container">
        <div class="black_bg">
            <div class="row">
                <div class="col-xl-6">
                    <div class="newsletter_text">
                        <h3>
                            图片分享
                        </h3>
                        <p>上传并与其他人分享你的图片</p>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="newsform">
                        <c:if test="${user == null}">
                            <input type="text" placeholder="登陆来上传图片..." disabled>
                            <button type="button" id="login_btn">登陆账号</button>

                        </c:if>
                        <c:if test="${user != null}">
                            <input type="text" placeholder="点击这里来上传你的图片..." disabled>
                            <button type="button" data-toggle="modal" data-target="#ModalUploadImg">选择图片</button>

                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 上传图片 -->



<%--图片上传弹出框--%>
<!-- Modal -->
<!-- Modal -->
<div class="modal fade" id="ModalUploadImg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">上传图片</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <form action="${ctx}/picture/upload.do" enctype="multipart/form-data" method="post">
                <div class="modal-body">
                    <input type="hidden" name="userId" value="${user.id}" class="form-control"/>
                    <input type="text" name="description" placeholder="图片描述" class="form-control" required/>
                    <input type="file" name="file" class="form-control-file" required/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </form>

        </div>
    </div>
</div>
<%--图片上传弹出框--%>



<!-- footer_start -->
<footer class="footer">
    <div class="footer_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="footer_info text-center">
                        <h1 class="footer_title">
                            Pixablog
                        </h1>
                        <p class="footer_text">
                            探索图片博客，获取灵感
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer_bottom ">
        <div class="container">
            <div class="footer_border">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="footer_links text-center">
                            <ul>
                                <li><a href="index.jsp">home</a></li>
                                <li><a href="catagory.html">category</a></li>
                                <li><a href="about.html">about</a></li>
                                <li><a href="contact.html">contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright_text text-center">
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                | 图片博客
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </p>
        </div>
    </div>
</footer>
<!-- footer_end -->


<!-- JS here -->
<script src="${ctx}/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="${ctx}/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${ctx}/js/popper.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/owl.carousel.min.js"></script>
<script src="${ctx}/js/isotope.pkgd.min.js"></script>
<script src="${ctx}/js/ajax-form.js"></script>
<script src="${ctx}/js/waypoints.min.js"></script>
<script src="${ctx}/js/jquery.counterup.min.js"></script>
<script src="${ctx}/js/imagesloaded.pkgd.min.js"></script>
<script src="${ctx}/js/scrollIt.js"></script>
<script src="${ctx}/js/jquery.scrollUp.min.js"></script>
<script src="${ctx}/js/wow.min.js"></script>
<script src="${ctx}/js/nice-select.min.js"></script>
<script src="${ctx}/js/jquery.slicknav.min.js"></script>
<script src="${ctx}/js/jquery.magnific-popup.min.js"></script>
<script src="${ctx}/js/plugins.js"></script>

<!--contact js-->
<script src="${ctx}/js/contact.js"></script>
<script src="${ctx}/js/jquery.ajaxchimp.min.js"></script>
<script src="${ctx}/js/jquery.form.js"></script>
<script src="${ctx}/js/jquery.validate.min.js"></script>
<script src="${ctx}/js/mail-script.js"></script>

<script src="${ctx}/js/main.js"></script>

<script>
    var add = function (id, title, date, name, likes, url) {
        //日期格式化
        var month = new Array(12);
        month[0] = "January";
        month[1] = "February";
        month[2] = "March";
        month[3] = "April";
        month[4] = "May";
        month[5] = "June";
        month[6] = "July";
        month[7] = "August";
        month[8] = "September";
        month[9] = "October";
        month[10] = "November";
        month[11] = "December";
        date = new Date(date);
        date = " | " + month[date.getMonth()] + " " + date.getDay() + " " + date.getFullYear();
        //点赞数格式化
        if (likes > 0) {
            likes = likes + ' likes';
        } else if (likes == 0) {
            likes = '';
        }
        //地址格式化
        url = $('#ctx').val() + "/" + url;
        //添加节点
        var blog_thumb = $('<div class="blog_thumb">\n' +
            '                                <a href="#">\n' +
            '                                    <img src="' + url + '" alt="">\n' +
            '                                </a>\n' +
            '                                <span class="col-form-label-sm"></span>\n' +
            '                            </div>');

        var blog_meta = $('<div class="blog_meta">\n' +
            '                                <div class="row">\n' +
            '                                    <div class="col-xl-12 col-md-12 col-sm-12">\n' +
            '                                        <p>\n' +
            '                                            <a href="#">' + name + ' ' + date + ' </a><span class="badge badge-success" id="likesBadge' + id + '">' + likes + '</span>\n' +
            '                                        </p>\n' +
            '                                        <a pic_id="' + id + '" class="user_like"><img src="${ctx}/img/elements/unlike.png" alt="unlike"></a>\n' +
            '                                    </div>\n' +
            '                                </div>\n' +
            '                                <div class="row">\n' +
            '                                    <div class="col-xl-12 col-md-12">\n' +
            '                                        <h3><a href="#">' + title + '</a></h3>\n' +
            '                                    </div>\n' +
            '                                </div>\n' +
            '                            </div>');

        var divI = $('<div class="col-xl-4 col-md-4 wrapper-load"></div>');
        var divII = $('<div class="single_blog"></div>');
        blog_thumb.appendTo(divII);
        blog_meta.appendTo(divII);
        divII.appendTo(divI);

        $('#loadMore').parent().parent().before(divI);
    };

    /**
     * 加载图片
     */
    $('#loadMore').click(function () {
        //获取项目名称
        var ctx = $('#ctx').val();
        //获取当前最后一个图片的id
        var lastest = $('#lastest').val();
        //通过最后一个图片的id，获取下一组图片列表
        $.post(
            ctx + "/picture/getNextPictures.do",
            {limit: lastest},
            function (data, status) {
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        add(data[i].id, data[i].title, data[i].createTime, data[i].sysUser.name, data[i].likes, data[i].url);
                    }
                    //更改最后一个图片id
                    $('#lastest').val(parseInt(lastest) + 6);
                } else {
                    //隐藏按钮
                    $('#loadMore')[0].style.display = 'none';
                }

            }
        );

    });

    /**
     * 点赞
     */
    $(document).on('click', '.user_like', function () {
        //获取当前对象
        var t = this;
        //获取项目名称
        var ctx = $('#ctx').val();
        //获取图片的id
        var picId = $(this).attr('pic_id');

        $.post(
            ctx + '/picture/like.do',
            {'id': picId},
            function (data, status) {
                console.log(data);
                if (data.status == '1') {
                    var k = t.children[0];
                    k.src = ctx + '/img/elements/like.png';
                    k.alt = 'like';
                    if ($('#likesBadge' + picId)[0] != null) {
                        $('#likesBadge' + picId)[0].innerText = data.likes + ' likes';
                    }
                } else if (data.status == 'toLogin') {
                    window.location = ctx + '/page/toLogin.do';
                }
            }
        );
    })

    /**
     * 登陆按钮
     */
    $("#login_btn").click(function () {
        window.location = $('#ctx').val() + "/page/toLogin.do";
    })
</script>

</body>

</html>