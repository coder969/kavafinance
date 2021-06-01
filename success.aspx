<%@ Page Language="C#"  MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Model" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Services" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TitleContent">
订单提交页
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
 <link type="text/css" rel="stylesheet" href="/Content/css/index.css" />
<script type="text/javascript" src="/Scripts/all.js"></script>
</asp:Content>
<asp:Content id="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<%
    var msg = ViewData["msg"].ToString();
    var status = ViewData["status"].ToString();
    var oid = ViewData["oid"].ToString();
    CarOrder order = ViewData["order"] as CarOrder;
%>
<div class="page">
<%if (status.Equals("error"))
  {
   %>
   <div class="error">
    <div class="error_text e">
    <div class="error_left"><img src="/Content/images/error.gif" /></div>
    <div class="error_right">
    <div class="error_right_a"><img src="/Content/images/error_cn.gif" /><br />
    <%:msg%>
    </div>
    <div class="error_right_b">
    <a><img src="/Content/images/error_b.gif"/ style="padding-bottom:10px;padding-top:8px; "></a><br />
    1. 检查网址是否正确<br />
    2. 直接访<a href="/">风采旅行社首页</a></div>   
    </div>
    </div>
   </div>
   <%    
  }
  else
  {
   %>
    <div class="login_border1">
	<div class="login_border2">
	<div class="login_border3">
        <div class="order" style="padding-bottom:40px;">
        <!--线路标题--><h1 id="norder_h1">在线预订：<%:order.cname %></h1><!--线路标题-->
		<!--订单步骤--><div class="norder_step3"></div><!--订单步骤-->
        
        <div class="norder_ok">
        <h2 class="norder_ok_h2"><img src="/Content/images/order_ok.gif" /> 恭喜您，订单已提交成功，订单编号:<%:oid %>请您牢记订单号！</h2>
        
        <p class="norder_ok_text1">
        请您牢记此订单号。我们会尽快通过您的手机或E-mail跟您联系，请保持您的手机畅通。<br />
        您的订单目前还不能在线支付，须在我们的客服确认位置，并打开在线支付许可后方可在线支付。<br />
        您可以在网站右上角点击“查询订单”，输入订单号、姓名、手机号随时查询您的订单。
        </p>
		<div class="norder_ok_user" style="display:none;">我们已经帮您注册成为风采旅行社的会员，您的会员卡号是<strong>31230</strong>，密码<strong>31230</strong></div>
		<p class="norder_ok_text1" style="display:none;">
        您也可以在登录网站后，进入会员中心找到您的订单。<br />
        您的预定信息也已经发往<a href="#">15825362536@163.com</a>，如果您没有收到这个邮件，有可能是您的垃圾邮件过滤器把它过滤掉了，请查看垃圾邮件文件夹
        </p>
		<p class="norder_ok_text1" style="display:none;"><a href="#"><img src="/Content/images/order_bt3.gif" /></a>　<a href="/"><img src="/Content/images/order_bt4.gif" /></a></p>
		<p class="norder_ok_text2">
        <strong>其他说明</strong><br />
            由于旅游产品的价格和位置变化较快，所有的预定，都需要客服同您人工确认位置和最新的价格。因此系统帮您计算的价格可能会发生变化，但是我们会尽力确保价格的准确。<br />
        <br />
        <strong>联系我们</strong><br />
        咨询预订电话<strong>027-51519799</strong> </p>
        </div>
        </div>
	</div>
	</div>
	</div>  
   <% 
  }
%>
	
</div>
<%Html.RenderPartial("AjaxHelp");%>
<script type="text/javascript">
    ShowNewNav(7);
    SetReferer();
</script>
</asp:Content>