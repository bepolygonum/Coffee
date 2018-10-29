<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<head>
    <title>Account</title>
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
    <!-- start-smoth-scrolling -->
</head>

<body>
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
<base href="<%=basePath%>">

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>
<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.customer where Cname = '<%=username%>';
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
                <li class="active">My Account</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="about">
        <div class="container">
            <h3 class="w3_agile_header">Account</h3>
            <div class="about-agileinfo w3layouts">
            <div class="mainpart">
             <div class="leftpart">
                <div class="sidebar-content">
                    <div class="sidebar-nav">
                        <div class="sidebar-title">
                            <a href="#">
                                <span class="icon"><b class="fl icon-arrow-down"></b></span>
                                <span class="text-normal">My Account</span>
                            </a>
                        </div>
                        <ul class="sidebar-trans">
                            <li>
                                <a href="account.jsp">
                                    <b class="sidebar-icon"><img src="images/user_02.png" width="16" height="16" /></b>
                                    <span class="text-normal">Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="edit_account.jsp">
                                    <b class="sidebar-icon"><img src="images/icon_market.png" width="16" height="16" /></b>
                                    <span class="text-normal">Edit</span>
                                </a>
                            </li>
                            <li>
                            <a href="order.jsp">
                                <b class="sidebar-icon"><img src="images/icon_order.png" width="16" height="16" /></b>
                                <span class="text-normal">Orders</span>
                            </a>
                        </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="rightpart">
                <div class="part">

                <c:forEach var="row" items="${result.rows}">
                <div class="manage account-manage">
                    <div class="manage-head">
                        <h6 class="layout padding-left manage-head-con">Profile</h6>
                    </div>
                    <div class="account-basic clearfix">
                        <ul>
                            <li class="fl">
                            <p class="account-head">
                                <img src="../${row.Cprofile}">
                            </p>
                            </li>
                            <li> <div> &ensp;</div></li>
                            <li><div class="info"><p class="mytext">User Name: </p>
                            <h2 class="show ">
                            <label class="show__label show__label--ichiro" >
                            <span class="input__label-content input__label-content--ichiro">${row.Cname}</span>
                            </label>
                            </h2>
                            </div>
                            </li>
                            </li>
                            <li> <div> &ensp;</div></li>
                            <li><div class="info"><p class="mytext">Email: </p>
                            <h2 class="show ">
                            <label class="show__label show__label--ichiro">
                            <span class="input__label-content input__label-content--ichiro">${row.Cemail}</span>
                            </label>
                            </h2>
                            </div>
                            </li>
                            <li> <div> &ensp;</div></li>
                            <li><div class="info"><p class="mytext">Telephone: </p>
                            <h2 class="show ">
                            <label class="show__label show__label--ichiro" >
                            <span class="input__label-content input__label-content--ichiro">${row.Ctel}</span>
                            </label>
                            </h2>
                            </div>
                            </li>
                            <li> <div> &ensp;</div></li>
                            <li><div class="info"><p class="mytext">Gender: </p>
                            <h2 class="show ">
                            <label class="show__label show__label--ichiro" >
                            <span class="input__label-content input__label-content--ichiro">${row.Cgender}</span>
                            </label>
                            </h2>
                            </div>
                            </li>
                            <li> <div> &ensp;</div></li>
                            <li><div class="info"><p class="mytext">Birth: </p>
                            <h2 class="show ">
                            <label class="show__label show__label--ichiro" >
                            <span class="input__label-content input__label-content--ichiro">${row.Cbirth}</span>
                            </label>
                            </h2>
                            </div>
                            </li>
                            <li> <div> &ensp;</div></li>
                            <li><div class="info"><p class="mytext">Level: </p>
                            <h2 class="show ">
                            <label class="show__label show__label--ichiro" >
                            <span class="input__label-content input__label-content--ichiro">${row.Clevel}</span>
                            </label>
                            </h2>
                            </div>
                            </li>
                        </ul>
                    </div>
                </div>
                </c:forEach>
                </div>
        </div>
    </div>
                    
        </div>
        </div>
    </div>

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