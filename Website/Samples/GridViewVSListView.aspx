<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GridViewVSListView.aspx.cs" Inherits="Samples_GridViewVSListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>GridView POCO</h1>
    <%-- GridView can do a read, update, and delete but NOT an insert (you would need a different control) --%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GridViewODS" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="MenuCategoryDescription" HeaderText="MenuCategoryDescription" SortExpression="MenuCategoryDescription"></asp:BoundField>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID"></asp:BoundField>
            <asp:BoundField DataField="FoodDescription" HeaderText="FoodDescription" SortExpression="FoodDescription"></asp:BoundField>
            <asp:BoundField DataField="CurrentPrice" HeaderText="CurrentPrice" SortExpression="CurrentPrice"></asp:BoundField>
            <asp:BoundField DataField="TimesServed" HeaderText="TimesServed" SortExpression="TimesServed"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <h1>ListView POCO</h1>
    <%-- This list view is using the same data control (GridViewODS) as the Gridview
    
         List view allows you to customize how you data is presented AND is able to do COMPLETE CRUD processesing. 
   --%>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="GridViewODS">
        <%-- these are the odd rows --%>
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Label Text='<%# Eval("MenuCategoryDescription") %>' runat="server" ID="MenuCategoryDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ItemID") %>' runat="server" ID="ItemIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("FoodDescription") %>' runat="server" ID="FoodDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CurrentPrice") %>' runat="server" ID="CurrentPriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("TimesServed") %>' runat="server" ID="TimesServedLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <%-- these are the even rows --%>
        <ItemTemplate>
            <%-- here you would add any CSS styles to change the look of your form --%>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <%-- <%# Eval("MenuCategoryDescription") %> is how you grab the column of the dataset and fill it with info --%>
                    <%-- NOTE: you don't have to keep these labels in the default order, you can change them as must as you want --%>
                    <asp:Label Text='<%# Eval("MenuCategoryDescription") %>' runat="server" ID="MenuCategoryDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ItemID") %>' runat="server" ID="ItemIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("FoodDescription") %>' runat="server" ID="FoodDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CurrentPrice") %>' runat="server" ID="CurrentPriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("TimesServed") %>' runat="server" ID="TimesServedLabel" /></td>
            </tr>
        </ItemTemplate>
        <%-- This is defining what your layout is going to be. Since I chose a grid layout it is treating this as a table layout.
            - You have two rows, one that is built for your data and one that is built for  your paging. (t is buit for what is called the datata pager)
            - 
      --%>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <%-- Here are your column headers. You can edit these.  --%>
                                <th runat="server">MenuCategoryDescription</th>
                                <th runat="server">ItemID</th>
                                <th runat="server">Description</th>
                                <th runat="server">Price</th>
                                <th runat="server">Servings</th>
                            </tr>
                            <%-- this is the rest of your description
                                 on our content master form, on our site master, in the content area there is a tag called content placeholder. 
                                 --%>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    
   
    <asp:ObjectDataSource ID="GridViewODS" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="MenuCategoryFoodItemsPOCO_Get" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
</asp:Content>

