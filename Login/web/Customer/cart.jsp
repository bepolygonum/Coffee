<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/24
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>

<head>
    <title>Cart</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
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
        if(username.equals("User"))
            request.getRequestDispatcher("/Customer/login.jsp").forward(request,response);
        session.setAttribute("username",username);
    %>

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
    <script>

        function tipWindow(content){
            var footer = $("<div>").addClass("modal-footer").append($("<button>").attr("type","button").addClass("btn btn-primary").attr("data-dismiss","modal").text("Close"));
            $("<div>").addClass("modal fade").attr("role", "dialog").append($("<div>").addClass("modal-dialog").append($("<div>").addClass("modal-content").append($("<div>").addClass("modal-header")
                .append($("<button>").attr("type","button").addClass("close").attr("data-dismiss","modal").html("&times;")).append($("<h4>").addClass("modal-title").html("Confirm Order")))
                .append($("<div>").addClass("modal-body").append($("<div>").addClass("newtype").html(content))).append(footer))).modal("show");
        }

        function show(total){
            window.tipWindow("<li>————Total Price———— </li><li><span style='font-size: 20px'>$"+total+"</span></li> </ul><a href='add_order.jsp?username=<%=username%>' >Confirm</a>");
        }
    </script>
    <script type="text/javascript">
</script>


    <!-- start-smoth-scrolling -->
</head>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>
<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.cart where Cname='<%=username%>';
</sql:query>

<base href="<%=basePath%>">
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
            <form action="#" method="post" class="last">
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
            <li class="active">Cart</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- checkout -->
<div class="checkout">
    <div class="container">
        <script src="js/minicart.min.js"></script>
        <h2>Your shopping cart contains: ${result.rowCount} Products</span></h2>
        <div class="checkout-right">


            <table class="timetable_sub">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Product</th>
                    <th>Product Name</th>
                    <th>Quality</th>
                    <th>Original Price</th>
                    <th>Discount Price</th>
                    <th>Total Discount</th>
                    <th>Total Price</th>
                    <th>Remove</th>
                </tr>
                </thead>
                <c:forEach var="row" items="${result.rows}" varStatus="cou">
                    <tr class="rem1">
                        <td class="invert">
                                ${cou.count}
                        </td>

                        <td class="invert-image">
                            <a href="detail.jsp?pname=${row.Pname}"><img src="../${row.description_img} " width="100px"/></a>
                        </td>
                        <td class="invert">${row.Pname}</td>

                        <td  class="order_content" >
                            <ul class="order_lists">
                                <li class="list_amount">
                                    <div class="amount_box">
                                        <a href="javascript:;" class="reduce reSty">-</a>
                                        <input type="text" value="${row.num}" class="sum">
                                        <a href="javascript:;" class="plus">+</a>
                                    </div>
                                </li>
                            </ul>
                        </td>
                        <td class="order_content">
                            <ul class="order_lists">
                                <li class="list_price">
                                    <p class="price" style="color: #bcbcbc">$${row.price}</p>
                                </li>
                            </ul>
                        </td>
                        <td class="order_content">
                            <ul class="order_lists">
                                <li class="list_price">
                                   <p class="price">$${row.price_v}</p>
                                </li>
                            </ul>
                        </td>
                        <td class="order_content">
                        <ul class="order_lists">
                            <li class="list_sum">
                                <p class="sum_price"> $${(row.price-row.price_v)*row.num}</p>
                            </li>
                        </ul>
                    </td>
                        <td class="order_content">
                            <ul class="order_lists">
                                <li class="list_sum">
                                    <p class="sum_price" style="color: red"> $${row.price_v*row.num}</p>
                                </li>
                            </ul>
                        </td>

                        <td class="order_content">
                            <ul class="order_lists">
                                <a href="delete_cart.jsp?name=${row.Pname}">Delete</a>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
                <!--quantity-->
                <!--quantity-->
            </table>
        </div>
<c:set var="total" value="0"/>
        <div class="checkout-left">
            <div class="checkout-left-basket">
                <h4>Continue to basket</h4>
                <ul>
                    <c:set value="0" var="sum" />
                    <c:forEach var="row" items="${result.rows}">
                        <li>${row.Pname}
                            <i>-</i>
                            <span>
                                    ${row.num}
                            </span>
                        </li>
                        <c:set value="${sum +row.price_v*row.num}" var="sum" />
                    </c:forEach>
                    <li>______________________________________________</li>
                    <li>
                        Total :
                        <i>-</i>
                        <span>$${sum}
                    </span>
                    </li>
            </ul>

            </div>
            <div class="checkout-right-basket">
                <a onclick="show(${sum})">  <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>Check Out</a>
            </div>
            <div class="checkout-right-basket">
                <a href="menu.jsp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //checkout -->
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