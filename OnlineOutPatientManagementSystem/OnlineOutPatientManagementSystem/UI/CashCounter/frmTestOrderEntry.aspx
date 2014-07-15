<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmTestOrderEntry.aspx.cs" EnableEventValidation="false"
    Inherits="OnlineOutPatientManagementSystem.UI.CashCounter.frmTestOrderEntry"%>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>Test Order Entry</title>


    <link href="../../ValidationEngine.css" rel="stylesheet" />
    <script src="../../Scripts/jsFunctions.js"></script>

    

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/languages/jquery.validationEngine-en.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/jquery.validationEngine.js"
        charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            $("#TestOrder").validationEngine('attach', { promptPosition: "topRight" });
        });
    </script>

 
   

    <script type="text/javascript">

        function checkDecimal(el) {
            var ex = /^[0-9]+\.?[0-2]*$/;
            if (ex.test(el.value) == false) {
                alert('Decimal Value upto 2 places allowed !');
                el.value = '';
            }
        }

        function openReport() {

            alert('Data Save successfully.');
            var strLabTestID = document.getElementById('txtLabTestID').value;

            var url = "/Report/frmCommonReportViewer.aspx?prmReportNmae=LabTest &prmLabTestID=" + strLabTestID;
            //ViewReport(url);


            myWindow = window.open(url);
            myWindow.focus();

            window.location = '/Default.aspx';
        }

        //var specialKeys = new Array();
        //specialKeys.push(8); //Backspace

        //function IsNumeric(e) {
        //    var keyCode = e.which ? e.which : e.keyCode
        //    var ret = (keyCode > 31 && (keyCode < 48 || keyCode > 57))
        //    document.getElementById("error").style.display = ret ? "none" : "inline";
        //    return ret;
        //}
    </script>

     <script type="text/javascript" language="javascript">
         function confirmCancel() {
             var mgs = 'Are you sure that you want to cancel?';
             if (!confirm(mgs))
             {
                 return false
             }
             else
             {
                 close();
                 return false
             }
         }


         function ValGridAlert() {
             alert('Please add minimum one row.');
         }

         function DataSaveAlert() {
             alert('Data Save successfully.');
             //window.location = '/UI/Prescription/frmPrescriptionFrontPage.aspx';
         }

         function isNumberKey(evt) {
             //var charCode = (evt.which) ? evt.which : event.keyCode
             //if (charCode > 31 && (charCode < 48 || charCode > 57))
             //    return false;
             //return true;

             var charCode = (evt.which) ? evt.which : event.keyCode; // restrict user to type only one . point in number
             var parts = evt.srcElement.value.split('.');
             if (parts.length > 1 && charCode == 46)
                 return false;
             return true;
         }

         function URMNonURBchk() {           
             if (document.getElementById('chkNonURBRef').checked)
             {
                 document.getElementById('ddlURBReferredBy').disabled = true;
                 document.getElementById('txtNonURBReferredBy').disabled = false;
                 $("#ddlURBReferredBy").val($("#ddlURBReferredBy option:first-child").val());
             }
             else
             {
                 document.getElementById('ddlURBReferredBy').disabled = false;
                 document.getElementById('txtNonURBReferredBy').disabled = true;
             }
         }

    </script>


    <script language="javascript" type="text/javascript">
        function Total_Result() {
            var txtFirstNumberValue = document.getElementById('txtTestFeeTotal').value;
            var txtSecondNumberValue = document.getElementById('txtDiscount').value;
            if (txtFirstNumberValue == "")
                txtFirstNumberValue = 0.00;
            if (txtSecondNumberValue == "")
                txtSecondNumberValue = 0.00;

            var result = parseInt(txtFirstNumberValue) - parseInt(txtSecondNumberValue);
            if (!isNaN(result)) {
                document.getElementById('txtTotalAmount').value = result;
            }
        }

        function Due_Result() {
            var txtFirstNumberValue = document.getElementById('txtTotalAmount').value;
            var txtSecondNumberValue = document.getElementById('txtAdvance').value;
            if (txtFirstNumberValue == "")
                txtFirstNumberValue = 0.00;
            if (txtSecondNumberValue == "")
                txtSecondNumberValue = 0.00;

            var result = parseInt(txtFirstNumberValue) - parseInt(txtSecondNumberValue);
            if (!isNaN(result)) {
                document.getElementById('txtDue').value = result;
            }
        }
    </script>


    <script language="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById('chkFullPaid').checked) {
                //document.getElementById('txtAdvance').disabled = true;
                document.getElementById('txtAdvance').value = document.getElementById('txtTotalAmount').value;

                document.getElementById('txtDue').value = 0.00;

                //alert("checked");
            }
            //else {
                //document.getElementById('txtAdvance').disabled = false;
                //document.getElementById('txtAdvance').value = 00;

                //alert("You didn't check it! Let me check it for you.")
            //}
        }
    </script>



   

    <style type="text/css">
        #TestOrder 
        {
            display: block;
            margin-top: 50px;
            margin-bottom: auto;
            margin-left: 50px;
            margin-right: 50px;
            width: 871px;
        }
        .style1
        {
            width: 90%;
        }

        .style100
        {
            width: 100%;
        }

        .style2
        {
            width: 50%;
        }

        .style3
        {
            width: 25%;
        }

         .style4
        {
            width: 100%;
            text-align: center;
            float:left;
        }

         .style60
        {
            width: 60%;
        }

         .style40
        {
            width: 40%;
        }

          .style30
        {
            width: 30%;
        }

           .style20
        {
            width: 20%;
        }

         .style14
        {
            width: 14%;
        }

    .txtField
{       text-align:center;
		border: 1px solid #5D5454;
		font-size: 11px;
		padding: 2px 0 0 1px;
}

    </style>
