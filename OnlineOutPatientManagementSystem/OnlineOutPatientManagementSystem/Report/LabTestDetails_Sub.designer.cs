namespace OnlineOutPatientManagementSystem.Report
{
    partial class LabTestDetails_Sub
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LabTestDetails_Sub));
            Telerik.Reporting.Group group1 = new Telerik.Reporting.Group();
            Telerik.Reporting.Group group2 = new Telerik.Reporting.Group();
            Telerik.Reporting.ReportParameter reportParameter1 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.labelsGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.labTestIDCaptionTextBox = new Telerik.Reporting.TextBox();
            this.testFeeCaptionTextBox = new Telerik.Reporting.TextBox();
            this.testNameGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.shape1 = new Telerik.Reporting.Shape();
            this.testNameGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.testNameDataTextBox = new Telerik.Reporting.TextBox();
            this.testNameCaptionTextBox = new Telerik.Reporting.TextBox();
            this.sqlDataSource1 = new Telerik.Reporting.SqlDataSource();
            this.detail = new Telerik.Reporting.DetailSection();
            this.labTestIDDataTextBox = new Telerik.Reporting.TextBox();
            this.tNDescDataTextBox = new Telerik.Reporting.TextBox();
            this.testFeeDataTextBox = new Telerik.Reporting.TextBox();
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
            this.labelsGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.19999997317790985D);
            this.labelsGroupHeaderSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labTestIDCaptionTextBox,
            this.testFeeCaptionTextBox});
            this.labelsGroupHeaderSection.Name = "labelsGroupHeaderSection";
            this.labelsGroupHeaderSection.PrintOnEveryPage = true;
            // 
            // labTestIDCaptionTextBox
            // 
            this.labTestIDCaptionTextBox.CanGrow = true;
            this.labTestIDCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.labTestIDCaptionTextBox.Name = "labTestIDCaptionTextBox";
            this.labTestIDCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.7804708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.labTestIDCaptionTextBox.Style.Font.Bold = true;
            this.labTestIDCaptionTextBox.Style.Font.Italic = true;
            this.labTestIDCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            this.labTestIDCaptionTextBox.StyleName = "Caption";
            this.labTestIDCaptionTextBox.Value = "Test Details ---";
            // 
            // testFeeCaptionTextBox
            // 
            this.testFeeCaptionTextBox.CanGrow = true;
            this.testFeeCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.8000001907348633D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.testFeeCaptionTextBox.Name = "testFeeCaptionTextBox";
            this.testFeeCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.1999998092651367D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.testFeeCaptionTextBox.Style.Font.Bold = true;
            this.testFeeCaptionTextBox.Style.Font.Italic = true;
            this.testFeeCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            this.testFeeCaptionTextBox.StyleName = "Caption";
            this.testFeeCaptionTextBox.Value = "Test Fee";
            // 
            // testNameGroupFooterSection
            // 
            this.testNameGroupFooterSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.0520833320915699D);
            this.testNameGroupFooterSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.shape1});
            this.testNameGroupFooterSection.Name = "testNameGroupFooterSection";
            // 
            // shape1
            // 
            this.shape1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.shape1.Name = "shape1";
            this.shape1.ShapeType = new Telerik.Reporting.Drawing.Shapes.LineShape(Telerik.Reporting.Drawing.Shapes.LineDirection.EW);
            this.shape1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.9000003337860107D), Telerik.Reporting.Drawing.Unit.Inch(0.0520833320915699D));
            // 
            // testNameGroupHeaderSection
            // 
            this.testNameGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.20000004768371582D);
            this.testNameGroupHeaderSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.testNameDataTextBox,
            this.testNameCaptionTextBox});
            this.testNameGroupHeaderSection.Name = "testNameGroupHeaderSection";
            // 
            // testNameDataTextBox
            // 
            this.testNameDataTextBox.CanGrow = true;
            this.testNameDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.60000008344650269D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.testNameDataTextBox.Name = "testNameDataTextBox";
            this.testNameDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.1000000238418579D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.testNameDataTextBox.Style.Font.Bold = true;
            this.testNameDataTextBox.Style.Font.Italic = true;
            this.testNameDataTextBox.Style.Font.Name = "Arial";
            this.testNameDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            this.testNameDataTextBox.StyleName = "Data";
            this.testNameDataTextBox.Value = "= Fields.TNDesc";
            // 
            // testNameCaptionTextBox
            // 
            this.testNameCaptionTextBox.CanGrow = true;
            this.testNameCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.testNameCaptionTextBox.Name = "testNameCaptionTextBox";
            this.testNameCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.60000008344650269D), Telerik.Reporting.Drawing.Unit.Inch(0.20000004768371582D));
            this.testNameCaptionTextBox.Style.Font.Bold = true;
            this.testNameCaptionTextBox.Style.Font.Italic = true;
            this.testNameCaptionTextBox.Style.Font.Name = "Arial";
            this.testNameCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            this.testNameCaptionTextBox.StyleName = "Caption";
            this.testNameCaptionTextBox.Value = "Sample:";
            // 
            // sqlDataSource1
            // 
            this.sqlDataSource1.ConnectionString = "OnLinePrescriptionConnectionString";
            this.sqlDataSource1.Name = "sqlDataSource1";
            this.sqlDataSource1.SelectCommand = resources.GetString("sqlDataSource1.SelectCommand");
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(0.20843188464641571D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labTestIDDataTextBox,
            this.tNDescDataTextBox,
            this.testFeeDataTextBox});
            this.detail.Name = "detail";
            // 
            // labTestIDDataTextBox
            // 
            this.labTestIDDataTextBox.CanGrow = true;
            this.labTestIDDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.099999986588954926D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.labTestIDDataTextBox.Name = "labTestIDDataTextBox";
            this.labTestIDDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.90000003576278687D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.labTestIDDataTextBox.Style.Font.Name = "Arial";
            this.labTestIDDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            this.labTestIDDataTextBox.StyleName = "Data";
            this.labTestIDDataTextBox.Value = "=Fields.LabTestID";
            // 
            // tNDescDataTextBox
            // 
            this.tNDescDataTextBox.CanGrow = true;
            this.tNDescDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(1D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.tNDescDataTextBox.Name = "tNDescDataTextBox";
            this.tNDescDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.7804708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.tNDescDataTextBox.Style.Font.Name = "Arial";
            this.tNDescDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            this.tNDescDataTextBox.StyleName = "Data";
            this.tNDescDataTextBox.Value = "= Fields.TestName";
            // 
            // testFeeDataTextBox
            // 
            this.testFeeDataTextBox.CanGrow = true;
            this.testFeeDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.8000001907348633D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.testFeeDataTextBox.Name = "testFeeDataTextBox";
            this.testFeeDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.0973917245864868D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.testFeeDataTextBox.Style.Font.Name = "Arial";
            this.testFeeDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            this.testFeeDataTextBox.StyleName = "Data";
            this.testFeeDataTextBox.Value = "=Fields.TestFee";
            // 
            // LabTestDetails_Sub
            // 
            this.DataSource = this.sqlDataSource1;
            this.Filters.Add(new Telerik.Reporting.Filter("=Fields.LabTestID", Telerik.Reporting.FilterOperator.Equal, "=Parameters.LinkPrmLabTestID.Value"));
            group1.GroupFooter = this.labelsGroupFooterSection;
            group1.GroupHeader = this.labelsGroupHeaderSection;
            group1.Name = "labelsGroup";
            group2.GroupFooter = this.testNameGroupFooterSection;
            group2.GroupHeader = this.testNameGroupHeaderSection;
            group2.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.TNDesc"));
            group2.Name = "testDescGroup";
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            group1,
            group2});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labelsGroupHeaderSection,
            this.labelsGroupFooterSection,
            this.testNameGroupHeaderSection,
            this.testNameGroupFooterSection,
            this.detail});
            this.Name = "LabTestDetails_Sub";
            this.PageSettings.Landscape = false;
            this.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(1D));
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            reportParameter1.AllowNull = true;
            reportParameter1.Name = "LinkPrmLabTestID";
            reportParameter1.Text = "Parameter1";
            this.ReportParameters.Add(reportParameter1);
            this.Style.BackgroundColor = System.Drawing.Color.White;
            styleRule1.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Title")});
            styleRule1.Style.Color = System.Drawing.Color.Black;
            styleRule1.Style.Font.Bold = true;
            styleRule1.Style.Font.Italic = false;
            styleRule1.Style.Font.Name = "Tahoma";
            styleRule1.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(18D);
            styleRule1.Style.Font.Strikeout = false;
            styleRule1.Style.Font.Underline = false;
            styleRule2.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Caption")});
            styleRule2.Style.Color = System.Drawing.Color.Black;
            styleRule2.Style.Font.Name = "Tahoma";
            styleRule2.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(10D);
            styleRule2.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule3.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Data")});
            styleRule3.Style.Font.Name = "Tahoma";
            styleRule3.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            styleRule3.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule4.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("PageInfo")});
            styleRule4.Style.Font.Name = "Tahoma";
            styleRule4.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            styleRule4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.StyleSheet.AddRange(new Telerik.Reporting.Drawing.StyleRule[] {
            styleRule1,
            styleRule2,
            styleRule3,
            styleRule4});
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(4.6000003814697266D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.SqlDataSource sqlDataSource1;
        private Telerik.Reporting.GroupHeaderSection labelsGroupHeaderSection;
        private Telerik.Reporting.TextBox testNameCaptionTextBox;
        private Telerik.Reporting.TextBox labTestIDCaptionTextBox;
        private Telerik.Reporting.TextBox testFeeCaptionTextBox;
        private Telerik.Reporting.GroupFooterSection labelsGroupFooterSection;
        private Telerik.Reporting.GroupHeaderSection testNameGroupHeaderSection;
        private Telerik.Reporting.TextBox testNameDataTextBox;
        private Telerik.Reporting.GroupFooterSection testNameGroupFooterSection;
        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.TextBox labTestIDDataTextBox;
        private Telerik.Reporting.TextBox tNDescDataTextBox;
        private Telerik.Reporting.TextBox testFeeDataTextBox;
        private Telerik.Reporting.Shape shape1;

    }
}