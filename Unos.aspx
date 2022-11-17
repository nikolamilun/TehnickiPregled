<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Unos.aspx.cs" Inherits="proba._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
       
        <p>automobil</p>
        <asp:DropDownList ID="ddlAutomobil" runat="server" DataSourceID="AutomobilDs" DataTextField="AutomobilID" DataValueField="AutomobilID"></asp:DropDownList>
        <asp:SqlDataSource ID="AutomobilDs" runat="server" ConnectionString="<%$ ConnectionStrings:TehnickiPregledConnectionString %>" SelectCommand="SELECT * FROM [Automobil]"></asp:SqlDataSource>
        <p>kontrolor</p>
        <asp:DropDownList ID="ddlKontrolor" runat="server" DataSourceID="KontrolorDs" DataTextField="KontrolorID" DataValueField="KontrolorID"></asp:DropDownList>
        <asp:SqlDataSource ID="KontrolorDs" runat="server" ConnectionString="<%$ ConnectionStrings:TehnickiPregledConnectionString %>" SelectCommand="SELECT * FROM [Kontrolor]"></asp:SqlDataSource>
        <p>datum pregleda</p>
        <asp:Calendar ID="kalDatum" runat="server"></asp:Calendar>
        <p>cena</p>
        <asp:TextBox ID="txtCena" runat="server"></asp:TextBox>
        <p>prosao</p>
        <asp:CheckBox ID="cbProsao" runat="server" />
        <br /><br />


        <asp:Button ID="btnUpisi" runat="server" Text="Upisi" OnClick="btnUpisi_Click" />
    </div>

</asp:Content>
