<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/4
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<head>
    <title>Home</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <%
        String path = request.getRequestURI();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        String username = "User";
        try {
            if (session.getAttribute("username") != null)
                username = (String) session.getAttribute("username");
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("username", username);
    %>
    <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                       user="root" password="software"/>
    <sql:query dataSource="${snapshot}" var="result1">
        select Pname,sum(Pnum) as num from test.order_content o1 where Pname in
        (select distinct Pname from test.order_content o2) group by Pname order by num desc limit 6;
    </sql:query>

    <sql:query dataSource="${snapshot}" var="result2">
        select Pname,sum(Pnum) as num from test.order_content o1 where Pname in
        (select distinct Pname from test.order_content o2) group by Pname order by num desc limit 7,12;
    </sql:query>
    <base href="<%=basePath%>">
    <link href="Index/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="Index/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- font-awesome icons -->
    <link href="Index/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- js -->
    <script src="Index/js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="Index/js/move-top.js"></script>
    <script type="text/javascript" src="Index/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('jsp,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <script type="text/javascript">
    function  sub(name){
        $.ajax({
            type:"GET",
            url:"/Customer/add_cart.jsp?name="+name,
            data:{username:$("#name").val()},
            statusCode: {404: function() {
                    alert('page not found'); }
            },
            success:function(data,textStatus){
                $("#sp").html(data);
            }
        });
    }
</script>
    <!-- start-smoth-scrolling -->
</head>

<body>
<!-- header -->
<div class="agileits_header">
    <div class="container">
        <div class="w3l_offers">
            <p>Welcome To Coffee </p>
        </div>
        <div class="agile-login">

            <ul>
                <li><a href="/Customer/login.jsp"><%=username%> </a></li>
                <li><a href="/Admin/login.jsp">Administrator</a></li>
                <li><a href="/Customer/contact.jsp">Contact</a></li>
                <li><a href="Signout.jsp">Sign Out</a></li>

            </ul>
        </div>
        <div class="product_list_header">
            <form action="#" method="post" class="last">
                <input type="hidden" name="cmd" value="_cart">
                <input type="hidden" name="display" value="1">
                <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down"
                                                                                    aria-hidden="true"></i></button>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="logo_products">
    <div class="container">
        <div class="w3ls_logo_products_left1">
            <ul class="phone_email">
                <li><i class="fa fa-phone" aria-hidden="true"></i>Order online or call us : (+0592) 123 4567</li>
            </ul>
        </div>
        <div class="w3ls_logo_products_left">
            <h1><a href="index.jsp">Come For Café</a></h1>
        </div>
        <div class="w3l_search">
            <form action="/Customer/search.jsp" method="post">
                <input type="search" name="Search" placeholder="Search for a Product..." required="">
                <button type="submit" class="btn btn-default search" aria-label="Left Align">
                    <i class="fa fa-search" aria-hidden="true"> </i>
                </button>
                <div class="clearfix"></div>
            </form>
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<!-- //header -->
<!-- navigation -->
<div class="navigation-agileits">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                        data-target="#bs-megadropdown-tabs">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp" class="act">Home</a></li>
                    <li class="active"><a href="/Customer/menu.jsp" class="act">Menu</a></li>
                    <li><a href="/Customer/offers.jsp">Offers</a></li>
                    <li><a href="/Customer/cart.jsp">Cart</a></li>
                    <li><a href="/Customer/account.jsp">My Account</a></li>
                    <li><a href="/Customer/about.jsp">About</a></li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<!-- //navigation -->
<!-- main-slider -->
<ul id="demo1">
    <li>
        <img src="Index/images/11.jpg" alt=""/>
        <!--Slider Description example-->
        <div class="slide-desc">
            <h3>Buy Coffee Products Are Now OnLine With Us</h3>
        </div>
    </li>
    <li>
        <img src="Index/images/22.jpg" alt=""/>
        <div class="slide-desc">
            <h3>Whole Coffee Products Are Now OnLine With Us</h3>
        </div>
    </li>

    <li>
        <img src="Index/images/44.jpg" alt=""/>
        <div class="slide-desc">
            <h3>Whole Coffee Products Are Now OnLine With Us</h3>
        </div>
    </li>
</ul>
<!-- //main-slider -->
<!-- //top-header and slider -->
<!-- top-brands -->
<div class="top-brands">
    <div class="container">
        <h2>Top selling offers</h2>
        <div class="grid_3 grid_5">
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab"
                                                              data-toggle="tab" aria-controls="expeditions"
                                                              aria-expanded="true">All Products</a></li>
                    <li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab"
                                               aria-controls="tours">Daily Offers</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="expeditions"
                         aria-labelledby="expeditions-tab">
                        <div class="agile-tp">
                            <h5>All Products</h5>
                            <p class="w3l-ad">We've pulled together all our advertised offers into one place, so you
                                won't miss out on a great deal.</p>
                        </div>

                        <div class="agile_top_brands_grids">
                            <c:forEach var="row1" items="${result1.rows}">
                                <sql:query dataSource="${snapshot}" var="subresult1">
                                    SELECT * from product WHERE Pname = "${row1.Pname}";
                                </sql:query>
                                <c:forEach var="subrow1" items="${subresult1.rows}">
                                    <div class="col-md-4 top_brand_left">
                                        <div class="hover14 column">
                                            <div class="agile_top_brand_left_grid">
                                                <div class="agile_top_brand_left_grid1">
                                                    <figure>
                                                        <div class="snipcart-item block">
                                                            <div class="snipcart-thumb">
                                                                <a href="Customer/detail.jsp?pname=${subrow1.Pname}"><img
                                                                        width="200px" height="200px"
                                                                        src="../${subrow1.Pdescription_img}"></a>
                                                                <p>${subrow1.Pname}</p>
                                                                <h4>$${subrow1.Pprice_v}<span>$${subrow1.Pprice}</span>
                                                                </h4>
                                                            </div>
                                                            <div class="snipcart-details top_brand_home_details">
                                                                <form action="#" method="post">
                                                                    <fieldset>
                                                                        <input type="hidden" name="cmd" value="_cart">
                                                                        <input type="hidden" name="add" value="1">
                                                                        <input type="hidden" name="item_name"
                                                                               value="${subrow1.Pname}">
                                                                        <input type="hidden" name="amount"
                                                                               value="${subrow1.Pprice_v}">
                                                                        <input type="hidden" name="currency_code"
                                                                               value="USD">
                                                                        <input  type="submit" name="submit" value="Add to cart" class="button"  onclick="sub('${subrow1.Pname}')">
                                                                    </fieldset>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:forEach>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
                        <div class="agile-tp">
                            <h5>Daily Offers</h5>
                            <p class="w3l-ad">We've pulled together all our advertised offers into one place, so you
                                won't miss out on a great deal.</p>
                        </div>

                        <div class="agile_top_brands_grids">
                            <c:forEach var="row1" items="${result2.rows}">
                                <sql:query dataSource="${snapshot}" var="subresult2">
                                    SELECT * from product WHERE Pname = "${row1.Pname}";
                                </sql:query>
                                <c:forEach var="subrow1" items="${subresult2.rows}">
                                    <div class="col-md-4 top_brand_left">
                                        <div class="hover14 column">
                                            <div class="agile_top_brand_left_grid">
                                                <div class="agile_top_brand_left_grid1">
                                                    <figure>
                                                        <div class="snipcart-item block">
                                                            <div class="snipcart-thumb">
                                                                <a href="Customer/detail.jsp?pname=${subrow1.Pname}"><img
                                                                        width="200px" height="200px"
                                                                        src="../${subrow1.Pdescription_img}"></a>
                                                                <p>${subrow1.Pname}</p>
                                                                <h4>$${subrow1.Pprice_v}<span>$${subrow1.Pprice}</span>
                                                                </h4>
                                                            </div>
                                                            <div class="snipcart-details top_brand_home_details">
                                                                <form action="#" method="post">
                                                                    <fieldset>
                                                                        <input type="hidden" name="cmd" value="_cart">
                                                                        <input type="hidden" name="add" value="1">
                                                                        <input type="hidden" name="item_name"
                                                                               value="${subrow1.Pname}">
                                                                        <input type="hidden" name="amount"
                                                                               value="${subrow1.Pprice_v}">
                                                                        <input type="hidden" name="currency_code"
                                                                               value="USD">
                                                                        <input  type="submit" name="submit" value="Add to cart" class="button"  onclick="sub('${subrow1.Pname}')">
                                                                    </fieldset>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:forEach>

                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //top-brands -->


<!-- new -->
<div class="newproducts-w3agile">
    <div class="container">
        <h3>New offers</h3>
        <div class="agile_top_brands_grids">

                <sql:query dataSource="${snapshot}" var="newoffer">
                    SELECT * from product limit 3;
                </sql:query>
                <c:forEach var="subrow1" items="${newoffer.rows}">
                    <div class="col-md-4 top_brand_left">
                        <div class="hover14 column">
                            <div class="agile_top_brand_left_grid">
                                <div class="agile_top_brand_left_grid1">
                                    <figure>
                                        <div class="snipcart-item block">
                                            <div class="snipcart-thumb">
                                                <a href="Customer/detail.jsp?pname=${subrow1.Pname}"><img
                                                        width="200px" height="200px"
                                                        src="../${subrow1.Pdescription_img}"></a>
                                                <p>${subrow1.Pname}</p>
                                                <h4>$${subrow1.Pprice_v}<span>$${subrow1.Pprice}</span>
                                                </h4>
                                            </div>
                                            <div class="snipcart-details top_brand_home_details">
                                                <form action="#" method="post">
                                                    <fieldset>
                                                        <input type="hidden" name="cmd" value="_cart">
                                                        <input type="hidden" name="add" value="1">
                                                        <input type="hidden" name="item_name"
                                                               value="${subrow1.Pname}">
                                                        <input type="hidden" name="amount"
                                                               value="${subrow1.Pprice_v}">
                                                        <input type="hidden" name="currency_code"
                                                               value="USD">
                                                        <input  type="submit" name="submit" value="Add to cart" class="button"  onclick="sub('${subrow1.Pname}')">
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            <div class="clearfix"></div>
        </div>

    </div>
</div>
<!-- //new -->
<!-- //footer -->

<div class="footer-botm">
    <div class="container">
        <div class="w3layouts-foot">
            <ul>
                <li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                <li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <div class="payment-w3ls">
            <img src="Index/images/card.png" alt=" " class="img-responsive">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="Index/js/bootstrap.min.js"></script>

<!-- top-header and slider -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<!-- //here ends scrolling icon -->
<script src="Index/js/minicart.min.js"></script>
<script>
    // Mini Cart
    paypal.minicart.render({
        action: '#'
    });

    if (~window.location.search.indexOf('reset=true')) {
        paypal.minicart.reset();
    }
</script>
<!-- main slider-banner -->
<script src="Index/js/skdslider.min.js"></script>
<link href="Index/css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#demo1').skdslider({
            'delay': 5000,
            'animationSpeed': 2000,
            'showNextPrev': true,
            'showPlayButton': true,
            'autoSlide': true,
            'animationType': 'fading'
        });

        jQuery('#responsive').change(function () {
            $('#responsive_wrapper').width(jQuery(this).val());
        });

    });
</script>
<!-- //main slider-banner -->
</body>
</html>