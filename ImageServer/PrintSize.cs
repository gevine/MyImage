//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ImageServer
{
    using System;
    using System.Collections.Generic;
    
    public partial class PrintSize
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PrintSize()
        {
            this.Images = new HashSet<Image>();
            this.PricePrintSizes = new HashSet<PricePrintSize>();
        }
    
        public string PrintSizeID { get; set; }
        public string PrintSizeName { get; set; }
        public string PrintSizeDemension { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Image> Images { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PricePrintSize> PricePrintSizes { get; set; }
    }
}
