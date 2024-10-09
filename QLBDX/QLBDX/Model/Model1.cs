using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace QLBDX.Model
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<parking_logs> parking_logs { get; set; }
        public virtual DbSet<parking_spots> parking_spots { get; set; }
        public virtual DbSet<vehicle> vehicles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<parking_spots>()
                .Property(e => e.spot_number)
                .IsUnicode(false);

            modelBuilder.Entity<vehicle>()
                .Property(e => e.license_plate)
                .IsUnicode(false);

            modelBuilder.Entity<vehicle>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<vehicle>()
                .HasMany(e => e.parking_logs)
                .WithRequired(e => e.vehicle)
                .HasForeignKey(e => e.vehicle_id)
                .WillCascadeOnDelete(false);
        }
    }
}
