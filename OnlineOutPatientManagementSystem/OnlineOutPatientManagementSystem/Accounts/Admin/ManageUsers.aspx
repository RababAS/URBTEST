<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="OnlineOutPatientManagementSystem.Accounts.Admin.ManageUsers" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGridUserList">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGridUserList" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="lblMessage" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    <div>
    
        <telerik:RadGrid ID="RadGridUserList" runat="server" CellSpacing="0" GridLines="None" AutoGenerateColumns="False" OnInsertCommand="RadGridUserList_InsertCommand" DataSourceID="LinqDSUsers">
            <MasterTableView AllowPaging="True" Caption="User List" CommandItemDisplay="Top" DataSourceID="LinqDSUsers">
                <RowIndicatorColumn Visible="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn Created="True">
                </ExpandCollapseColumn>
                <Columns>
                    
                    <telerik:GridBoundColumn DataField="ID" Visible="false" FilterControlAltText="Filter column column" HeaderText="ID" UniqueName="column" ReadOnly="True">
                        <ColumnValidationSettings>
                           

                           
<ModelErrorMessage Text=""></ModelErrorMessage>
                           

                           
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter InvDesc column" 
                                                        HeaderText="Login ID" SortExpression="UserName" UniqueName="UserName">
                            <ColumnValidationSettings>

<ModelErrorMessage Text=""></ModelErrorMessage>

                            </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="FName" FilterControlAltText="Filter FName column" HeaderText="First Name" UniqueName="FName">
                        <ColumnValidationSettings>
                          
<ModelErrorMessage Text=""></ModelErrorMessage>
                          
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LName" FilterControlAltText="Filter LName column" HeaderText="Last Name" UniqueName="LName">
                        <ColumnValidationSettings>
                           
<ModelErrorMessage Text=""></ModelErrorMessage>
                           
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">

                </telerik:GridEditCommandColumn>
                   


                </Columns>
                
            
<EditFormSettings EditFormType="Template" FormMainTableCaption="Mange User Form"> 
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
    <FormTemplate>
        <br />
        <table>
            
            <tr>
                <td>Login ID:</td>
                <td class="auto-style1">
                    <telerik:RadTextBox ID="RtxtLoginID" MaxLength="50" runat="server" EmptyMessage="Login ID" >
                        
                    </telerik:RadTextBox>
                    
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVLoginID" runat="server" ControlToValidate="RtxtLoginID" ErrorMessage="Login ID is required" Text="*" ForeColor="#CC3300"></asp:RequiredFieldValidator> 
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorForLogInID" ControlToValidate="RtxtLoginID" runat="server" Text="*" ErrorMessage="Login ID is Minimum 5 & Maximus 50 Characters" ValidationExpression="^[\s\S]{5,50}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>First Name: </td>
                <td class="auto-style1"><telerik:RadTextBox ID="RtxtFirstName" MaxLength="50" runat="server"></telerik:RadTextBox> </td>
                
                 <td>Last Name: </td>
                <td><telerik:RadTextBox ID="RtxtLastName" MaxLength="50" runat="server"></telerik:RadTextBox> </td>
            </tr>
            <tr>
                <td>Role: </td> 
                <td class="auto-style1">
                    <telerik:RadDropDownList ID="RDDListRole" runat="server" DataSourceID="LinqDSRole" DataTextField="Name" DataValueField="Id"></telerik:RadDropDownList>
                </td>
            </tr>
            
            <tr>
                <td>Password:</td>
                <td class="auto-style1">
                    <telerik:RadTextBox ID="RtxtPassword" runat="server" TextMode="Password" ></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="RtxtPassword" Text="*" ErrorMessage=" Password is Required" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorForPassword" ControlToValidate="RtxtPassword" runat="server" Text="*" ErrorMessage="Password is minimum 5 characters" ValidationExpression="^[\s\S]{5,50}" ForeColor="#CC3300"></asp:RegularExpressionValidator>

                </td>
             </tr>
             <tr>
                <td>Re-type Password:</td>
                <td class="auto-style1">
                    <telerik:RadTextBox ID="RtxtRetypePassword" runat="server" TextMode="Password"></telerik:RadTextBox>
                    <asp:CompareValidator ID="CVPassword" runat="server" Text="*" ErrorMessage="Password doesn't match" ControlToValidate="RtxtPassword" ControlToCompare="RtxtRetypePassword" ForeColor="#CC3300"></asp:CompareValidator>
                </td>
                       
             </tr>
            <tr>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#993300" />
                </td>
                
            </tr>
            <tr>
              
                  <td>

                      <asp:Button ID="TmbtnSave" runat="server" 
                          Text='<%# (Container is GridEditFormInsertItem) ? "Insert":"Update" %>'
                      CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert":"Update" %>' />
                      <asp:Button ID="TmbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" /> 

                </td>
                
            </tr>
            
        </table>
        
    </FormTemplate>
</EditFormSettings>
                
            
            </MasterTableView>
            

        </telerik:RadGrid>
    
        <asp:LinqDataSource ID="LinqDSUsers" runat="server" ContextTypeName="OnlineOutPatientManagementSystem.ORM.OnLinePrescriptionDataContext" EntityTypeName="" TableName="AspNetUsers">
        </asp:LinqDataSource>
    
    </div>
    
    <script type="text/javascript">
       

    </script>
        <asp:LinqDataSource ID="LinqDSRole" runat="server" ContextTypeName="OnlineOutPatientManagementSystem.ORM.OnLinePrescriptionDataContext" EntityTypeName="" TableName="AspNetRoles">
        </asp:LinqDataSource>
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
        
    </form>
    
    </body>
</html>
