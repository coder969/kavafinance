<%@ Page Language="C#"  MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Model" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Services" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TitleContent">
在线租车_风采旅行社
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
<link type="text/css" rel="stylesheet" href="/Content/css/car.css" />
<script type="text/javascript" src="/Scripts/all.js"></script>
<script type="text/javascript">
    function ordercar(id) {
        var url = "/car/order?id=" + id + "";
        window.open(url, "_self");
    } 
</script>
</asp:Content>
<asp:Content id="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<%
    IList<Car> carlist = ViewData["carlist"] as IList<Car>;
    int page = NumberUtil.parseInt(ViewData["page"].ToString());
    int count = NumberUtil.parseInt(ViewData["count"].ToString());
    int Npage = (count + 6 - 1) / 6;//总页数
    int gn = 0;
    SortedList gnlist = ViewData["gnlist"] as SortedList;
%>
<div class="page">
<!--Main left-->
<div class="main_l">
  <div class="ml_border">
   <div class="ml_title"><h3>线路搜索</h3></div>
   <div class="mlt_border">
   <div class="leftso">
   按目的地搜索：
   <input name="keyword" id="keyword" type="text" class="leftsoso1" value="请选择想去的目的地" onfocus="SelectGoWhere(this);" readonly="readonly"/>
   </div>
<div class="leftso" style="border:none">
   按线路编号搜索：<input name="lineId" id="lineId" type="text" class="leftsoso2" value="请输入线路编号" onfocus="if(this.value=='请输入线路编号') this.value='';" onblur="if(this.value=='') this.value='请输入线路编号';"  /><input onclick="goLineUrl('lineId');" type="image" src="/Content/images/so2.gif" width="40" height="23" />
   </div>
   </div>   
    <div class="ml_title"><h3>国内旅游目的地</h3></div>
    <div class="mlt_border" style="background:#fff;">
      <div class="destination3">
         <ul>
            <%foreach(DictionaryEntry dr in gnlist)
            {
             gn++;
             %>
            <%if(gn.Equals(gnlist.Count))
            {
            %><li style="border:0 none;"><%     
            }
            else
            {
                %><li><% 
            }
             %>
             <strong><a><%:dr.Key %></a></strong>
             <span>
             <%
                 IList<Itemregion> reglist = dr.Value as IList<Itemregion>;
                 int a = 0;
                 if(reglist != null && reglist.Count > 0)
                 {
                     foreach(var item in reglist)
                     {
                         a++;
                         if ((a %4).Equals(0) && a > 0)
                         {
                            %><br/><%  
                         }
                         else
                         {
                           %><a href="/arrive/<%:item.csname %>.html" title="<%:item.ddcs %>旅游线路"><%:item.ddcs %></a>&nbsp;&nbsp;<%   
                         }
                     }   
                 }
             %>
             </span>
             </li>
             <%      
            }
            %>
          </ul> 
      </div>
    </div>     
    <div class="ml_border_end1"></div>
    <div class="ml_border_end2"></div>
    <div class="ml_title"><h3>服务咨询</h3></div>
    <div class="mlt_border">
    <ul class="server">    
    <li class="services_icon2"><strong>客服电话</strong><br /><span>027-51519799</span></li>
    <li class="services_icon3"><strong>工作时间</strong><br />周一～周五 9:00-22:00<br/>周六、日　10:00-18:00</li>
    </ul>
    </div>
  </div>
