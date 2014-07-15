<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmTest.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.Prescription.frmTest" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<style type="text/css">
		#form1
		{
			width: auto;
			margin-top:auto;
			margin-bottom:auto;
			margin-left: auto;
			margin-right:auto;
		}
		</style>
</head>
<body>
	<form id="form1" runat="server">
	<div style="margin-left: 40px">
		<asp:GridView ID="gvPerson" runat="server" AutoGenerateColumns="False" 
			BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
			CellPadding="4" onpageindexchanging="gvPerson_PageIndexChanging" 
			onrowcancelingedit="gvPerson_RowCancelingEdit" 
			onrowdatabound="gvPerson_RowDataBound" onrowdeleting="gvPerson_RowDeleting" 
			onrowediting="gvPerson_RowEditing" onrowupdating="gvPerson_RowUpdating" 
			onsorting="gvPerson_Sorting">
			<RowStyle BackColor="White" ForeColor="#003399" />

			<Columns>
				<asp:CommandField ShowEditButton="True" />
				<asp:CommandField ShowDeleteButton="True" />
				<asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
					SortExpression="ID" />

				 <asp:TemplateField HeaderText="Chief Complain" SortExpression="ChiefComplain">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ChiefComplain") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("ChiefComplain") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="DurationYY" SortExpression="DurationYY">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DurationYY") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("DurationYY") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				 <asp:TemplateField HeaderText="DurationMM" SortExpression="DurationYY">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DurationMM") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("DurationMM") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>

				 <asp:TemplateField HeaderText="DurationDD" SortExpression="DurationYY">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DurationDD") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("DurationDD") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>


			</Columns>





			<FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
			<PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
			<SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
			<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
		</asp:GridView>
		<br />
		<asp:LinkButton ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click">Add New</asp:LinkButton>
		<br />
		<asp:Panel ID="pnlAdd" runat="server" Visible="False">
			<asp:Label ID="Label1" runat="server" Text="Chief Complience:"></asp:Label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label2" runat="server" Text="DurationYY"></asp:Label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label3" runat="server" Text="DurationMM"></asp:Label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label4" runat="server" Text="DurationDD"></asp:Label>
			<br />
			<asp:DropDownList ID="DropDownList1" runat="server">
			</asp:DropDownList>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="txtDurationYY" runat="server"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="txtDurationMM" runat="server" Height="22px"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="txtDurationDD" runat="server"></asp:TextBox>
			<br />
			<br />
			<br />
			<asp:LinkButton ID="lbtnSubmit" runat="server" onclick="lbtnSubmit_Click">Submit</asp:LinkButton>
			&nbsp;&nbsp;&nbsp;
			<asp:LinkButton ID="lbtnCancel" runat="server" onclick="lbtnCancel_Click">Cancel</asp:LinkButton>
		</asp:Panel>
		<br />

		<div>
		<br />
		<br />

		</div>

	</div>
	</form>
</body>
</html>
