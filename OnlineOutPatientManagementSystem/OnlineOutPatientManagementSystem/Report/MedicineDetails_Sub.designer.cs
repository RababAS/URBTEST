namespace OnlineOutPatientManagementSystem.Report
{
    partial class MedicineDetails_Sub
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MedicineDetails_Sub));
            Telerik.Reporting.Group group1 = new Telerik.Reporting.Group();
            Telerik.Reporting.ReportParameter reportParameter1 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.labelsGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.srNoCaptionTextBox = new Telerik.Reporting.TextBox();
            this.medicineNameCaptionTextBox = new Telerik.Reporting.TextBox();
            this.medQtyCaptionTextBox = new Telerik.Reporting.TextBox();
            this.frequencyCaptionTextBox = new Telerik.Reporting.TextBox();
            this.treatmentCaptionTextBox = new Telerik.Reporting.TextBox();
            this.sqlDataSource1 = new Telerik.Reporting.SqlDataSource();
            this.detail = new Telerik.Reporting.DetailSection();
            this.srNoDataTextBox = new Telerik.Reporting.TextBox();
            this.medicineNameDataTextBox = new Telerik.Reporting.TextBox();
            this.medQtyDataTextBox = new Telerik.Reporting.TextBox();
            this.frequencyDataTextBox = new Telerik.Reporting.TextBox();
            this.treatmentDataTextBox = new Telerik.Reporting.TextBox();
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
            this.labelsGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0.19999997317790985D);
            this.labelsGroupHeaderSection.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.srNoCaptionTextBox,
            this.medicineNameCaptionTextBox,
            this.medQtyCaptionTextBox,
            this.frequencyCaptionTextBox,
            this.treatmentCaptionTextBox});
            this.labelsGroupHeaderSection.Name = "labelsGroupHeaderSection";
            this.labelsGroupHeaderSection.PrintOnEveryPage = true;
            this.labelsGroupHeaderSection.Style.Font.Bold = true;
            // 
            // srNoCaptionTextBox
            // 
            this.srNoCaptionTextBox.CanGrow = true;
            this.srNoCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.srNoCaptionTextBox.Name = "srNoCaptionTextBox";
            this.srNoCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.27916669845581055D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.srNoCaptionTextBox.Style.Font.Name = "Arial";
            this.srNoCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.srNoCaptionTextBox.StyleName = "Caption";
            this.srNoCaptionTextBox.Value = "Sr No";
            // 
            // medicineNameCaptionTextBox
            // 
            this.medicineNameCaptionTextBox.CanGrow = true;
            this.medicineNameCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.30000004172325134D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.medicineNameCaptionTextBox.Name = "medicineNameCaptionTextBox";
            this.medicineNameCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.5D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.medicineNameCaptionTextBox.Style.Font.Name = "Arial";
            this.medicineNameCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.medicineNameCaptionTextBox.StyleName = "Caption";
            this.medicineNameCaptionTextBox.Value = "Medicine Name";
            // 
            // medQtyCaptionTextBox
            // 
            this.medQtyCaptionTextBox.CanGrow = true;
            this.medQtyCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(1.7999999523162842D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.medQtyCaptionTextBox.Name = "medQtyCaptionTextBox";
            this.medQtyCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.30000019073486328D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.medQtyCaptionTextBox.Style.Font.Name = "Arial";
            this.medQtyCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.medQtyCaptionTextBox.StyleName = "Caption";
            this.medQtyCaptionTextBox.Value = "Qty";
            // 
            // frequencyCaptionTextBox
            // 
            this.frequencyCaptionTextBox.CanGrow = true;
            this.frequencyCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.0999999046325684D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.frequencyCaptionTextBox.Name = "frequencyCaptionTextBox";
            this.frequencyCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.50000029802322388D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.frequencyCaptionTextBox.Style.Font.Name = "Arial";
            this.frequencyCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.frequencyCaptionTextBox.StyleName = "Caption";
            this.frequencyCaptionTextBox.Value = "Frequency";
            // 
            // treatmentCaptionTextBox
            // 
            this.treatmentCaptionTextBox.CanGrow = true;
            this.treatmentCaptionTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.6000001430511475D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.treatmentCaptionTextBox.Name = "treatmentCaptionTextBox";
            this.treatmentCaptionTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.80000019073486328D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.treatmentCaptionTextBox.Style.Font.Name = "Arial";
            this.treatmentCaptionTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.treatmentCaptionTextBox.StyleName = "Caption";
            this.treatmentCaptionTextBox.Value = "Treatment";
            // 
            // sqlDataSource1
            // 
            this.sqlDataSource1.ConnectionString = "OnLinePrescriptionConnectionString";
            this.sqlDataSource1.Name = "sqlDataSource1";
            this.sqlDataSource1.SelectCommand = resources.GetString("sqlDataSource1.SelectCommand");
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(0.20216204226016998D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.srNoDataTextBox,
            this.medicineNameDataTextBox,
            this.medQtyDataTextBox,
            this.frequencyDataTextBox,
            this.treatmentDataTextBox,
            this.shape1});
            this.detail.Name = "detail";
            // 
            // srNoDataTextBox
            // 
            this.srNoDataTextBox.CanGrow = true;
            this.srNoDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.srNoDataTextBox.Name = "srNoDataTextBox";
            this.srNoDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.27916669845581055D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.srNoDataTextBox.Style.Font.Name = "Arial";
            this.srNoDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.srNoDataTextBox.Style.TextAlign = Telerik.Reporting.Drawing.HorizontalAlign.Center;
            this.srNoDataTextBox.StyleName = "Data";
            this.srNoDataTextBox.Value = "=Fields.SrNo";
            // 
            // medicineNameDataTextBox
            // 
            this.medicineNameDataTextBox.CanGrow = true;
            this.medicineNameDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.30000004172325134D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.medicineNameDataTextBox.Name = "medicineNameDataTextBox";
            this.medicineNameDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(1.5D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.medicineNameDataTextBox.Style.Font.Name = "Arial";
            this.medicineNameDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.medicineNameDataTextBox.StyleName = "Data";
            this.medicineNameDataTextBox.Value = "=Fields.MedicineName";
            // 
            // medQtyDataTextBox
            // 
            this.medQtyDataTextBox.CanGrow = true;
            this.medQtyDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(1.7999999523162842D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.medQtyDataTextBox.Name = "medQtyDataTextBox";
            this.medQtyDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.30000019073486328D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.medQtyDataTextBox.Style.Font.Name = "Arial";
            this.medQtyDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.medQtyDataTextBox.StyleName = "Data";
            this.medQtyDataTextBox.Value = "=Fields.MedQty";
            // 
            // frequencyDataTextBox
            // 
            this.frequencyDataTextBox.CanGrow = true;
            this.frequencyDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.0999999046325684D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.frequencyDataTextBox.Name = "frequencyDataTextBox";
            this.frequencyDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.50000029802322388D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.frequencyDataTextBox.Style.Font.Name = "Arial";
            this.frequencyDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.frequencyDataTextBox.StyleName = "Data";
            this.frequencyDataTextBox.Value = "=Fields.Frequency";
            // 
            // treatmentDataTextBox
            // 
            this.treatmentDataTextBox.CanGrow = true;
            this.treatmentDataTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(2.6000001430511475D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.treatmentDataTextBox.Name = "treatmentDataTextBox";
            this.treatmentDataTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(0.80000019073486328D), Telerik.Reporting.Drawing.Unit.Inch(0.15000000596046448D));
            this.treatmentDataTextBox.Style.Font.Name = "Arial";
            this.treatmentDataTextBox.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(7D);
            this.treatmentDataTextBox.StyleName = "Data";
            this.treatmentDataTextBox.Value = "=Fields.Treatment";
            // 
            // shape1
            // 
            this.shape1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.15007869899272919D));
            this.shape1.Name = "shape1";
            this.shape1.ShapeType = new Telerik.Reporting.Drawing.Shapes.LineShape(Telerik.Reporting.Drawing.Shapes.LineDirection.EW);
            this.shape1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.4000003337860107D), Telerik.Reporting.Drawing.Unit.Inch(0.0520833320915699D));
            // 
            // MedicineDetails_Sub
            // 
            this.DataSource = this.sqlDataSource1;
            this.Filters.Add(new Telerik.Reporting.Filter("=Fields.VisitID", Telerik.Reporting.FilterOperator.Equal, "=Parameters.LinkPrmVisitID.Value"));
            group1.GroupFooter = this.labelsGroupFooterSection;
            group1.GroupHeader = this.labelsGroupHeaderSection;
            group1.Name = "labelsGroup";
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            group1});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labelsGroupHeaderSection,
            this.labelsGroupFooterSection,
            this.detail});
            this.Name = "MedicineDetails_Sub";
            this.PageSettings.Landscape = false;
            this.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(1D), Telerik.Reporting.Drawing.Unit.Inch(0.5D), Telerik.Reporting.Drawing.Unit.Inch(1D));
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            reportParameter1.AllowNull = true;
            reportParameter1.Name = "LinkPrmVisitID";
            reportParameter1.Text = "Parameter1";
            this.ReportParameters.Add(reportParameter1);
            this.Style.BackgroundColor = System.Drawing.Color.White;
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
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(3.4000003337860107D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.SqlDataSource sqlDataSource1;
        private Telerik.Reporting.GroupHeaderSection labelsGroupHeaderSection;
        private Telerik.Reporting.TextBox srNoCaptionTextBox;
        private Telerik.Reporting.TextBox medicineNameCaptionTextBox;
        private Telerik.Reporting.TextBox medQtyCaptionTextBox;
        private Telerik.Reporting.TextBox frequencyCaptionTextBox;
        private Telerik.Reporting.TextBox treatmentCaptionTextBox;
        private Telerik.Reporting.GroupFooterSection labelsGroupFooterSection;
        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.TextBox srNoDataTextBox;
        private Telerik.Reporting.TextBox medicineNameDataTextBox;
        private Telerik.Reporting.TextBox medQtyDataTextBox;
        private Telerik.Reporting.TextBox frequencyDataTextBox;
        private Telerik.Reporting.TextBox treatmentDataTextBox;
        private Telerik.Reporting.Shape shape1;

    }
}