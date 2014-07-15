<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="OnlineOutPatientManagementSystem.Accounts.Admin.Test" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div>
       <telerik:RadGrid ID="RadGridUserList" runat="server" CellSpacing="0" GridLines="None" AutoGenerateColumns="False">
            <MasterTableView AllowPaging="True" Caption="User List" CommandItemDisplay="Top">
                <RowIndicatorColumn Visible="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn Created="True">
                </ExpandCollapseColumn>
                <Columns>
                    
                    <telerik:GridBoundColumn DataField="ID" Visible="false" FilterControlAltText="Filter column column" HeaderText="ID" UniqueName="column" ReadOnly="True">
                        <ColumnValidationSettings>
                           

                           

                           


                           

                           

                           

                           
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter InvDesc column" 
                                                        HeaderText="Login ID" SortExpression="UserName" UniqueName="UserName">
                            <ColumnValidationSettings>







                            </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="FName" FilterControlAltText="Filter FName column" HeaderText="First Name" UniqueName="FName">
                        <ColumnValidationSettings>
                          

                          

                          

                          
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LName" FilterControlAltText="Filter LName column" HeaderText="Last Name" UniqueName="LName">
                        <ColumnValidationSettings>
                        
                           

                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">

                </telerik:GridEditCommandColumn>
                   


                </Columns>
                
            
<EditFormSettings editformtype="Template">
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
    <FormTemplate>
        Here Is Edit Form
    </FormTemplate>
</EditFormSettings>
                
            
            </MasterTableView>
            

        </telerik:RadGrid>

    </div>
    </form>
</body>
</html>
