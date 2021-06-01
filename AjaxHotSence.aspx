<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Hotel>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Model" %>
<%
    IList<Sence> hlist = ViewData["hotsence"] as IList<Sence>;    
%>
<%foreach (var item in hlist)
{
    double amount =NumberUtil.parseDouble(item.amount);
    double amountAdv = NumberUtil.parseDouble(item.amountAdv);
    double youhui = amount - amountAdv;
    string[] themelist = item.theme.Split('/');
    var imgpath = item.imgsrcimgPath; 
%>
  <li>
    <a class="pic" href="/tour/<%:item.sid %>.html" title="<%:item.sname %>" target="_blank"><img alt="<%:item.sname %>" rel="nofollow" title="<%:item.sname %>" src="<%:imgpath %>"/></a>
    <div class="info">
    <b><a href="/tour/<%:item.sid %>.html" title="<%:item.sname %>" target="_blank"><%:Html.cut(item.sname,10) %></a></b>
    <dl><dt>景点旅游主题：</dt><dd>
    <%for(int i = 0; i < themelist.Length; i++)
    {
        if(i <= 1)
        {  
           %><span class="ment_level dp_color_0<%:i+1 %>"><a href="http://travel.laidingba.com/beijing/1_0_0"><%:themelist[i]%></a></span><%  
        }   
    }
    %>
    </dd>
    </dl>
    <dl><dt>景点门票价格：</dt><dd><label>￥<%:amountAdv%></label><span class="jg"><%:youhui%></span></dd></dl>
    </div>
  </li>
<%       
}
%>