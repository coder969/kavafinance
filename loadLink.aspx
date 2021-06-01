<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Link>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Model" %>
<%
    IList<Link> linklist = ViewData["link"] as IList<Link>;
%>
<%if(linklist != null && linklist.Count > 0)
{
    foreach (var item in linklist)
    {
      %>
      <a href="<%:item.website %>" target="_blank" title="<%:item.webname %>"><%:item.webname %></a>
      <%    
    }   
}
%>
