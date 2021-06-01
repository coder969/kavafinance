<%@ Page Language="C#"  MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Model" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Services" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TitleContent">
在线租车订单提交_风采旅行社
</asp:Content>
<asp:Content ID="MetaContent" runat="server" ContentPlaceHolderID="MetaContent">
<%
    CacheManager cm = CacheManager.getInstance();
    Model.Parmer pdesc = cm.getParam("description");
    Model.Parmer pkey = cm.getParam("keywords");
    string keywords = "";
    string description = "";
    if(pdesc != null)
    {       
        description = pdesc.pvalue;
    }
    if(pkey != null)
    {
        keywords = pkey.pvalue; 
    }
%>
<meta name="keywords" content="<%:keywords %>"/>
<meta name="description" content="<%:description %>"/>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
<link type="text/css" rel="stylesheet" href="/Content/css/index.css" />
<script type="text/javascript" src="/Scripts/all.js"></script>
<script type="text/javascript">
    function ValidOrder() {
        var lxr = $("#lxr").val();
        if (lxr == "") {
            alert("请填写联系人姓名");
            $("#lxr").focus();
            return false;
        }
        var phone =$("#phone").val();
        if (phone == "") {
            alert("请填写手机号码");
            $("#phone").focus();
            return false;
        }
        var email = $("#email").val();
        if (email == "") {
            alert("请填写邮箱地址");
            $("#email").focus();
            return false;
        }
        $("#orderform").submit();
    }   
</script>
</asp:Content>
<asp:Content id="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<%
    var msg = ViewData["msg"].ToString();
    var status = ViewData["status"].ToString();
    var cid = "";
    var cname = "";
    var price = "";
    Car car = ViewData["car"] as Car;
    if(car != null)
    {
        cid = car.id;
        cname = car.carname;
        price = car.price; 
    }
    Member member = Session["MemberSession"] as Member;
    var phone = "";
    var username = "";
    var email = "";
    var tel = "";
    if (member != null)
    {
        phone = member.phone;
        username = member.username;
        email = member.email;
        tel = member.tel;
    }
%>
<div class="page">
<%if(status.Equals("error"))
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
    2. 直接访<a href="/">问蓝风采旅行社首页</a></div>    
    </div>
    </div>
   </div>
   <%    
  }
  else
  {
   %>
   <form id="orderform" action="/car/success" method="post">
   <div class="login_border1">
	<div class="login_border2">
	<div class="login_border3">
        <div class="order">
        <!--线路标题--><h1 id="norder_h1">在线预订：<%:car.carname %></h1><!--线路标题-->
		<!--订单步骤--><div class="norder_step2"></div><!--订单步骤-->
        
        <!--联系人信息-->
        <div class="norder_div">
        	<h2>联系人信息</h2>
		<table width="860" border="0" cellpadding="0" cellspacing="0">
		  <tr class="otd1">
            <td colspan="2">&nbsp;&nbsp;请准确填写您的联系人信息，方便我们与您联系，下单成功，游客凭此处填写的信息查询订单。</td>
            </tr>
          <tr>
            <td height="16" colspan="2" align="right">&nbsp;</td>
            </tr>
          <tr class="otd3">
            <td width="180" align="right"><span>*</span> 姓名：</td>
            <td width="680"><input type="text" name="lxr" id="lxr" value="<%:username %>" maxlength="30" value="" class="tb" title="请您输入订单联系人姓名。" /></td>
          </tr>
          <tr class="otd3">
            <td align="right"><span>*</span> 性别：</td>
            <td><label><input type="radio" checked="checked" name="gender" value="1"/> 男</label>
                <label><input type="radio" name="gender" value="2"/> 女</label></td>
            </tr>
          <tr class="otd3">
            <td align="right"><span>*</span> 手机：</td>
            <td><input type="text" name="phone" id="phone" value="<%:phone %>" maxlength="11" class="tb" title="请您输入订单联系人手机号码。" /></td>
          </tr>
          <tr class="otd3">
            <td align="right"><span>*</span> 邮箱：</td>
            <td><input type="text" name="email" id="email" value="<%:email %>" maxlength="30" class="tb" /></td>
          </tr>
          <tr class="otd3">
            <td align="right">固话：</td>
            <td><input type="text" name="tel" id="tel" value="<%:tel %>" class="tb" maxlength="30" style="width:142px; margin-left:2px;"/>
              <font color="#999999">（选填）</font></td>
          </tr>
          <tr class="otd3">
            <td align="right">其它要求：</td>
            <td>
            <textarea id="remarks" name="remarks" cols="3" rows="3" class="tb" style="width:360px; height:100px;"></textarea>
            </td>
          </tr>
		</table>
        </div>
		<!--结算信息-->
        <div class="norder_div">
            <input id="cid" name="cid" type="hidden" value="<%:cid %>"/>
            <input id="cname" name="cname" type="hidden" value="<%:cname %>"/>           
            <input id="price" name="price" type="hidden" value="<%:price %>"/>                 
            <input type="button" id="btnNext" onclick="return ValidOrder();" value="下一步" class="norder_Submit"/>
        </div>
        <!--结算信息-->
        </div>
	</div>
	</div>
	</div>
    </form>
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