<div class="ml_border_end"></div>
</div>
<!--Main left_end-->
<!--Main right-->
<div class="main_r">
<div class="middle_z_right" >
<table width="746" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<div style="width:742px; float:left" class="dbiankuang">
<div style="width:742px; float:left;  ">
<div style="padding:20px 0px 10px 15px;  "> 
<%if(carlist != null && carlist.Count > 0)
{
    foreach(var item in carlist)
    {
      %>
      <table width="718" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="175" height="80" align="left" valign="top"><div style="padding:5px; float:left; margin:0 auto; width:153px; background-color:#EEEEEE">
          <a href="javascript:void(0);" target="_blank"><img  src="<%:item.carimage %>" alt="<%:item.carname %>" width="153" height="107" border="0" /></a></div>
        </td>
        <td width="543" align="left" valign="top" >
          <div style="padding:0px 5px; text-align:left"  class="standardda">
          <a href="#" target="_blank"><img src="/Content/images/row.gif" width="14" height="11" border="0" /><%:item.carname %></a>&nbsp;&nbsp;&nbsp;<span class="huang">￥<%:item.price %>元起</span>
          </div>
          <div style="padding:5px; text-align:left"  class="standard">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#1E98CB" bgcolor="#E6EEF0" class="standard">
           <tr>
            <td width="10%"><strong>座位数：</strong></td>
            <td width="11%"><%:item.seat %></td>
            <td width="10%"><strong>车型：</strong></td>
            <td width="13%"><%:item.cartype %></td>
            <td><input type="button" onclick="ordercar('<%:item.id %>');" style="width:60px; border:0px; height:20px;line-height:20px;color:#fff;font-size:14px;font-weight:700;text-align:center;background:url(/Content/images/btn2.gif) no-repeat;display:block;" value="预订"/></td>          
           </tr>
          </table>
         </div>
         <div class="standard" style="padding:0px 5px; text-align:left">
            <strong>简介：</strong>
            <span class="danz"><%:item.remark %></span>
         </div>
         <div class="danz" style="padding:0px 5px; text-align:left">
         <a href="javascript:void();"><strong>[阅读全文]</strong></a>&nbsp;&nbsp;[车型：<span class="standard1"><%:item.cartype %></span> ]                  
         </div>
        </td>
      </tr>
      <tr>
            <td height="15" colspan="2" align="left"></td>
      </tr>
      <tr>
            <td height="1" colspan="2" bgcolor="#E6E6E6" ></td>
      </tr>
      <tr>
            <td height="15" colspan="2" align="left"></td>
      </tr>
      </table>
      <%   
    }    
}
%>
</div>
<!--分页-->
<div class="pages">
<%if (!page.Equals(1))
    {
    %>
    <a href="/car_1.html" class="first">首页</a>
    <a href="/car_<%:(page - 1) %>.html" class="prev">上一页</a>
    <%    
    }
    else
    {
        %>
        <span class="first">首页</span>
        <span class="prev">上一页</span>
        <%  
    }
%>
<%for(int i = 1; i <= Npage; i++)
{
    if (page > 10)
    {
        for (int m = 6; m >= 1; m--)
        {
            %><a href="/car_<%:(page - m) %>.html"><%:(page - m) %></a><%  
        }
        for (int n = 0; n <= 6; n++)
        {
            if (n.Equals(0))
            {
                %><span class="cur"><%:page %></span><%  
            }
            else
            {
                if ((page + n) < Npage)
                {
                    %><a href="/car_<%:(page +n) %>.html"><%:(page + n) %></a><%
                }
            }
        }
        break;
    }
    else
    {
        if (i <= 10)
        {
            if (page.Equals(i))
            {
                %><span class="cur"><%:page %></span><%
            }
            else
            {
                %><a href="/car_<%:i %>.html"><%:i %></a><%
            }
        }   
    }
    %>
               
    <%    
}
if(page.Equals(Npage))
{
    %>
    <span class="next">下一页</span>
    <span class="last">尾页</span>
    <%              
}
else
{
    %>
    <a href="/car_<%:page+1 %>.html">下一页</a>
    <a href="/car_<%:Npage %>.html">尾页</a>
    <%                
}
%>
</div>
</div>

</div>


  </div>
</div>
</div>
<%Html.RenderPartial("AjaxHelp");%>
<script type="text/javascript">   
    ShowNewNav(7);
    SetReferer();
</script>
</asp:Content>