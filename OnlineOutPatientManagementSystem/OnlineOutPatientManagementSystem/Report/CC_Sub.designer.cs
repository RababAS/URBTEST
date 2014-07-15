namespace OnlineOutPatientManagementSystem.Report
{
    partial class CC_Sub
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CC_Sub));
            Telerik.Reporting.Group group1 = new Telerik.Reporting.Group();
            Telerik.Reporting.ReportParameter reportParameter1 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.labelsGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.srNoCaptionTextBox = new Telerik.Reporting.TextBox();
            this.chiefComplainceCaptionTextBox = new Telerik.Reporting.TextBox();
            this.yYCaptionTextBox = new Telerik.Reporting.TextBox();
            this.mMCaptionTextBox = new Telerik.Reporting.TextBox();
            this.dDCaptionTextBox = new Telerik.Reporting.TextBox();
            this.sqlDataSource1 = new Telerik.Reporting.SqlDataSource();
            this.detail = new Telerik.Reporting.DetailSection();
            this.srNoDataTextBox = new Telerik.Reporting.TextBox();
            this.chiefComplainceDataTextBox = new Telerik.Reporting.TextBox();
            this.yYDataTextBox = new Telerik.Reporting.TextBox();
            this.mMDataTextBox = new Telerik.Reporting.TextBox();
            this.dDDataTextBox = new Telerik.Reporting.TextBox();
            this.shape1 = new Telerik.Reporting.Shape();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // labelsGroupFooterSection
            // 
            this.labelsGroupFooterSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.0520833320915699D);
            this.labelsGroupFooterSection.Name = "labelsGroupFooterSection";
            this.labelsGroupFooterSection.Style.Visible = false;
            // 
            // labelsGroupHeaderSection
            // 
            this.labelsGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.20000004768371582D);
            this.labelsGroupHeaderSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.srNoCaptionTextBox,
            this.chiefComplainceCaptionTextBox,
            this.yYCaptionTextBox,
            this.mMCaptionTextBox,
            this.dDCaptionTextBox});
            this.labelsGroupHeaderSection.Name = "labelsGroupHeaderSection";
            this.labelsGroupHeaderSection.PrintOnEveryPage = true;
            // 
            // srNoCaptionTextBox
            // 
            this.srNoCaptionTextBox.CanGrow = true;
            this.srNoCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.srNoCaptionTextBox.Name = "srNoCaptionTextBox";
            this.srNoCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.37916669249534607D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.srNoCaptionTextBox.Style.Color = System.Drawing.Color.Black;
            this.srNoCaptionTextBox.Style.Font.Bold = true;
            this.srNoCaptionTextBox.Style.Font.Name = "Arial";
            this.srNoCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.srNoCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.srNoCaptionTextBox.StyleName = "Caption";
            this.srNoCaptionTextBox.Value = "Sr No";
            // 
            // chiefComplainceCaptionTextBox
            // 
            this.chiefComplainceCaptionTextBox.CanGrow = true;
            this.chiefComplainceCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.40000000596046448D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.chiefComplainceCaptionTextBox.Name = "chiefComplainceCaptionTextBox";
            this.chiefComplainceCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.8000001907348633D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.chiefComplainceCaptionTextBox.Style.Color = System.Drawing.Color.Black;
            this.chiefComplainceCaptionTextBox.Style.Font.Bold = true;
            this.chiefComplainceCaptionTextBox.Style.Font.Name = "Arial";
            this.chiefComplainceCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.chiefComplainceCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
            this.chiefComplainceCaptionTextBox.StyleName = "Caption";
            this.chiefComplainceCaptionTextBox.Value = "Chief Complaince";
            // 
            // yYCaptionTextBox
            // 
            this.yYCaptionTextBox.CanGrow = true;
            this.yYCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.1999998092651367D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.yYCaptionTextBox.Name = "yYCaptionTextBox";
            this.yYCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.2265583723783493D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.yYCaptionTextBox.Style.Color = System.Drawing.Color.Black;
            this.yYCaptionTextBox.Style.Font.Bold = true;
            this.yYCaptionTextBox.Style.Font.Name = "Arial";
            this.yYCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.yYCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.yYCaptionTextBox.StyleName = "Caption";
            this.yYCaptionTextBox.Value = "YY";
            // 
            // mMCaptionTextBox
            // 
            this.mMCaptionTextBox.CanGrow = true;
            this.mMCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.4265584945678711D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.mMCaptionTextBox.Name = "mMCaptionTextBox";
            this.mMCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.30000019073486328D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.mMCaptionTextBox.Style.Color = System.Drawing.Color.Black;
            this.mMCaptionTextBox.Style.Font.Bold = true;
            this.mMCaptionTextBox.Style.Font.Name = "Arial";
            this.mMCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.mMCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.mMCaptionTextBox.StyleName = "Caption";
            this.mMCaptionTextBox.Value = "MM";
            // 
            // dDCaptionTextBox
            // 
            this.dDCaptionTextBox.CanGrow = true;
            this.dDCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.7265584468841553D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.dDCaptionTextBox.Name = "dDCaptionTextBox";
            this.dDCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.30902257561683655D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.dDCaptionTextBox.Style.Color = System.Drawing.Color.Black;
            this.dDCaptionTextBox.Style.Font.Bold = true;
            this.dDCaptionTextBox.Style.Font.Name = "Arial";
            this.dDCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.dDCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.dDCaptionTextBox.StyleName = "Caption";
            this.dDCaptionTextBox.Value = "DD";
            // 
            // sqlDataSource1
            // 
            this.sqlDataSource1.ConnectionString = "OnLinePrescriptionConnectionString";
            this.sqlDataSource1.Name = "sqlDataSource1";
            this.sqlDataSource1.SelectCommand = resources.GetString("sqlDataSource1.SelectCommand");
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(0.19999995827674866D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.srNoDataTextBox,
            this.chiefComplainceDataTextBox,
            this.yYDataTextBox,
            this.mMDataTextBox,
            this.dDDataTextBox,
            this.shape1});
            this.detail.Name = "detail";
            // 
            // srNoDataTextBox
            // 
            this.srNoDataTextBox.CanGrow = true;
            this.srNoDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.srNoDataTextBox.Name = "srNoDataTextBox";
            this.srNoDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.37916669249534607D), Telerik.Reporting.Drawing.Unit.Inch(0.13750004768371582D));
            this.srNoDataTextBox.Style.Font.Name = "Arial";
            this.srNoDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.srNoDataTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.srNoDataTextBox.StyleName = "Data";
            this.srNoDataTextBox.Value = "=Fields.SrNo";
            // 
            // chiefComplainceDataTextBox
            // 
            this.chiefComplainceDataTextBox.CanGrow = true;
            this.chiefComplainceDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.40000000596046448D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.chiefComplainceDataTextBox.Name = "chiefComplainceDataTextBox";
            this.chiefComplainceDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.8000001907348633D), Telerik.Reporting.Drawing.Unit.Inch(0.13750004768371582D));
            this.chiefComplainceDataTextBox.Style.Font.Name = "Arial";
            this.chiefComplainceDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.chiefComplainceDataTextBox.StyleName = "Data";
            this.chiefComplainceDataTextBox.Value = "=Fields.ChiefComplaince";
            // 
            // yYDataTextBox
            // 
            this.yYDataTextBox.CanGrow = true;
            this.yYDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.1999998092651367D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.yYDataTextBox.Name = "yYDataTextBox";
            this.yYDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.2265583723783493D), Telerik.Reporting.Drawing.Unit.Inch(0.13750004768371582D));
            this.yYDataTextBox.Style.Font.Name = "Arial";
            this.yYDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.yYDataTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.yYDataTextBox.StyleName = "Data";
            this.yYDataTextBox.Value = "=Fields.YY";
            // 
            // mMDataTextBox
            // 
            this.mMDataTextBox.CanGrow = true;
            this.mMDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.4265584945678711D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.mMDataTextBox.Name = "mMDataTextBox";
            this.mMDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.30000019073486328D), Telerik.Reporting.Drawing.Unit.Inch(0.13750004768371582D));
            this.mMDataTextBox.Style.Font.Name = "Arial";
            this.mMDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.mMDataTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.mMDataTextBox.StyleName = "Data";
            this.mMDataTextBox.Value = "=Fields.MM";
            // 
            // dDDataTextBox
            // 
            this.dDDataTextBox.CanGrow = true;
            this.dDDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.7265584468841553D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.dDDataTextBox.Name = "dDDataTextBox";
            this.dDDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.299999862909317D), Telerik.Reporting.Drawing.Unit.Inch(0.13750004768371582D));
            this.dDDataTextBox.Style.Font.Name = "Arial";
            this.dDDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.dDDataTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.dDDataTextBox.StyleName = "Data";
            this.dDDataTextBox.Value = "=Fields.DD";
            // 
            // shape1
            // 
            this.shape1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.13757872581481934D));
            this.shape1.Name = "shape1";
            this.shape1.ShapeType = new Telerik.Reporting.Drawing.Shapes.LineShape(Telerik.Reporting.Drawing.Shapes.LineDirection.EW);
            this.shape1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.0147478580474854D), Telerik.Reporting.Drawing.Unit.Inch(0.0520833320915699D));
            // 
            // CC_Sub
            // 
            this.DataSource = this.sqlDataSource1;
            this.Filters.Add(new Telerik.Reporting.Filter("=Fields.VisitID", Telerik.Reporting.FilterOperator.Equal, "=Parameters.LinkprmCCVisitID.Value"));
            group1.GroupFooter = this.labelsGroupFooterSection;
            group1.GroupHeader = this.labelsGroupHeaderSection;
            group1.Name = "labelsGroup";
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            group1});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labelsGroupHeaderSection,
            this.labelsGroupFooterSection,
            this.detail});
            this.Name = "CC_Sub";
            this.PageSettings.Landscape = false;
            this.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(1D), Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(1D));
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            reportParameter1.AllowNull = true;
            reportParameter1.AvailableValues.DataSource = this.sqlDataSource1;
            reportParameter1.AvailableValues.ValueMember = "= Fields.VisitID";
            reportParameter1.Name = "LinkprmCCVisitID";
            reportParameter1.Text = "Parameter1";
            this.ReportParameters.Add(reportParameter1);
            this.Style.BackgroundColor = System.Drawing.Color.White;
            this.Style.Visible = true;
            styleRule1.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Title")});
            styleRule1.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(214)))), ((int)(((byte)(97)))), ((int)(((byte)(74)))));
            styleRule1.Style.Font.Name = "Georgia";
            styleRule1.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(18D);
            styleRule2.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Caption")});
            styleRule2.Style.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(140)))), ((int)(((byte)(174)))), ((int)(((byte)(173)))));
            styleRule2.Style.BorderColor.Default = System.Drawing.Color.FromArgb(((int)(((byte)(115)))), ((int)(((byte)(168)))), ((int)(((byte)(212)))));
            styleRule2.Style.BorderStyle.Default = Telerik.Reporting.Drawing.BorderType.Dotted;
            styleRule2.Style.BorderWidth.Default = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            styleRule2.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(228)))), ((int)(((byte)(238)))), ((int)(((byte)(243)))));
            styleRule2.Style.Font.Name = "Georgia";
            styleRule2.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(10D);
            styleRule2.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule3.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Data")});
            styleRule3.Style.Font.Name = "Georgia";
            styleRule3.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            styleRule3.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule4.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("PageInfo")});
            styleRule4.Style.Font.Name = "Georgia";
            styleRule4.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            styleRule4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.StyleSheet.AddRange(new Telerik.Reporting.Drawing.StyleRule[] {
            styleRule1,
            styleRule2,
            styleRule3,
            styleRule4});
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(3.03558087348938D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.SqlDataSource sqlDataSource1;
        private Telerik.Reporting.GroupHeaderSection labelsGroupHeaderSection;
        private Telerik.Reporting.TextBox srNoCaptionTextBox;
        private Telerik.Reporting.TextBox chiefComplainceCaptionTextBox;
        private Telerik.Reporting.TextBox yYCaptionTextBox;
        private Telerik.Reporting.TextBox mMCaptionTextBox;
        private Telerik.Reporting.TextBox dDCaptionTextBox;
        private Telerik.Reporting.GroupFooterSection labelsGroupFooterSection;
        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.TextBox srNoDataTextBox;
        private Telerik.Reporting.TextBox chiefComplainceDataTextBox;
        private Telerik.Reporting.TextBox yYDataTextBox;
        private Telerik.Reporting.TextBox mMDataTextBox;
        private Telerik.Reporting.TextBox dDDataTextBox;
        private Telerik.Reporting.Shape shape1;

    }
}