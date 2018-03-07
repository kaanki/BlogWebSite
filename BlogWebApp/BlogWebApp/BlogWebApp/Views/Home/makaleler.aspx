<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogWebApp.Models.makaleHelper>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    makaleler
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%Response.Write(ViewBag.kategoriAdi); %>Kategorisine ait makaleler</h2>

    <% 
        int i=0;
        int[]yorumSayi=(int[])ViewBag.yorumSayisi;
        if(Model.Count()>0)
        { 
        foreach (var item in Model)
	{
		 %>

    	<div class="content_wrapper content_mb_30">
                    <h2 class="post_title"><a href="<%:Url.Action("makale", new { id=item.makaleID})%>"><%Response.Write(item.makaleAdi); %></a></h2>
                    <img src="<%:Url.Content(item.resim) %>" style="width:600px; height:200px"; alt="flower 5" class="img_border img_nom" />
                    <p><b>Kategori:</b><a href="#" rel="nofollow"><%Response.Write(item.kategoriAdi); %></a><b>Yorum Sayisi:</b><%Response.Write(yorumSayi[i].ToString()); %></p>
                    <p><%Response.Write(item.makaleKisaAciklama); %></p>
                    <div class="clear"></div>
                <a href="<%:Url.Action("makale", new { id=item.makaleID})%>" class="more right">More</a>
				</div>

    <%
        
        i++;   
    }
    }
    else
        {
            Response.Write("Bu kategoriye ait makale bulunamadi");
        }
    
     %>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
