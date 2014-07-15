<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestOrderEntry.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.TestOrderEntry" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Order Entry</title>
    <link href="../../Styles/FormControlStyle.css" rel="stylesheet" type="text/css" />
        
</head>
<body>
    
    <form id="form1" runat="server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2" style="text-align:left;font-size:x-large;font-style:normal;font-weight:bold">
                    Test Order Entry</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPatientId" runat="server" Text="Patient ID:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPatientId" runat="server" CssClass="txtField" type="number" placeholder="Input Patient ID" MaxLength="11" pattern="\d{11}" title="Required 11 digit Patient ID" required="required"></asp:TextBox>
                    
                    </td>
                <td>
                    <asp:Label ID="lblReqDate" runat="server" Text="Requisition Date:"></asp:Label>
                    </td>
                <td>

                    <telerik:RadDatePicker ID="rDtpReqDate" Runat="server" Culture="en-US" 
                        FocusedDate="2013-01-01" MinDate="2013-01-01" SelectedDate="2013-11-12">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

<DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" LabelWidth="40%" 
                            displaytext="12-Nov-2013" selecteddate="2013-11-12" value="12-Nov-2013">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPatientName" runat="server" Text="Patient Name :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPatientName" runat="server" ReadOnly="True" 
                        CssClass="txtField"></asp:TextBox>
                        
                    </td>
                <td>
                        <asp:Label ID="lblDeliveryDate0" runat="server" Text="Delivery Date :"></asp:Label>
                    </td>
                <td>

                    <telerik:RadDatePicker ID="rDtpDeliveryDate" Runat="server" Culture="en-US" 
                        FocusedDate="2013-01-01" MinDate="2013-01-01" SelectedDate="2013-11-12">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

<DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" LabelWidth="40%" 
                            displaytext="12-Nov-2013" selecteddate="2013-11-12" value="12-Nov-2013">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkRegistrationFee" runat="server" Checked="True" 
                        Enabled="False" Text="Registration Fee" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblStudyPatientId" runat="server" Text="Study Patient ID:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtStudyPatientId" runat="server" ReadOnly="True" 
                        CssClass="txtField" Width="180px"></asp:TextBox>
                        
                    
                </td>
                <td>
                    <asp:Label ID="lblRelation" runat="server" Text="Relation:"></asp:Label>
                        </td>
                <td>
                    <asp:TextBox ID="txtRelation" runat="server" ReadOnly="True" 
                        CssClass="txtField" Width="180px"></asp:TextBox>
                        
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblHeight" runat="server" Text="Height (In CM):"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtHeight" runat="server" ReadOnly="True" CssClass="txtField" Width="50px"></asp:TextBox>
                         </td>
                <td>
                    <asp:Label ID="lblWeight" runat="server" Text="Weight (In KG):"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtWeight" runat="server" ReadOnly="True" CssClass="txtField" 
                        Width="50px"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblHip" runat="server" Text="Hip (In CM):"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtHip" runat="server" ReadOnly="True" CssClass="txtField" 
                        Width="50px"></asp:TextBox>
                         </td>
                <td>
                    <asp:Label ID="lblWaist" runat="server" Text="Waist (In CM):"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtWaist" runat="server" ReadOnly="True" CssClass="txtField" 
                        Width="50px"></asp:TextBox>
                         </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReferredBy" runat="server" Text="Referred By :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlReferredBy" runat="server" CssClass="comboField">
                    </asp:DropDownList>
                    <asp:Button ID="btnDoctorEntry" runat="server" CssClass="buttonField" 
                        Text="..." Width="30px" OnClientClick="window.open('../CashCounter/DoctorEntry.aspx', '_blank', 'status=no,toolbar=no,menubar=no,location=no,scrollbars=no,titlebar=no,resizable=no,copyhistory=false,height=500,width=500,left=200'); return false;"/>
                                
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblTestDetails" runat="server" Text="Test Details :"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="grdVwTestList" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Test Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlTestName" runat="server">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Lab Name">
                            
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Test Fee">
                            
                            </asp:TemplateField>
                                
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" class="add" id="btnAdd" value="Add" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" class="remove" id="btnRemove" value="Remove" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTestFeeTotal" runat="server" Text="Test Fee Total:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTestFeeTotal" runat="server" CssClass="txtField num" 
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDiscount" runat="server" Text="Discount:"></asp:Label>
                    <asp:Label ID="lblDiscountPercentage" runat="server" Text="()"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDiscount" runat="server" CssClass="txtField num" 
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRegistrationFee" runat="server" Text="Registration Fee:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRegistrationFee" runat="server" CssClass="txtField num" 
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTotalAmount" runat="server" Text="Total:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="txtField num" 
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAdvance" runat="server" Text="Advance:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdvance" runat="server" CssClass="txtField num" placeholder="Input Advance" type="number" pattern="[0-9]{1,5}([\.|,][0-9]{1,2})?" step="0.01" title="This should be a number with integer-part up to 5 digit and fractional-part up to 2 decimal places."></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDue" runat="server" Text="Due:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDue" runat="server" CssClass="txtField num" placeholder="Input Due" type="number" pattern="[0-9]{1,5}([\.|,][0-9]{1,2})?" step="0.01" title="This should be a number with integer-part up to 5 digit and fractional-part up to 2 decimal places."></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkFullPaid" runat="server" Text="Full Paid" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCashRecvDate" runat="server" Text="Cash Received Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCashRecvDate" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnNew" runat="server" Text="New" CssClass="buttonField" />
                    <asp:Button ID="btnFind" runat="server" Text="Find" CssClass="buttonField" />
                    <asp:Button ID="btnMoneyReceipt" runat="server" Text="Money Receipt" 
                        CssClass="buttonField" Width="100px" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="buttonField" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
