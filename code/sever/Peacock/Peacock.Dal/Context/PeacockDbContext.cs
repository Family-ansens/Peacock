using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Peacock.Dal
{
    public partial class PeacockDbContext : DbContext
    {
        public PeacockDbContext()
        {
        }

        public PeacockDbContext(DbContextOptions<PeacockDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<T_Pro_Product> T_Pro_Product { get; set; }
        public virtual DbSet<T_Pro_ProductGroup> T_Pro_ProductGroup { get; set; }
        public virtual DbSet<T_System_LanguageContent> T_System_LanguageContent { get; set; }
        public virtual DbSet<T_System_LanguageRelation> T_System_LanguageRelation { get; set; }
        public virtual DbSet<T_System_Menu> T_System_Menu { get; set; }

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                //optionsBuilder.UseSqlServer("Data Source=10.10.14.178;Initial Catalog=antmgr;User Id=sa;Password=sa@123456;");
//                optionsBuilder.UseMySQL("server=192.168.184.137;user id=dotnet_user;password=sa12345;persistsecurityinfo=True;port=3306;database=PeacockManage;SslMode=None;charset='utf8';TreatTinyAsBoolean=true");
//            }
//        }




        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<T_Pro_Product>(entity =>
            {
                entity.ToTable("T_Pro_Product");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Name).IsRequired().HasMaxLength(200);

                entity.Property(e => e.OrderId).IsRequired();

                entity.Property(e => e.Description);

                entity.Property(e => e.NameLanguageId);

                entity.Property(e => e.DescriptionLanguageId);

                entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.LanguageRelationByName)
                    .WithMany(p => p.ProductsWithName)
                    .HasForeignKey(d => d.NameLanguageId)
                    .HasConstraintName("FK_T_Pro_Product_T_System_LanguageRelation_Name");

                entity.HasOne(d => d.LanguageRelationByDescription)
                    .WithMany(p => p.ProductsWithDescription)
                    .HasForeignKey(d => d.NameLanguageId)
                    .HasConstraintName("FK_T_Pro_Product_T_System_LanguageRelation_Description");

                entity.HasOne(d => d.ProductGourp)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.GroupId)
                    .HasConstraintName("FK_T_Pro_Product_T_Pro_ProductGroup");
            });

            modelBuilder.Entity<T_Pro_ProductGroup>(entity =>
            {
                entity.ToTable("T_Pro_ProductGroup");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.IsDeleted)
                    .HasColumnType("bit(1)")
                    .HasDefaultValue(false);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.LanguageRelationByName)
                    .WithMany(p => p.T_Pro_ProductGroups)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_T_Pro_ProductGroup_T_System_LanguageRelation");
            });

            modelBuilder.Entity<T_System_LanguageContent>(entity =>
            {
                entity.ToTable("T_System_LanguageContent");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.DisplayContent)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.LanguageType)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.Relation)
                    .WithMany(p => p.TSystemLanguageContent)
                    .HasForeignKey(d => d.RelationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_T_System_LanguageContent_T_System_LanguageRelation");
            });

            modelBuilder.Entity<T_System_LanguageRelation>(entity =>
            {
                entity.ToTable("T_System_LanguageRelation");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<T_System_Menu>(entity =>
            {
                entity.ToTable("T_System_Menu");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Url)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                // Mysql定义布尔类型
                entity.Property(e => e.IsDeleted)
                    .HasColumnType("bit(1)")
                    .HasDefaultValue(false);

                entity.HasOne(d => d.LanguageRelation)
                    .WithMany(p => p.TSystemMenu)
                    .HasForeignKey(d => d.LanguageRelationId)
                    .HasConstraintName("FK_T_System_Menu_T_System_LanguageRelation");
            });            
        }
    }
}
