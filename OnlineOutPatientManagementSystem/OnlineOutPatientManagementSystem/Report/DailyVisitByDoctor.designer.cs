namespace OnlineOutPatientManagementSystem.Report
{
    partial class DailyVisitByDoctor
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DailyVisitByDoctor));
            Telerik.Reporting.Group group1 = new Telerik.Reporting.Group();
            Telerik.Reporting.Group group2 = new Telerik.Reporting.Group();
            Telerik.Reporting.ReportParameter reportParameter1 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.ReportParameter reportParameter2 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.doctorNameGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.textBox3 = new Telerik.Reporting.TextBox();
            this.doctorNameGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.doctorNameCaptionTextBox = new Telerik.Reporting.TextBox();
            this.doctorNameDataTextBox = new Telerik.Reporting.TextBox();
            this.labelsGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.entryDateCaptionTextBox = new Telerik.Reporting.TextBox();
            this.visitIDCaptionTextBox = new Telerik.Reporting.TextBox();
            this.patientIDCaptionTextBox = new Telerik.Reporting.TextBox();
            this.doctorFeeCaptionTextBox = new Telerik.Reporting.TextBox();
            this.textBox1 = new Telerik.Reporting.TextBox();
            this.sqlDataSource2 = new Telerik.Reporting.SqlDataSource();
            this.sqlDataSource3 = new Telerik.Reporting.SqlDataSource();
            this.sqlDataSource1 = new Telerik.Reporting.SqlDataSource();
            this.pageHeader = new Telerik.Reporting.PageHeaderSection();
            this.reportNameTextBox = new Telerik.Reporting.TextBox();
            this.pageFooter = new Telerik.Reporting.PageFooterSection();
            this.currentTimeTextBox = new Telerik.Reporting.TextBox();
            this.pageInfoTextBox = new Telerik.Reporting.TextBox();
            this.reportHeader = new Telerik.Reporting.ReportHeaderSection();
            this.titleTextBox = new Telerik.Reporting.TextBox();
            this.reportFooter = new Telerik.Reporting.ReportFooterSection();
            this.detail = new Telerik.Reporting.DetailSection();
            this.entryDateDataTextBox = new Telerik.Reporting.TextBox();
            this.visitIDDataTextBox = new Telerik.Reporting.TextBox();
            this.patientIDDataTextBox = new Telerik.Reporting.TextBox();
            this.doctorFeeDataTextBox = new Telerik.Reporting.TextBox();
            this.textBox2 = new Telerik.Reporting.TextBox();
            this.shape1 = new Telerik.Reporting.Shape();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // doctorNameGroupFooterSection
            // 
            this.doctorNameGroupFooterSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.22896988689899445D);
            this.doctorNameGroupFooterSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.textBox3});
            this.doctorNameGroupFooterSection.Name = "doctorNameGroupFooterSection";
            // 
            // textBox3
            // 
            this.textBox3.Format = "{0:N2}";
            this.textBox3.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(5.4473919868469238D), Telerik.Reporting.Drawing.Unit.Inch(3.9418537198798731E-05D));
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.85260838270187378D), Telerik.Reporting.Drawing.Unit.Inch(0.20000012218952179D));
            this.textBox3.Style.Font.Bold = true;
            this.textBox3.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.textBox3.Value = "= Sum(Fields.DoctorFee)";
            // 
            // doctorNameGroupHeaderSection
            // 
            this.doctorNameGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.5D);
            this.doctorNameGroupHeaderSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.doctorNameCaptionTextBox,
            this.doctorNameDataTextBox});
            this.doctorNameGroupHeaderSection.Name = "doctorNameGroupHeaderSection";
            // 
            // doctorNameCaptionTextBox
            // 
            this.doctorNameCaptionTextBox.CanGrow = true;
            this.doctorNameCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.doctorNameCaptionTextBox.Name = "doctorNameCaptionTextBox";
            this.doctorNameCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.87916678190231323D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.doctorNameCaptionTextBox.Style.Font.Bold = true;
            this.doctorNameCaptionTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.doctorNameCaptionTextBox.StyleName = "Caption";
            this.doctorNameCaptionTextBox.Value = "Doctor Name:";
            // 
            // doctorNameDataTextBox
            // 
            this.doctorNameDataTextBox.CanGrow = true;
            this.doctorNameDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(1D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.doctorNameDataTextBox.Name = "doctorNameDataTextBox";
            this.doctorNameDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(2.8000001907348633D), Telerik.Reporting.Drawing.Unit.Inch(0.17916662991046906D));
            this.doctorNameDataTextBox.Style.Font.Bold = true;
            this.doctorNameDataTextBox.StyleName = "Data";
            this.doctorNameDataTextBox.Value = "=Fields.DoctorName";
            // 
            // labelsGroupFooterSection
            // 
            this.labelsGroupFooterSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.28125D);
            this.labelsGroupFooterSection.Name = "labelsGroupFooterSection";
            this.labelsGroupFooterSection.Style.Visible = false;
            // 
            // labelsGroupHeaderSection
            // 
            this.labelsGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.22918622195720673D);
            this.labelsGroupHeaderSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.entryDateCaptionTextBox,
            this.visitIDCaptionTextBox,
            this.patientIDCaptionTextBox,
            this.doctorFeeCaptionTextBox,
            this.textBox1});
            this.labelsGroupHeaderSection.Name = "labelsGroupHeaderSection";
            this.labelsGroupHeaderSection.PrintOnEveryPage = true;
            // 
            // entryDateCaptionTextBox
            // 
            this.entryDateCaptionTextBox.CanGrow = true;
            this.entryDateCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.entryDateCaptionTextBox.Name = "entryDateCaptionTextBox";
            this.entryDateCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.6554708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.entryDateCaptionTextBox.Style.Font.Bold = true;
            this.entryDateCaptionTextBox.StyleName = "Caption";
            this.entryDateCaptionTextBox.Value = "Entry Date";
            // 
            // visitIDCaptionTextBox
            // 
            this.visitIDCaptionTextBox.CanGrow = true;
            this.visitIDCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.1763043403625488D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.visitIDCaptionTextBox.Name = "visitIDCaptionTextBox";
            this.visitIDCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.6554708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.visitIDCaptionTextBox.Style.Font.Bold = true;
            this.visitIDCaptionTextBox.StyleName = "Caption";
            this.visitIDCaptionTextBox.Value = "Visit ID";
            // 
            // patientIDCaptionTextBox
            // 
            this.patientIDCaptionTextBox.CanGrow = true;
            this.patientIDCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(3.8526086807250977D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.patientIDCaptionTextBox.Name = "patientIDCaptionTextBox";
            this.patientIDCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.6554708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.patientIDCaptionTextBox.Style.Font.Bold = true;
            this.patientIDCaptionTextBox.StyleName = "Caption";
            this.patientIDCaptionTextBox.Value = "Patient ID";
            // 
            // doctorFeeCaptionTextBox
            // 
            this.doctorFeeCaptionTextBox.CanGrow = true;
            this.doctorFeeCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(5.5289125442504883D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.doctorFeeCaptionTextBox.Name = "doctorFeeCaptionTextBox";
            this.doctorFeeCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.75025433301925659D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.doctorFeeCaptionTextBox.Style.Font.Bold = true;
            this.doctorFeeCaptionTextBox.StyleName = "Caption";
            this.doctorFeeCaptionTextBox.Value = "Doctor Fee";
            // 
            // textBox1
            // 
            this.textBox1.CanGrow = true;
            this.textBox1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.49992132186889648D), Telerik.Reporting.Drawing.Unit.Inch(0.18759854137897492D));
            this.textBox1.Style.Font.Bold = true;
            this.textBox1.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.textBox1.StyleName = "Caption";
            this.textBox1.Value = "SLNo";
            // 
            // sqlDataSource2
            // 
            this.sqlDataSource2.ConnectionString = "OnLinePrescriptionConnectionString";
            this.sqlDataSource2.Name = "sqlDataSource2";
            this.sqlDataSource2.SelectCommand = resources.GetString("sqlDataSource2.SelectCommand");
            // 
            // sqlDataSource3
            // 
            this.sqlDataSource3.ConnectionString = "OnLinePrescriptionConnectionString";
            this.sqlDataSource3.Name = "sqlDataSource3";
            this.sqlDataSource3.SelectCommand = resources.GetString("sqlDataSource3.SelectCommand");
            // 
            // sqlDataSource1
            // 
            this.sqlDataSource1.ConnectionString = "OnLinePrescriptionConnectionString";
            this.sqlDataSource1.Name = "sqlDataSource1";
            this.sqlDataSource1.Parameters.AddRange(new Telerik.Reporting.SqlDataSourceParameter[] {
            new Telerik.Reporting.SqlDataSourceParameter("@DoctorName", System.Data.DbType.AnsiString, "=Parameters.DoctorName.Value"),
            new Telerik.Reporting.SqlDataSourceParameter("@VisitDate", System.Data.DbType.DateTime, "=Parameters.VisitDate.Value")});
            this.sqlDataSource1.SelectCommand = "dbo.sp_rpt_DailyVisitByDoctor";
            this.sqlDataSource1.SelectCommandType = Telerik.Reporting.SqlDataSourceCommandType.StoredProcedure;
            // 
            // pageHeader
            // 
            this.pageHeader.Height = Telerik.Reporting.Drawing.Unit.Inch(0.44166669249534607D);
            this.pageHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.reportNameTextBox});
            this.pageHeader.Name = "pageHeader";
            // 
            // reportNameTextBox
            // 
            this.reportNameTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.reportNameTextBox.Name = "reportNameTextBox";
            this.reportNameTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(6.6843833923339844D), Telerik.Reporting.Drawing.Unit.Inch(0.40000000596046448D));
            this.reportNameTextBox.StyleName = "PageInfo";
            this.reportNameTextBox.Value = "DailyVisitByDoctor";
            // 
            // pageFooter
            // 
            this.pageFooter.Height = Telerik.Reporting.Drawing.Unit.Inch(0.16041669249534607D);
            this.pageFooter.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.currentTimeTextBox,
            this.pageInfoTextBox});
            this.pageFooter.Name = "pageFooter";
            // 
            // currentTimeTextBox
            // 
            this.currentTimeTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.currentTimeTextBox.Name = "currentTimeTextBox";
            this.currentTimeTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.3317749500274658D), Telerik.Reporting.Drawing.Unit.Inch(0.1395832747220993D));
            this.currentTimeTextBox.StyleName = "PageInfo";
            this.currentTimeTextBox.Value = "=NOW()";
            // 
            // pageInfoTextBox
            // 
            this.pageInfoTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(3.3734416961669922D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.pageInfoTextBox.Name = "pageInfoTextBox";
            this.pageInfoTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(2.92655873298645D), Telerik.Reporting.Drawing.Unit.Inch(0.1395832747220993D));
            this.pageInfoTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.pageInfoTextBox.StyleName = "PageInfo";
            this.pageInfoTextBox.Value = "=PageNumber";
            // 
            // reportHeader
            // 
            this.reportHeader.Height = Telerik.Reporting.Drawing.Unit.Inch(0.35833331942558289D);
            this.reportHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.titleTextBox});
            this.reportHeader.Name = "reportHeader";
            // 
            // titleTextBox
            // 
            this.titleTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.titleTextBox.Name = "titleTextBox";
            this.titleTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(6.7260499000549316D), Telerik.Reporting.Drawing.Unit.Inch(0.35833331942558289D));
            this.titleTextBox.StyleName = "Title";
            this.titleTextBox.Value = "DailyVisitByDoctor";
            // 
            // reportFooter
            // 
            this.reportFooter.Height = Telerik.Reporting.Drawing.Unit.Inch(0.28125D);
            this.reportFooter.Name = "reportFooter";
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(0.21892738342285156D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.entryDateDataTextBox,
            this.visitIDDataTextBox,
            this.patientIDDataTextBox,
            this.doctorFeeDataTextBox,
            this.textBox2,
            this.shape1});
            this.detail.Name = "detail";
            // 
            // entryDateDataTextBox
            // 
            this.entryDateDataTextBox.CanGrow = true;
            this.entryDateDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.entryDateDataTextBox.Name = "entryDateDataTextBox";
            this.entryDateDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.6554708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.14593188464641571D));
            this.entryDateDataTextBox.StyleName = "Data";
            this.entryDateDataTextBox.Value = "=Fields.EntryDate";
            // 
            // visitIDDataTextBox
            // 
            this.visitIDDataTextBox.CanGrow = true;
            this.visitIDDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.1763043403625488D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.visitIDDataTextBox.Name = "visitIDDataTextBox";
            this.visitIDDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.6554708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.14593188464641571D));
            this.visitIDDataTextBox.StyleName = "Data";
            this.visitIDDataTextBox.Value = "=Fields.VisitID";
            // 
            // patientIDDataTextBox
            // 
            this.patientIDDataTextBox.CanGrow = true;
            this.patientIDDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(3.8526086807250977D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.patientIDDataTextBox.Name = "patientIDDataTextBox";
            this.patientIDDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.6554708480834961D), Telerik.Reporting.Drawing.Unit.Inch(0.14593188464641571D));
            this.patientIDDataTextBox.StyleName = "Data";
            this.patientIDDataTextBox.Value = "=Fields.PatientID";
            // 
            // doctorFeeDataTextBox
            // 
            this.doctorFeeDataTextBox.CanGrow = true;
            this.doctorFeeDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(5.5289125442504883D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.doctorFeeDataTextBox.Name = "doctorFeeDataTextBox";
            this.doctorFeeDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.75025433301925659D), Telerik.Reporting.Drawing.Unit.Inch(0.14593188464641571D));
            this.doctorFeeDataTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Right;
            this.doctorFeeDataTextBox.StyleName = "Data";
            this.doctorFeeDataTextBox.Value = "=Fields.DoctorFee";
            // 
            // textBox2
            // 
            this.textBox2.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.4791666567325592D), Telerik.Reporting.Drawing.Unit.Inch(0.13315598666667938D));
            this.textBox2.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            this.textBox2.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.textBox2.Value = "= RowNumber()";
            // 
            // shape1
            // 
            this.shape1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.16684405505657196D));
            this.shape1.Name = "shape1";
            this.shape1.ShapeType = new Telerik.Reporting.Drawing.Shapes.LineShape(Telerik.Reporting.Drawing.Shapes.LineDirection.EW);
            this.shape1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(6.3000006675720215D), Telerik.Reporting.Drawing.Unit.Inch(0.0520833320915699D));
            // 
            // DailyVisitByDoctor
            // 
            this.DataSource = this.sqlDataSource1;
            group1.GroupFooter = this.doctorNameGroupFooterSection;
            group1.GroupHeader = this.doctorNameGroupHeaderSection;
            group1.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.DoctorName"));
            group1.Name = "doctorNameGroup";
            group2.GroupFooter = this.labelsGroupFooterSection;
            group2.GroupHeader = this.labelsGroupHeaderSection;
            group2.Name = "labelsGroup";
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            group1,
            group2});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.doctorNameGroupHeaderSection,
            this.doctorNameGroupFooterSection,
            this.labelsGroupHeaderSection,
            this.labelsGroupFooterSection,
            this.pageHeader,
            this.pageFooter,
            this.reportHeader,
            this.reportFooter,
            this.detail});
            this.Name = "DailyVisitByDoctor";
            this.PageSettings.Landscape = false;
            this.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Inch(1D), Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(0.5D));
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            reportParameter1.AvailableValues.DataSource = this.sqlDataSource2;
            reportParameter1.AvailableValues.DisplayMember = "= Fields.DoctorName";
            reportParameter1.AvailableValues.ValueMember = "= Fields.DoctorName";
            reportParameter1.Name = "DoctorName";
            reportParameter1.Text = "Doctor Name:";
            reportParameter1.Visible = true;
            reportParameter2.AvailableValues.DataSource = this.sqlDataSource3;
            reportParameter2.AvailableValues.DisplayMember = "= Fields.EntryDate.Date";
            reportParameter2.AvailableValues.ValueMember = "= Fields.EntryDate.Date";
            reportParameter2.Name = "VisitDate";
            reportParameter2.Text = "Visit Date:";
            reportParameter2.Type = Telerik.Reporting.ReportParameterType.DateTime;
            reportParameter2.Visible = true;
            this.ReportParameters.Add(reportParameter1);
            this.ReportParameters.Add(reportParameter2);
            this.Style.BackgroundColor = System.Drawing.Color.White;
            styleRule1.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Title")});
            styleRule1.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(34)))), ((int)(((byte)(77)))));
            styleRule1.Style.Font.Name = "Calibri";
            styleRule1.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(18D);
            styleRule2.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Caption")});
            styleRule2.Style.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(121)))), ((int)(((byte)(167)))), ((int)(((byte)(227)))));
            styleRule2.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(34)))), ((int)(((byte)(77)))));
            styleRule2.Style.Font.Name = "Calibri";
            styleRule2.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(10D);
            styleRule2.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule3.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Data")});
            styleRule3.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(34)))), ((int)(((byte)(77)))));
            styleRule3.Style.Font.Name = "Calibri";
            styleRule3.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            styleRule3.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule4.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("PageInfo")});
            styleRule4.Style.Color = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(34)))), ((int)(((byte)(77)))));
            styleRule4.Style.Font.Name = "Calibri";
            styleRule4.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            styleRule4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.StyleSheet.AddRange(new Telerik.Reporting.Drawing.StyleRule[] {
            styleRule1,
            styleRule2,
            styleRule3,
            styleRule4});
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(6.7677168846130371D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.SqlDataSource sqlDataSource1;
        private Telerik.Reporting.SqlDataSource sqlDataSource2;
        private Telerik.Reporting.SqlDataSource sqlDataSource3;
        private Telerik.Reporting.GroupHeaderSection doctorNameGroupHeaderSection;
        private Telerik.Reporting.TextBox doctorNameCaptionTextBox;
        private Telerik.Reporting.TextBox doctorNameDataTextBox;
        private Telerik.Reporting.GroupFooterSection doctorNameGroupFooterSection;
        private Telerik.Reporting.GroupHeaderSection labelsGroupHeaderSection;
        private Telerik.Reporting.TextBox entryDateCaptionTextBox;
        private Telerik.Reporting.TextBox visitIDCaptionTextBox;
        private Telerik.Reporting.TextBox patientIDCaptionTextBox;
        private Telerik.Reporting.TextBox doctorFeeCaptionTextBox;
        private Telerik.Reporting.GroupFooterSection labelsGroupFooterSection;
        private Telerik.Reporting.PageHeaderSection pageHeader;
        private Telerik.Reporting.TextBox reportNameTextBox;
        private Telerik.Reporting.PageFooterSection pageFooter;
        private Telerik.Reporting.TextBox currentTimeTextBox;
        private Telerik.Reporting.TextBox pageInfoTextBox;
        private Telerik.Reporting.ReportHeaderSection reportHeader;
        private Telerik.Reporting.TextBox titleTextBox;
        private Telerik.Reporting.ReportFooterSection reportFooter;
        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.TextBox entryDateDataTextBox;
        private Telerik.Reporting.TextBox visitIDDataTextBox;
        private Telerik.Reporting.TextBox patientIDDataTextBox;
        private Telerik.Reporting.TextBox doctorFeeDataTextBox;
        private Telerik.Reporting.TextBox textBox1;
        private Telerik.Reporting.TextBox textBox2;
        private Telerik.Reporting.Shape shape1;
        private Telerik.Reporting.TextBox textBox3;

    }
}