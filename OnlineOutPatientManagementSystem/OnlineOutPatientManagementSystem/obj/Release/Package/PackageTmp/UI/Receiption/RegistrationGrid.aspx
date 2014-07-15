<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationGrid.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.Receiption.RegistrationGrid" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>


    <script src="../../Scripts/UDScripts/CommonRADLib.js" type="text/javascript"></script>   
  
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat=server ID="IDScriptManager">
    
            <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.Core.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.jQuery.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.jQueryInclude.js">
            </asp:ScriptReference>
        </Scripts>
    
    
    
    </asp:ScriptManager>
    <telerik:RadWindowManager ID="IDRadWindowManager" runat="server" Modal="true" OnClientClose="OnClientClose" >
        
    </telerik:RadWindowManager>
  
    <div>
    
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="btnSearch">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblSearchResult" 
                            UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RGridSearchResult" 
                            UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RGridPatientView">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RGridSearchResult" 
                            UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RGridPatientView" 
                            UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        
        <telerik:RadGrid ID="RGridPatientView" runat="server">
        </telerik:RadGrid>

    </div>

    <div>


        <table class="style1">
            <tr>
                <td class="style2">
    
        
        <input id="BtnAdd" type="button" style="width:100px" value="Add New" onclick="return BtnAdd_onclick()" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:right" class="style2">
                    
                </td>
                <td style="text-align:left">
                    
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="style2" colspan="2">
                                       
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="style2" colspan="2">

                </td>
            </tr>
        </table>
    </div>
    
    </form>

      <script type="text/javascript">
<!--
    function refreshGrid() {
        $find("<%# RGridPatientView.ClientID %>").get_masterTableView().rebind();
          }
          // -->
    </script>
</body>
</html>
