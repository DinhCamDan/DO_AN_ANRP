namespace QLBDX.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class parking_spots
    {
        public int id { get; set; }

        [Required]
        [StringLength(10)]
        public string spot_number { get; set; }

        public bool? is_occupied { get; set; }

        public bool? light_status { get; set; }

        public DateTime? last_update { get; set; }
    }
}
