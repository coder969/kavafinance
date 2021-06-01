<%@ Page Language="C#"  MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Model" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Services" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TitleContent">
抱歉!您访问的页面不存在_来住吧旅行网
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
<link type="text/css" rel="stylesheet" href="/Content/css/brand.css" />
<script type="text/javascript" src="/Scripts/common.js"></script>
<script type="text/javascript" src="/Scripts/city.js"></script>
<script type="text/javascript">
    var quna_server_date = new Date(Date.parse('01/04/2012'));
</script>
<style type="text/css">
.errorbox { margin-top:10px;border:1px solid #dcf1f6;width:970px;margin:0 auto; }
.errorbox .content { height:350px; padding:60px 80px 50px 400px; background:#fff url(/Content/images/404.jpg) 60px 50px no-repeat; }
.errorbox .tit,.errorbox dl,.errorbox ul {margin-bottom:20px;}
.errorbox .tit { padding-top:42px; background:url(/Content/images/404title.gif) 0 0 no-repeat; font-size:14px; font-weight:bold; line-height:26px; }
.errorbox dd { padding-left:10px; background:url(/Content/images/ico.gif) 1px -92px no-repeat; }
.errorbox ul { width:400px;}
.errorbox li { width:118px; height:30px; line-height:30px; float:left; padding-left:15px; background:url(/Content/images/ico.gif) 2px 9px no-repeat; }
.errorbox li,.errorbox li a { font-size:14px;}
</style>
</asp:Content>
<asp:Content id="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<div class="wraper">
<div class="hotel_state">
<p>您所在位置：<a href="/" title="来住吧旅行网首页">来住吧旅行网首页</a> &gt; <a href="/city" title="全国酒店">全国酒店</a></p>
</div>
<div class="hotel_search hotel_brand_search" id="search" style="margin 0 auto;">
    <form id="formsearch">
    <ul class="search">
        <li><span>*</span>入住城市：
        <input name="select_incity" id="select_incity" tabindex="1" type="text" class="searchinput" mod_address_suggest="@beijing|北京|bj|53@shanghai|上海|sh|321@shenzhen|深圳|sz|91@guangzhou|广州|gz|80@dalian|大连|dl|248@chengdu|成都|cd|324@tianjin|天津|tj|343@wuhan|武汉|wh|192@xian|西安|xa|317@chongqing|重庆|cq|394@hangzhou|杭州|hz|383@qingdao|青岛|qd|292@"
        mod_address_source="hotelDomestic" mod_notice_tip="中文/拼音" mod="address|notice" type="hidden" mod_address_reference="cityid" onkeyup="value=value.replace(/[^A-Za-z0-9\u4E00-\u9FA5\']/g,'')" />
        <input type="hidden" id="cityid" name="cityid" value=""/>
        </li>
        <li><span>*</span>入住日期：<input tabindex="2" type="text" class="searchinput" id="indate" name="indate" readonly="readonly" onclick="MyCalendar.SetDate(this);" value="yyyy-mm-dd" /></li>
        <li><span>*</span>退房日期：<input tabindex="3" type="text" class="searchinput" id="outdate" name="outdate" readonly="readonly" onclick="MyCalendar.SetDate(this);" value="yyyy-mm-dd"/></li>
        <li class="brand">&nbsp;&nbsp;连锁品牌：<input type="text" tabindex="4" class="txt" id="group" readonly="readonly" /></li>
    </ul>
    <ul>
        <li class="nobrand hotel"><span>*</span>星级范围：<select class="searchinput" style="width:155px;" tabindex="4" id="star" name="star"><option value="0">星级不限</option><option value="2">二星级/经济型</option><option value="3">三星级/舒适型</option><option value="4">四星级/高档型</option><option value="5">五星级/豪华型</option></select></li>
        <li class="nobrand">&nbsp;&nbsp;酒店名称：<input tabindex="6" type="text" id="hname" class="searchinput" name="hname" value=""/></li>
        <li class="nobrand">&nbsp;&nbsp;酒店位置：<input tabindex="5" type="text" class="searchinput" id="address" name="address" value="" /></li>
        <li class="sunmitbtn"><input class="btn" type="button" onclick="subhotel();"tabindex="7" id="Button1" /></li>
    </ul>
    <script type="text/javascript">        qunaObj.module.searchBox.init();</script>
    </form>      
   <div class="r"></div>
</div>
<div class="errorbox">
    <div class="content">
      <div class="tit">很抱歉!<br />您要查看的网页可能已被删除、名称已被更改，或者暂时不可用……</div>
      <dl>
         <dt>可能的原因：</dt>
         <dd>在地址栏中输入了错误的内容。</dd>
         <dd>当您点击某个链接时，该链接已过期。</dd>
      </dl>
      <p>我们为您准备了以下您可能感兴趣的内容：</p>
      <ul>
         <li><a href="/hotel">酒店预订</a></li>
         <li><a href="/tour">门票预订</a></li>
         <li><a href="/land">地标酒店</a></li>
      </ul>
      <p class="clearfix">您也可以：<a href="/">返回首页</a></p>
      </div>
</div>
</div>
</asp:Content>