<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/24
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>About</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
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
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
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
    session.setAttribute("username",username);
%>
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
            <li class="active">About</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- about -->
<div class="about">
    <div class="container">
        <h3 class="w3_agile_header">About Us</h3>
        <div class="about-agileinfo w3layouts">
            <div class="col-md-8 about-wthree-grids grid-top">
                <h4>Awesome Coffee For Awesome People</h4>
                <p class="top"> Are you planning a nice gourmet dinner together with good friends?</p>
                <p>We can recommend our gourmet restaurant. We have full focus on the gastronomic level.</p>
                <p>A gourmet dinner is a perfect combination of flavors produced from top quality ingredients from Mandø. We recommend gourmet dinners from 2-4 dishes, all the dishes are perfectly composed.</p>
                <p><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>  Tel:  0592-123-4567</p>
                <p><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>  Email: <a href="mailto:info@example.com">info@example.com</a><p>
                <p><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>  Address:  1234k Avenue, 4th block, <span> Xiamen City.</span></p>
                <div class="about-w3agilerow">
                    <div class="col-md-4 about-w3imgs">
                        <img src="images/about.jpg" alt="" class="img-responsive zoom-img"/>
                    </div>
                    <div class="col-md-4 about-w3imgs">
                        <img src="images/about2.jpg" alt=""  class="img-responsive zoom-img"/>
                    </div>
                    <div class="col-md-4 about-w3imgs">
                        <img src="images/about3.jpg" alt=""  class="img-responsive zoom-img"/>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-4 about-wthree-grids">
                <div class="offic-time">
                    <div class="time-top">
                        <h4>Praesentium :</h4>
                    </div>
                    <div class="time-bottom">
                        <h5>At vero eos </h5>
                        <h5>Accusamus et</h5>
                        <p>Dignissimos at vero eos et accusamus et iusto odio ducimus qui accusamus et. </p>
                    </div>
                </div>
                <div class="testi">
                    <h3 class="w3_agile_header">Testimonial</h3>
                    <!--//End-slider-script -->
                    <script src="js/responsiveslides.min.js"></script>
                    <script>
                        // You can also use "$(window).load(function() {"
                        $(function () {
                            // Slideshow 5
                            $("#slider5").responsiveSlides({
                                auto: true,
                                pager: false,
                                nav: true,
                                speed: 500,
                                namespace: "callbacks",
                                before: function () {
                                    $('.events').append("<li>before event fired.</li>");
                                },
                                after: function () {
                                    $('.events').append("<li>after event fired.</li>");
                                }
                            });

                        });
                    </script>
                    <div  id="top" class="callbacks_container">
                        <ul class="rslides" id="slider5">
                            <li>
                                <div class="testi-slider">
                                    <h4>" I AM VERY PLEASED.</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu magna dolor, quisque semper.</p>
                                    <div class="testi-subscript">
                                        <p><a href="#">John Doe,</a>Adipiscing</p>
                                        <span class="w3-agilesub"> </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="testi-slider">
                                    <h4>" I AM LOREM IPSUM.</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu magna dolor, quisque semper.</p>
                                    <div class="testi-subscript">
                                        <p><a href="#">elit semper,</a>Dolor Elit</p>
                                        <span class="w3-agilesub"> </span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="testi-slider">
                                    <h4>" CONSECTETUR PIMAGNA.</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu magna dolor, quisque semper.</p>
                                    <div class="testi-subscript">
                                        <p><a href="#">Amet Doe,</a>Suspendisse</p>
                                        <span class="w3-agilesub"> </span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //about -->
<!-- about-slid -->
<div class="about-slid agileits-w3layouts">
    <div class="container">
        <div class="about-slid-info">
            <h2>Drinking Coffee is a life attitude</h2>
            <p>Lorem Ipsum generators on the Internet tend to repeat predefined chunks on the Internet tend as necessary, making this the first true generator on the Internet embarrassing hidden in the middle of text Lorem Ipsum generators on the Internet tend to repeat predefinedchunks as necessary, making this the first true generator on the.</p>
        </div>
    </div>
</div>
<!-- //about-slid -->


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

        $().UItoTop({ easingType: 'easeOutQuart' });

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
    jQuery(document).ready(function(){
        jQuery('#demo1').skdslider({'delay':5000, 'animationSpeed': 2000,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});

        jQuery('#responsive').change(function(){
            $('#responsive_wrapper').width(jQuery(this).val());
        });

    });
</script>
<!-- //main slider-banner -->
</body>
</html>
