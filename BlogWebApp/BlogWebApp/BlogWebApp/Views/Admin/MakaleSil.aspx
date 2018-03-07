<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.makaleler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MakaleSil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <article class="module width_full">
        <header><h3>Makale Sil</h3></header>
        <%Response.Write(ViewBag.silindi); %>
    </article>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
