<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <%
        
        var makaleler = (IEnumerable<BlogWebApp.Models.makaleHelper>)ViewBag.makaleList;
        foreach (var item in makaleler)
        {%>
            
      
            	<div class="content_wrapper content_mb_30">
                    <h2 class="post_title"><a href="<%:Url.Action("makale", new { id=item.makaleID})%>"><%Response.Write(item.makaleAdi); %></a></h2>
                    <img src="<%:Url.Content(item.resim) %>" style="width:600px; height:200px"; alt="flower 5" class="img_border img_nom" />
                    <p><b>Kategori:</b><a href="#" rel="nofollow"><%Response.Write(item.kategoriAdi); %></a></p>
                    <p><%Response.Write(item.makaleKisaAciklama); %></p>
                    <div class="clear"></div>
                <a href="<%:Url.Action("makale", new { id=item.makaleID})%>" class="more right">More</a>
				</div>

    <%
    }
        
         %>

    <div class="templatemo_paging">
        <ul>
            <%
                
                int sayfasayisi = Convert.ToInt32(ViewBag.sayfasayisi);
                int sayfa = ViewBag.sayfa;
                if (sayfasayisi > 1)
                {
                    for (int i =1; i <= sayfasayisi; i++)
                    {
                        if (i == sayfa)
                        {
                            Response.Write("<li><a href='#'><b style='color:#000'>" + i + "</b></a></li>");
                        }
                        else
                        {
                            Response.Write("<li><a href='" + Url.Action("index", new { id = i }) + "'>" + i + "</a></li>");
                        }
                    }
                }
                
                 %>
        </ul>
        <div class="clear"></div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%:Url.Content("~/Content/css/nivo-slider.css") %>" type="text/css" media="screen" />
</asp:Content>
