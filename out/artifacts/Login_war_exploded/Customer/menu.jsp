<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/24
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
            });
        });
    </script>
    <script type="text/javascript">
        function  sub(name){
            $.ajax({
                type:"GET",
                url:"add_cart.jsp?name="+name,
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

</head>
<body >

<input type="hidden" id="hdnvalue" runat="server" value="0" />
<%
    String type;
    String i=request.getParameter("type");
    if(i==null)  type="";
    else type="where PTname='"+i+"'";
%>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path;
    String username="User";
    try{
        if(session.getAttribute("username")!=null)
            username = (String) session.getAttribute("username");
    }catch (Exception e) {
        e.printStackTrace();
    }
    session.setAttribute("username",username);
%>
<base href="<%=basePath%>">

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>
<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.product <%=type%>;
</sql:query>


<!-- header -->
<div class="agileits_header">
    <div class="container">
        <div class="w3l_offers">
            <p>Welcome To Coffee </p>
        </div>
        <div class="agile-login">
            <ul>
                <li><a href="login.jsp"><%=username%></a></li>
                <li><a href="../Admin/login.jsp">Administrator</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="../Signout.jsp">Sign Out</a></li>
            </ul>
        </div>
        <div class="product_list_header">
            <form  method="post" class="last">
                <input type="hidden" name="cmd" value="_cart">
                <input type="hidden" name="display" value="1">
                <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
            </form>
        </div>
        <div class="clearfix"> </div>
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
            <h1><a href="../index.jsp">Come  For  Café</a></h1>
        </div>
        <div class="w3l_search">
            <form action="search.jsp" method="post">
                <input type="search" name="Search" placeholder="Search for a Product..." required="">
                <button type="submit" class="btn btn-default search" aria-label="Left Align">
                    <i class="fa fa-search" aria-hidden="true"> </i>
                </button>
                <div class="clearfix"></div>
            </form>
        </div>

        <div class="clearfix"> </div>
    </div>
</div>
<!-- //header -->
<!-- navigation -->
<div class="navigation-agileits">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="../index.jsp" class="act">Home</a></li>
                    <li class="active"><a href="menu.jsp" class="act">Menu</a></li>
                    <li><a href="offers.jsp">Offers</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="account.jsp">My Account</a></li>
                    <li><a href="about.jsp">About</a></li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- //navigation -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="../index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
            <li class="active">Menu</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->


<!--- products -->
<div class="products">
    <div class="container">
        <div class="col-md-4 products-left">
            <div class="categories">
                <h2>Categories</h2>
                <ul class="cate">
                    <li><i class="fa fa-arrow-right" aria-hidden="true"></i>Drink</li>
                    <ul>
                        <li><a href="menu.jsp?type=Hand-modulated espresso"><i class="fa fa-arrow-right" aria-hidden="true"></i>Hand-modulated espresso</a></li>
                        <li><a href="menu.jsp?type=Frappuccino"><i class="fa fa-arrow-right" aria-hidden="true"></i>Frappuccino</a></li>
                        <li><a href="menu.jsp?type=ChavanaTM"><i class="fa fa-arrow-right" aria-hidden="true"></i>ChavanaTM</a></li>
                    </ul>
                    <li><i class="fa fa-arrow-right" aria-hidden="true"></i>Food</li>
                    <ul>
                        <li><a href="menu.jsp?type=Baking"><i class="fa fa-arrow-right" aria-hidden="true"></i>Baking</a></li>
                        <li><a href="menu.jsp?type=Cake %26 Dessert"><i class="fa fa-arrow-right" aria-hidden="true"></i>Cake & Dessert</a> </li>
                        <li><a href="menu.jsp?type=Sandwich, panini, roll"><i class="fa fa-arrow-right" aria-hidden="true"></i>Sandwich, panini, roll</a></li>
                    </ul>
                    <li><i class="fa fa-arrow-right" aria-hidden="true"></i>Coffee product</li>
                    <ul>
                        <li><a href="menu.jsp?type=Coffee beans"><i class="fa fa-arrow-right" aria-hidden="true"></i>Coffee beans</a> </li>
                    </ul>
                    <li><a href="menu.jsp?type=Commodity"><i class="fa fa-arrow-right" aria-hidden="true"></i>Commodity</a></li>
                    <ul>
                        <li><a href="menu.jsp?type=Commodity"><i class="fa fa-arrow-right" aria-hidden="true"></i>Selection product</a> </li>
                    </ul>
                </ul>
            </div>
        </div>
        <div class="col-md-8 products-right">
            <div class="products-right-grid">
                <div class="products-right-grids">
                    <div class="clearfix"> </div>
                </div>
            </div>

            <c:forEach var="row" items="${result.rows}">

            <div class="agile_top_brands_grids">

                <div class="col-md-4 top_brand_left">
                    <div class="hover14 column">
                        <div class="agile_top_brand_left_grid">
                            <div class="agile_top_brand_left_grid1">
                                <figure>
                                    <div class="snipcart-item block">
                                        <div class="snipcart-thumb">
                                            <a href="detail.jsp?pname=${row.Pname}"><img width="200px"  height="200px"  src="../${row.Pdescription_img}"></a>
                                            <p>${row.Pname}</p>
                                            <h4>$${row.Pprice_v}<span>$${row.Pprice}</span></h4>
                                        </div>
                                        <div class="snipcart-details top_brand_home_details">
                                            <form action="#" method="post">
                                                <fieldset>
                                                    <input type="hidden" name="cmd" value="_cart">
                                                    <input type="hidden" name="add" value="1">
                                                    <input type="hidden" name="item_name" value="${row.Pname}">
                                                    <input type="hidden" name="amount" value="${row.Pprice_v}">
                                                    <input type="hidden" name="currency_code" value="USD">
                                                    <input  type="submit" name="submit" value="Add to cart" class="button"  onclick="sub('${row.Pname}')">
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

                <div class="clearfix"> </div>
            </div>


        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- products -->





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
            <img src="images/card.png" alt=" " class="img-responsive">
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- top-header and slider -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.min.js"></script>
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
<script src="js/skdslider.min.js"></script>
<link href="css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#demo1').skdslider({
            'delay': 5000,
            'animationSpeed': 2000,
            'showNextPrev': true,
            'showPlayButton': true,
            'autoSlide': true,
            'animationType': 'fading'
        });

        jQuery('#responsive').change(function() {
            $('#responsive_wrapper').width(jQuery(this).val());
        });

    });
</script>
<!-- //main slider-banner -->
</body>

</html>