<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Hotel>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Model" %>
<%
    IList<Hotel> hlist = ViewData["hlist"] as IList<Hotel>;
    IList<Hotel> goodlist = ViewData["goodlist"] as IList<Hotel>;
    var indate = DateTime.Now.ToString("yyyy-MM-dd");
    var outdate = DateTime.Now.AddDays(+1).ToString("yyyy-MM-dd");
%>
<ul class="items clearfix" id="ulhot">
<%if(hlist != null && hlist.Count > 0)
{
    foreach (Hotel item in hlist)
    {    
    %>
       <li>
        <a class="pic" href="/hotel/<%:item.hid %>.html" target="_blank" title="<%:item.hname %>">
        <img src="<%:item.photo %>" rel="nofollow" alt="<%:item.hname %>" title="<%:item.hname %>" width="60" height="51" /></a>
        <div class="info">
            <b><a href="/hotel/<%:item.hid %>.html" target="_blank"><%:item.hname %></a></b><p>酒店类型：<%:item.starname %></p><p>酒店位置：<%:item.address %></p>
        </div>
       </li>
    <%   
    } 
}
 %>
</ul>
<div class="list">
<%if(goodlist != null && goodlist.Count > 0)
{
    foreach (var item in goodlist)
    {
       %><dl><dt><a href="/hotel/<%:item.hid %>.html" target="_blank" title="<%:item.hname %>""><%:Html.cut(item.hname,10) %></a></dt><dd>￥<%:item.lowestPrice %>起</dd></dl><%  
    }      
}
%>
</div>