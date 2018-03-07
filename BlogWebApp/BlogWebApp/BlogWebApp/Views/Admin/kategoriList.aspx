<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BlogWebApp.kategoriler>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    kategoriList
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>kategoriList</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.kategoriAdi) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.urlsefKatAdi) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.kategoriAdi) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.urlsefKatAdi) %>
        </td>
        <td>
            <%: Html.ActionLink("Duzenle", "kategoriDuzenle", new { id=item.ID }) %> |

            <%: Html.ActionLink("Sil", "kategorisil", new { id=item.ID }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
