<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.kategoriler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategorisil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>kategorisil</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>kategoriler</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kategoriAdi) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kategoriAdi) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.urlsefKatAdi) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.urlsefKatAdi) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Sil" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