</head>

<body>
    <form id="TestOrder" runat="server">

         <div class="style1">
            <fieldset>
                <table class="style100">

                    <tr>
                        <td class="style1" style="text-align: center; font-size: x-large; font-style: normal; font-weight: bold">
                            Investigation Order Entry
                        </td>                      
                    </tr>
                    
                    <tr>                     
                        <td class="style1" style="text-align: center">
                            <asp:Label ID="lblLabTestID" runat="server" Text="Lab Test ID:"></asp:Label>
                        &nbsp;
                            <asp:TextBox ID="txtLabTestID" runat="server" Width="120px" Enabled="false" ></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </fieldset>
        </div>

         <br />


        <div style="float:left; width:90%;">

              <div style="float:left; width:49%; margin-right:10px;">    
             <fieldset>
                 <legend id="PatientType">Basic Info</legend>

                 <table class="style100">

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblPatientId" runat="server" Text="Patient ID:"></asp:Label>
                         </td>

                         <td class="style60">
                              <asp:TextBox ID="txtPatientId" runat="server" AutoPostBack="True" type="number" CssClass="validate[required]"
                                placeholder="Input Patient ID" MaxLength="11" pattern="\d{11}" Width="120px"
                                onFocus="this.select()" onkeypress="return IsNumeric(event);" OnTextChanged="txtPatientId_TextChanged">
                            </asp:TextBox>
                             <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>
                         </td>
                     </tr>

                     <tr>

                         <td class="auto-style5">
                             <asp:Label ID="lblPatientName" runat="server" Text="Patient Name :"></asp:Label>
                         </td>
                         <td class="auto-style4">
                             <asp:TextBox ID="txtPatientName" runat="server" Enabled="False" Width="250px"></asp:TextBox>
                         </td>

                     </tr>

                      <tr class="style100">
                          <td class="auto-style5">
                            <asp:Label ID="lblPatientAge" runat="server" Text="Patient Age :"></asp:Label>
                        </td>

                        <td class="auto-style4">
                            <table style="width: 90%">
                                <tr>
                                    <td style="width: 8%">

                                        <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>

                                    </td>
                                    <td style="width: 17%">

                                        <asp:TextBox ID="txtYear" runat="server" Width="40px" Enabled="False">00</asp:TextBox>

                                    </td>
                                    <td style="width: 8%">
                                        <asp:Label ID="lblMonth" runat="server" Text="Month"></asp:Label>
                                    </td>
                                    <td style="width: 17%">
                                        <asp:TextBox ID="txtMonth" runat="server" Width="40px" Enabled="False">00</asp:TextBox>
                                    </td>
                                    <td style="width: 8%">
                                        <asp:Label ID="lblDay" runat="server" Text="Day"></asp:Label>
                                    </td>
                                    <td style="width: 17%">
                                        <asp:TextBox ID="txtDay" runat="server" Width="40px" Enabled="False">00</asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblStudyPatientId" runat="server" Text="Study ID:"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtStudyPatientId" runat="server"
                                 Width="120px" Enabled="false"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="Label1" runat="server" Text="Study Name:"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtStudyName" runat="server"
                                 Width="250px" Enabled="false"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblRelation" runat="server" Text="Relation:"></asp:Label>
                          </td>

                          <td class="style60">
                              <asp:TextBox ID="txtRelation" runat="server"
                                  Width="120px" Enabled="false"></asp:TextBox>
                          </td>
                     </tr>

                     <tr class="style100">
                         <td class="style40">
                             
                    <asp:Label ID="lblRegistrationFee" runat="server" Text="Reg Fee:"></asp:Label>
                             
                          </td>

                          <td class="style60">
                              <asp:TextBox ID="txtRegistrationFee" runat="server" Width="120px" Enabled="false" ></asp:TextBox>
                          </td>
                     </tr>

                 </table>
             </fieldset>
             
             <br />   
             
              <fieldset>
                 <legend id="PBasicInfo">Basic Calculations</legend>

                 <table class="style100">

                      <tr class="style100">
                         <td class="style30">
                             <asp:Label ID="lblHeight" runat="server" Text="Height (In CM):"></asp:Label>
                          </td>

                         <td class="style20">                        
                             <telerik:RadNumericTextBox ID="txtHeight" runat="server" onFocus="this.select()"                                
                                 MaxLength="2" MaxValue="99" MinValue="0" Width="50px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                         </td>

                          <td class="style30">
                             <asp:Label ID="lblHip" runat="server" Text="Hip (In CM):"></asp:Label>
                          </td>

                         <td class="style20">
                             <telerik:RadNumericTextBox ID="txtHip" runat="server" onFocus="this.select()"                                
                                 MaxLength="2" MaxValue="99" MinValue="0" Width="50px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                          </td>
                     </tr>




                     <tr class="style100">
                         <td class="style30">
                             <asp:Label ID="lblWeight" runat="server" Text="Weight (In KG):"></asp:Label>
                         </td>

                         <td class="style20">                         
                             <telerik:RadNumericTextBox ID="txtWeight" runat="server" onFocus="this.select()"                                
                                 MaxLength="2" MaxValue="99" MinValue="0" Width="50px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                         </td>

                         <td class="style30">
                             <asp:Label ID="lblWaist" runat="server" Text="Waist (In CM):"></asp:Label>
                          </td>

                         <td class="style20">
                             <telerik:RadNumericTextBox ID="txtWaist" runat="server" onFocus="this.select()"                                
                                 MaxLength="2" MaxValue="99" MinValue="0" Width="50px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                          </td>
                     </tr>

                 </table>
             </fieldset> 
              
                  
               <br />

               <fieldset>
                 <legend id="AgeInfo">Time & Date</legend>

                 <table class="style100">                     
                     <tr class="style100">
                         
                         <td class="style40">                          
                    <asp:Label ID="lblCashRecvDate" runat="server" Text="Cash Received Date:"></asp:Label>
                         </td>

                         <td class="style60">
                             <telerik:RadDatePicker ID="dtCashRecvDate" Runat="server" Culture="English (United States)">
                                 <DateInput DateFormat="dd/MM/yyyy">
                                 </DateInput> 
                             </telerik:RadDatePicker>

                             <asp:RequiredFieldValidator ID="ReqValCashRecvDate" runat="server" ControlToValidate="dtCashRecvDate" ForeColor="Red"
                                ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                         </td>

                     </tr>

                     <tr class="style100">
                         
                         <td class="style40">
                             <asp:Label ID="lblTestDate" runat="server" Text="Test Date:"></asp:Label>
                         </td>

                         <td class="style60">
                             <telerik:RadDatePicker ID="dtTestDate" runat="server" Culture="English (United States)">
                                 <DateInput DateFormat="dd/MM/yyyy">
                                 </DateInput>
                             </telerik:RadDatePicker>                             
                         </td> 
                                             
                     </tr>

                      <tr class="style100">
                         
                         <td class="style40">
                             <asp:Label ID="lblDeliveryDate" runat="server" Text="Delivery Date :"></asp:Label>
                         </td>

                         <td class="style60">
                             <telerik:RadDatePicker ID="dtDeliveryDate" runat="server" Culture="English (United States)">
                                 <DateInput DateFormat="dd/MM/yyyy">
                                 </DateInput>
                             </telerik:RadDatePicker>
                         </td> 
                                             
                     </tr>

                 </table>

             </fieldset> 
                       
        </div>


       <div style="float:right; width:49%; margin-left:5px;">
                       
             <fieldset>
                 <legend id="NIDMobile">Test Details</legend>

                 <table class="style100">

                     <tr class="style100">
                         <td class="style100">

                             <telerik:RadGrid ID="RGTestName" runat="server" CellSpacing="0" 
                                 GridLines="None" Width="360px" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" OnItemDataBound="RGTestName_ItemDataBound"
                                 AutoGenerateDeleteColumn="True" OnItemDeleted="RGTestName_ItemDeleted" OnItemInserted="RGTestName_ItemInserted"
                                  DataSourceID="SqlDSLabTestInfoDetails">

                                 <ValidationSettings ValidationGroup="ValGRGTestName" />
                                 <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Bottom" 
                                     AllowAutomaticUpdates="True" ShowFooter="True"
                                     DataKeyNames="LabTestID,TNDCode" DataSourceID="SqlDSLabTestInfoDetails">
                                     
                                     <Columns>

                                         <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No" ReadOnly="True">
                                             <ItemTemplate>
                                                 <%#Container.DataSetIndex+1 %>
                                             </ItemTemplate>
                                             <HeaderStyle Width="50px" />
                                         </telerik:GridTemplateColumn>

                                      
                                          <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_TestNameDetails" Display="False" 
                                             FilterControlAltText="Filter ddlTNDCode column" HeaderText="TND Code"
                                             ListTextField="TestName" ListValueField="TNDCode" UniqueName="ddlTNDCode" DataField="TNDCode"
                                             AllowAutomaticLoadOnDemand="False" Resizable="False">

                                             <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                 RenderValidatorBeforeEditor="True">
                                                 <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                             </ColumnValidationSettings>
                                         </telerik:GridDropDownColumn>

                                        

                                         <telerik:GridBoundColumn DataField="TestName" FilterControlAltText="Filter TestName column" 
                                             HeaderText="TestName" SortExpression="TestName" UniqueName="TestName" ReadOnly="True">
                                         </telerik:GridBoundColumn>

                                        

                                         <telerik:GridBoundColumn DataField="TestFee" DataType="System.Decimal" FilterControlAltText="Filter TestFee column" 
                                             HeaderText="TestFee" SortExpression="TestFee" UniqueName="TestFee" ReadOnly="True"
                                             FooterText="Total: " Aggregate="Sum">
                                         </telerik:GridBoundColumn>


                                     </Columns>
                                     
                                 </MasterTableView>
                             </telerik:RadGrid>

                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style100">

                         </td>
                     </tr>

                 </table>

                 <table class="style100">

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblTestFeeTotal" runat="server" Text="Test Fee Total:"></asp:Label>
                         </td>

                         <td class="style60">
                             <telerik:RadNumericTextBox ID="txtTestFeeTotal" runat="server" onchange="Total_Result();"
                                 ValidationGroup="valGCommon" placeholder="Temparature"
                                 MaxLength="6" MaxValue="100000" MinValue="0" Width="200px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                         </td>
                     </tr>

                      <tr class="style1">
                         <td class="style40">
                             <asp:Label ID="lblDiscount" runat="server" Text="Discount:"></asp:Label>
                         </td>

                         <td class="style60">
                            

                             <telerik:RadNumericTextBox ID="txtDiscount" runat="server" onchange="Total_Result();" placeholder="Input Discount"
                                 ValidationGroup="valGCommon" onkeyup="Total_Result();" onFocus="this.select()"
                                 MaxLength="6" MaxValue="100000" MinValue="0" Width="200px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>
                         </td>
                     </tr>

                     <tr class="style1">
                         <td class="style40">
                             <asp:Label ID="lblTotalAmount" runat="server" Text="Total:" ></asp:Label>
                         </td>

                         <td class="style60">                
                             <telerik:RadNumericTextBox ID="txtTotalAmount" runat="server"
                                 ValidationGroup="valGCommon" onkeyup="Due_Result();"
                                 MaxLength="6" MaxValue="100000" MinValue="0" Width="200px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                         </td>
                     </tr>

                     <tr class="style1">
                         <td class="style40">

                    <asp:Label ID="lblAdvance" runat="server" Text="Advance:"></asp:Label>

                         </td>

                         <td class="style60">

                             <telerik:RadNumericTextBox ID="txtAdvance" runat="server" placeholder="Input Advance" onFocus="this.select()"
                                 ValidationGroup="valGCommon" onkeyup="Due_Result();"
                                 MaxLength="6" MaxValue="100000" MinValue="0" Width="200px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>

                         </td>
                     </tr>

                     <tr class="style1">
                         <td class="style40">
                             <asp:Label ID="lblDue" runat="server" Text="Due:"></asp:Label>
                         </td>

                         <td class="style60">
                             <telerik:RadNumericTextBox ID="txtDue" runat="server"
                                 ValidationGroup="valGCommon" onkeyup="Due_Result();"
                                 MaxLength="6" MaxValue="100000" MinValue="0" Width="200px">
                                 <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                             </telerik:RadNumericTextBox>
                         </td>
                     </tr>

                     <tr class="style1">
                         <td class="style40">

                         </td>

                         <td class="style60">

                    <asp:CheckBox ID="chkFullPaid" runat="server" Text="Full Paid" onclick="validate()"/>

                         </td>
                     </tr>
                 </table>




                 <table class="style100">

                     <tr class="style1">
                         <td class="style2">
                             <asp:Label ID="lblDiscountBy" runat="server" Text="Discount By :"></asp:Label>
                         </td>

                         <td class="style2">

                             <asp:TextBox ID="txtDiscountBy" runat="server" Width="200px">                                
                             </asp:TextBox>

                         </td>
                     </tr>

                     <tr class="style1">
                         <td class="style2">
                             <asp:Label ID="lblReferredBy" runat="server" Text="Referred By :"></asp:Label>
                             &nbsp;
                             </td>

                         <td class="style2">
                             <asp:DropDownList ID="ddlURBReferredBy" runat="server"
                                 Width="200">
                             </asp:DropDownList>
                            
                             <cc1:CascadingDropDown ID="ccddlURBReferredBy" TargetControlID="ddlURBReferredBy" PromptText="Select Referred By"
                                 PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDoctorNameList" runat="server"
                                 Category="DNCode" LoadingText="Loading..." />
                         </td>
                     </tr>

                     <tr class="style1">
                         <td class="style2">
                             <asp:Label ID="lblNonURBReferredBy" runat="server" Text="Ref By :"></asp:Label>
                             &nbsp;
                             <asp:CheckBox ID="chkNonURBRef" runat="server" Text="Non URB" onclick="URMNonURBchk();"/>
                         </td>

                         <td class="style2">
                             <asp:TextBox ID="txtNonURBReferredBy" runat="server" placeholder="Input Non URB Ref" Width="200PX">                                
                             </asp:TextBox>
                         </td>
                     </tr>

                 </table>
             </fieldset> 
           
           <br />
          
        </div>

        </div>

       <div style="float:left; width:90%;">
           <br />   
        </div>

       <div style="float:left; width:90%;">   
             <fieldset>
                <table class="style100">
                    <tr class="style2">
                         <td style="text-align: right">
                             <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                         </td>
                         <td style="text-align: left">
                             <asp:Button ID="btnClose" runat="server" Text="Close" OnClientClick="return confirmCancel()" 
                                 ValidationGroup="none" cssclass="cancel" UseSubmitBehavior="false"/>
                         </td>
                     </tr>

                   <tr class="style2">
                         <td style="text-align: right">

                         </td>
                         <td style="text-align: left">

                         </td>
                     </tr>
                 </table>
                                  
            </fieldset>   
        </div>

        <div class="style1">
            <table class="style100">
                <tr class="style1">
                    <td class="style40">
                        &nbsp;</td>

                    <td class="style60">

                    </td>
                </tr>

                <tr class="style1">
                    <td class="style40">
                        
                        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </cc1:ToolkitScriptManager>
                        
                    </td>

                    <td class="style60">                 
                    </td>
                </tr>

                <tr class="style1">
                    <td class="style40">
                        <asp:SqlDataSource ID="SqlDSLabTestInfoDetails" runat="server" 
                            
                            ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" 
                            
                            DeleteCommand="DELETE FROM [LabTestInfoDetails] WHERE [LabTestID] = @LabTestID AND [TNDCode] = @TNDCode" 
                            
                           InsertCommand="INSERT INTO [LabTestInfoDetails] ([LabTestID], [TNDCode], [LNCode], [TestFee], [IsFree]) 
                            VALUES (@LabTestID, @TNDCode, (SELECT isnull(TNCode,0) FROM lkp_TestNameDetails where TNDCode=@TNDCode), 
                            (SELECT isnull(TestFee,0) FROM lkp_TestNameDetails where TNDCode=@TNDCode), 0)" 
                            
                            SelectCommand="select t.LabTestID,t.TNDCode,lt.TestName,t.LNCode,t.TestFee,t.IsFree from LabTestInfoDetails as t 
                            inner join lkp_TestNameDetails as lt on t.TNDCode=lt.TNDCode WHERE ([LabTestID] = @LabTestID)"
                            
                            
                            UpdateCommand="UPDATE [LabTestInfoDetails] SET [LNCode] = @LNCode, [TestFee] = @TestFee, [IsFree] = @IsFree 
                            HERE [LabTestID] = @LabTestID AND [TNDCode] = @TNDCode">

                            <DeleteParameters>
                                <asp:Parameter Name="LabTestID" Type="String" />
                                <asp:Parameter Name="TNDCode" Type="Int16" />
                            </DeleteParameters>

                            <InsertParameters>
                               <asp:ControlParameter ControlID="txtLabTestID" Name="LabTestID" PropertyName="Text" Type="String" />
                                <asp:SessionParameter SessionField="ddlTNDCode" Name="TNDCode" Type="Int32" />

                                <asp:Parameter Name="LNCode" Type="Byte" />
                                <asp:Parameter Name="TestFee" Type="Decimal" />
                                <asp:Parameter Name="IsFree" Type="Boolean" />
                            </InsertParameters>

                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtLabTestID" Name="LabTestID" PropertyName="Text" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="LNCode" Type="Byte" />
                                <asp:Parameter Name="TestFee" Type="Decimal" />
                                <asp:Parameter Name="IsFree" Type="Boolean" />
                                <asp:Parameter Name="LabTestID" Type="String" />
                                <asp:Parameter Name="TNDCode" Type="Int16" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>

                    <td class="style60"></td>
                </tr>

                <tr class="style1">
                    <td class="style40">
                        <asp:SqlDataSource ID="SqlDSlkp_TestNameDetails" runat="server"
                            ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                            SelectCommand="SELECT [TNDCode], [TestName] FROM [lkp_TestNameDetails]"></asp:SqlDataSource>
                    </td>

                    <td class="style60">&nbsp;</td>
                </tr>

                <tr class="style1">
                    <td class="style40">

                    </td>

                    <td class="style60">

                    </td>
                </tr>

                 <tr class="style1">
                    <td class="style40">

                        &nbsp;</td>

                    <td class="style60">

                    </td>
                </tr>

                 <tr class="style1">
                    <td class="style40">

                        &nbsp;</td>

                    <td class="style60">

                    </td>
                </tr>

                 <tr class="style1">
                    <td class="style40">

                         <telerik:RadWindowManager ID="RadWindowManager" runat="server">
                         </telerik:RadWindowManager>

                    </td>

                    <td class="style60">

                    </td>
                </tr>

                 <tr class="style1">
                    <td class="style40">
                        <telerik:RadAjaxManager ID="RadAjaxManagerRegistration" runat="server">
                            <AjaxSettings>                                                               
                                <telerik:AjaxSetting AjaxControlID="RGTestName">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="RGTestName" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtTestFeeTotal" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtDiscount" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtTotalAmount" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtAdvance" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtDue" UpdatePanelCssClass="" />
                                    </UpdatedControls>
                                </telerik:AjaxSetting>                              
                            </AjaxSettings>
                        </telerik:RadAjaxManager>
                    </td>

                    <td class="style60">

                    </td>
                </tr>

            </table>
        </div>

    </form>

    <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
    <script type="text/javascript">
        function RowSelected(sender, args) {

            var grid = $find("<%=RGTestName.ClientID %>");

            var totalAmount = 0;

            if (grid) {
                var MasterTable = grid.get_masterTableView();
                var Rows = MasterTable.get_dataItems();
                for (var i = 0; i < Rows.length; i++) {
                    var row = Rows[i];
                    if (row.get_selected() == true) {

                        totalAmount = totalAmount + parseFloat(row.getDataKeyValue("TestFee"));
                    }
                }
            }

            if ($("span[id$='myFooter']").length > 0) {
                $("span[id$='myFooter']").get(0).innerHTML = "sum is : " + totalAmount;
            }
        }
    </script>
</telerik:RadCodeBlock>

</body>
</html>
