<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<BlogWebApp.kategoriler>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategoriDuzenle
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<article class="module width_full">

<h2>kategoriDuzenle</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>kategoriler</legend>

         <%: Html.HiddenFor(model => model.ID) %>
        <table>
            <tr>
                <td><%: Html.LabelFor(model => model.kategoriAdi) %></td>
                <td><%: Html.EditorFor(model => model.kategoriAdi) %></td>
                <td><%: Html.ValidationMessageFor(model => model.kategoriAdi) %></td>
            </tr>
            <tr>
                <td> <%: Html.LabelFor(model => model.urlsefKatAdi) %></td>
                <td><%: Html.EditorFor(model => model.urlsefKatAdi) %></td>
                <td><%: Html.ValidationMessageFor(model => model.urlsefKatAdi) %></td>
            </tr>
        </table>

        <p>
            <input type="submit" value="Duzenle" />
        </p>
    </fieldset>
<% } %>

        </article>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
