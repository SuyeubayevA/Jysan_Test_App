<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndividualsPage.aspx.cs" Inherits="JysanTestApp_1.IndividualsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .IndividGrid {
            margin-left: 0px;
        }
        .IndividGrid {
            border: 1px solid #ddd;
            margin: 15px;
            -webkit-border-radius: 3px 3px 0 0;
            -moz-border-radius: 3px 3px 0 0;
            border-radius: 3px 3px 0 0;
        }
        .IndividGrid td {
            vertical-align:top;
        }
        .header {
            overflow: hidden;
            position: relative;
            border-bottom: 1px solid #ddd;
            height: 30px;
        }
 
            .header th {
                color: #222;
                font-weight: normal;
                line-height: 40px;
                text-align: left;
                /* text-shadow: 0 1px #FFFFFF; */
                white-space: nowrap;
                border-right: 1px solid #ddd;
                border-bottom: 2px solid #ddd;
                padding: 0px 15px 0px 15px;
                -webkit-border-radius: 1px;
                -moz-border-radius: 1px;
            }
 
        .trow1 {
            background: #f9f9f9;
        }
 
        .trow2 {
            background: #fff;
        }
 
            .trow1 td, .trow2 td {
                color: #555;
                line-height: 18px;
                padding: 9px 5px;
                text-align: left;
                border-right: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                text-align: left;
                
            }
 
        input[type='text'],select {
            border: 1px solid #b8b8b8;
            border-radius: 3px;
            color: #999999;
            float: left;
            height: 22px;
            padding: 0 5px;
            position: relative;
            width: 185px;            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="IndividGridview" 
                runat="server" 
                AutoGenerateColumns="false"
                DataKeyNames="IndividualId" 
                CellPadding="10" 
                CellSpacing="0" 
                ShowFooter="true"
                CssClass="IndividGrid"
                HeaderStyle-CssClass="header"
                RowStyle-CssClass="throw1"
                AlternatingRowStyle="throw2" 
                OnRowCommand="IndividGridview_RowCommand"
                OnRowCancelingEdit="Individview_RowCancelingEdit" 
                OnRowDeleting="Individview_RowDeleting" 
                OnRowEditing="Individview_RowEditing" 
                OnRowUpdating="Individview_RowUpdating"
                >
                <Columns>

                    <asp:TemplateField>
                        <HeaderTemplate>Имя</HeaderTemplate>
                        <ItemTemplate><%Eval("Name"); %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtIPName" runat="server" Text='<%#Bind("Name") %>' />
                            <asp:RequiredFieldValidator ID="RFIPNEdit" runat="server" ForeColor="Red" ErrorMessage="*"
                                 Display="Dynamic" ValidationGroup="edit" ControlToValidate="txtIPName">Required</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIPName" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RFIPN" runat="server" ErrorMessage="*"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtIPName">
                                Required
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Фамилия</HeaderTemplate>
                        <ItemTemplate><%Eval("FamilyName"); %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtIPFamilyName" runat="server" Text='<%#Bind("FamilyName") %>' />
                            <asp:RequiredFieldValidator ID="RFIPFNEdit" runat="server" ForeColor="Red" ErrorMessage="*"
                                 Display="Dynamic" ValidationGroup="edit" ControlToValidate="txtIPFamilyName">Required</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIPFamilyName" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RFIPFN" runat="server" ErrorMessage="*"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtIPFamilyName">
                                Required
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Отчество</HeaderTemplate>
                        <ItemTemplate><%Eval("FatherName"); %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtIPFatherName" runat="server" Text='<%#Bind("FatherName") %>' />
                            <asp:RequiredFieldValidator ID="RFIPFEdit" runat="server" ForeColor="Red" ErrorMessage="*"
                                 Display="Dynamic" ValidationGroup="edit" ControlToValidate="txtIPFatherName">Required</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIPFatherName" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RFIPF" runat="server" ErrorMessage="*"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtIPFatherName">
                                Required
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>ИИН</HeaderTemplate>
                        <ItemTemplate><%Eval("BIN_IIN"); %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtIIN" runat="server" Text='<%#Bind("BIN_IIN") %>' />
                            <asp:RequiredFieldValidator ID="RFIINEdit" runat="server" ForeColor="Red" ErrorMessage="*"
                                 Display="Dynamic" ValidationGroup="edit" ControlToValidate="txtIIN">Required</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIIN" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RFIIN" runat="server" ErrorMessage="*"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtIIN">
                                Required
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Автор</HeaderTemplate>
                        <ItemTemplate><%Eval("Author"); %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAuthor" runat="server" Text='<%#Bind("Author") %>' />
                            <asp:RequiredFieldValidator ID="RFAuthEdit" runat="server" ForeColor="Red" ErrorMessage="*"
                                 Display="Dynamic" ValidationGroup="edit" ControlToValidate="txtAuthor">Required</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RFAuth" runat="server" ErrorMessage="*"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtAuthor">
                                Required
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                            &nbsp;|&nbsp;
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Update" ValidationGroup="edit">Update</asp:LinkButton>
                            &nbsp;|&nbsp;
                            <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnInsert" runat="server" Text="Save" CommandName="Insert" ValidationGroup="Add" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
