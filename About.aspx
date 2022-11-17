<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="proba.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>Svi tehnicki pregledi</p>

    <asp:GridView ID="gwPodaci" runat="server" AutoGenerateColumns="False" DataKeyNames="TehnickiPregledID" DataSourceID="PodaciDS">
        <Columns>
            <asp:BoundField DataField="TehnickiPregledID" HeaderText="TehnickiPregledID" InsertVisible="False" ReadOnly="True" SortExpression="TehnickiPregledID" />
            <asp:BoundField DataField="AutomobilID" HeaderText="AutomobilID" SortExpression="AutomobilID" />
            <asp:BoundField DataField="KontrolorID" HeaderText="KontrolorID" SortExpression="KontrolorID" />
            <asp:BoundField DataField="DatumPregleda" HeaderText="DatumPregleda" SortExpression="DatumPregleda" />
            <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
            <asp:CheckBoxField DataField="Prosao" HeaderText="Prosao" SortExpression="Prosao" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="PodaciDS" runat="server" ConnectionString="<%$ ConnectionStrings:TehnickiPregledConnectionString %>" SelectCommand="SELECT * FROM [TehnickiPregled]"></asp:SqlDataSource>
</asp:Content>
