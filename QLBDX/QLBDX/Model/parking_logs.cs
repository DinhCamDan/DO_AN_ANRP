namespace QLBDX.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class parking_logs
    {
        public int id { get; set; }

        public int vehicle_id { get; set; }

        public DateTime entry_time { get; set; }

        public DateTime? exit_time { get; set; }

        public virtual vehicle vehicle { get; set; }
    }
}
