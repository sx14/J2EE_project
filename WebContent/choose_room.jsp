<%@page import="constant.Config"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="model.RoomType"%>
<%@page import="model.Hotel"%>
<%@page import="model.Order"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Date inDate = (Date)session.getAttribute("inDate");
    Date outDate = (Date)session.getAttribute("outDate");
    long interval = (outDate.getTime() - inDate.getTime())/1000/60/60/24;
    Hotel hotel = (Hotel)session.getAttribute("hotel");
%>

<!DOCTYPE html>
<html lang="en">
<base href="<%=basePath%>"></base>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>Theme Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/theme.css" rel="stylesheet">
    <link href="css/customer/sx-choose-room.css" rel="stylesheet">
    <link href="css/customer/sx-style.css" rel="stylesheet">


    <style>

    </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Hotel World</a>
        </div>
        <div id="navbar1" class="collapse navbar-collapse">
          <ul class="nav navbar-nav" style="float:right">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="sx-jumbotron"></div>

      <div class="col-md-8">
        <div class="date">
          <form class="form-inline" action="chooseRoom" method="post">
            <div class="form-group sx-search">
              <label>入住</label><input name="inDate" class="form-control sx-search" type="date" placeholder="入住日期" value="<%=inDate %>">
              <label>离店</label><input name="outDate" class="form-control sx-search" type="date" placeholder="离店日期" value="<%=outDate %>">
            </div>
            <label>共&nbsp;<%=interval %>&nbsp;晚</label>
            <input type="submit" class="btn btn-success sx-right" value="搜索房间">
          </form>
          <hr>
        </div>
        <table class="table table-bordered sx-shadow">
          <%
          	for(RoomType roomType : hotel.getRoomTypes()){
          		out.println("<tr>");
          		out.println("<td class=\"media sx-media-inTable sx-content-center\">");
          		out.println("<div class=\"media-left\">");
          		out.println("<img class=\"sx-img-small\" src=\"img/hotel1.jpg\">");
          		out.println("</div>");
          		out.println("<div class=\"media-body\">");
          		out.println("<div class=\"row\">");
          		out.println("<div class=\"col-md-3 sx-vertical-center\">");
          		out.println("<h4><strong>房型"+roomType.getRoomType()+"</strong></h4>");
          		out.println("<p><span class=\"label label-danger\">小</span>最多可住<span class=\"sx-small-red\">"+roomType.getCapacity()+"</span>人</p>");
          		out.println("</div>");
          		out.println("<div class=\"col-md-3 sx-vertical-center\">");
          		out.println("<strong><span class=\"sx-big-blue\">15</span>m2</strong>");
          		out.println("</div>");
          		out.println("<div class=\"col-md-3 sx-vertical-center\">");
          		out.println("<strong>￥<span class=\"sx-big-red\">"+roomType.getPrice()+"</span><br><span class=\"sx-small-green\">(会员价：￥"+roomType.getVip_price()+")</span></strong>");
          		out.println("</div>");
          		out.println("<div class=\"col-md-3 sx-vertical-center\">");
          		out.println("<a href=\"\" class=\"btn btn-primary\">预定</a>");
          		out.println("</div>");
          		out.println("</div>");
          		out.println("</div>");
          		out.println("</td>");
          		out.println("</tr>");
          	}
          %>
        </table>
        <hr>
        <h3><strong>用户评价</strong></h3>
        <div>
        <%
        	for(Order order : hotel.getOrders()){
        		out.println("<div class=\"sx-media-static sx-shadow\">");
        		out.println("<div class=\"media-left sx-content-center sx-vertical-line\">");
        		out.println("<img class=\"media-object img-rounded sx-img-small\" src=\""+order.getUser().getImage()+"\" alt=\"...\">");
        		out.println("<p><span class=\"label label-warning\">金牌评论家</span></p>");
        		out.println("<p><span class=\"sx-small-blue\">"+order.getUser().getCommentNum()+"</span>次评价</p>");
        		out.println("</div>");
        		out.println("<div class=\"media-right\">");
        		out.println("<p><span class=\"sx-small-blue\">"+order.getComment_head()+"</span></p>");
        		out.println("<p><span class=\"sx-label-key\">用户评价</span><span class=\"sx-label-value\">");
        		for(int i = 0 ; i < order.getStar() ; i++){
        			out.print("<img src=\"../img/star.png\">");
        		}for(int i = order.getStar() ; i < Config.MAX_STAR ; i++){
        			out.print("<img src=\"../img/star2.png\">");
        		}
        		out.println("</span></p>");
        		out.println("<p><span class=\"sx-label-key\">入住时间</span><span class=\"sx-label-value\">"+order.getInDateString()+" --- "+order.getOutDateString()+"</span></p>");
        		out.println("<p><span class=\"sx-label-key\">房型</span><span class=\"sx-label-value\">"+order.getRoom().getRoomType().getRoomType()+"</span></p>");
        		out.println("<p>"+order.getComment_content()+"</p>");
        		out.println("</div>");
        		out.println("</div>");
        	}
        %>
        </div>
      </div>
      <div class="col-md-4 sx-content-center sx-border-blue sx-shadow sx-remove-padding">
        <div class="row">
          <img src="../img/hotel-mid-1.jpg" class="sx-img-star-hotel">
          <div class="sx-padding-all">
            <p class="sx-big-blue"><%=hotel.getCity()+hotel.getName()%></p>
            <p>地址：江苏省南京市鼓楼区汉口路22号</p>
            <p><span class="sx-big-blue"><%=hotel.getStar() %></span>/5分</p>
            <p>￥<span class="sx-big-red"><%=hotel.getLowestPrice() %></span>起</p>
            <p><span class="sx-small-blue"><%=hotel.getCommentNum() %></span></p>
          </div>
        </div>
      </div>
    </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>