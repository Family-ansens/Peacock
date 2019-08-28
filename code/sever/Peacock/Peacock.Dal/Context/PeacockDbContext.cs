using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Peacock.Dal
{
    public partial class PeacockDbContext : DbContext
    {
        private const bool IS_MYSQL = false;

        public PeacockDbContext()
        {
        }

        public PeacockDbContext(DbContextOptions<PeacockDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<T_Pro_Product> T_Pro_Product { get; set; }
        public virtual DbSet<T_Pro_ProductGroup> T_Pro_ProductGroup { get; set; }
        public virtual DbSet<T_Pro_ProductImg> T_Pro_ProductImg { get; set; }
        public virtual DbSet<T_Pro_HotSaleProduct> T_Pro_HotSaleProduct { get; set; }
        public virtual DbSet<T_System_LanguageContent> T_System_LanguageContent { get; set; }
        public virtual DbSet<T_System_LanguageRelation> T_System_LanguageRelation { get; set; }
        public virtual DbSet<T_System_Menu> T_System_Menu { get; set; }
        public virtual DbSet<T_New> T_New { get; set; }
        public virtual DbSet<T_Announcement> T_Announcement { get; set; }
        public virtual DbSet<T_Pro_Example> T_Pro_Example { get; set; }
        public virtual DbSet<T_Pro_ExampleGroup> T_Pro_ExampleGroup { get; set; }
        public virtual DbSet<T_Pro_ExampleImg> T_Pro_ExampleImg { get; set; }
        public virtual DbSet<T_Company> T_Company { get; set; }
        public virtual DbSet<T_Evaluation> T_Evaluation { get; set; }


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
            //modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<T_New>(entity =>
            {
                entity.ToTable("T_New");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Title).IsRequired().HasMaxLength(200);

                entity.Property(e => e.Content);

                entity.Property(e => e.TitleLanguageId);

                entity.Property(e => e.ContentLanguageId);

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                    entity.Property(e => e.IsPublish).HasColumnType("bit(1)").HasDefaultValue(false);
                }

                entity.Property(e => e.PublishTime).HasColumnType("datetime");

                

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.LanguageRelationByTitle)
                    .WithMany(p => p.NewsWithTitle)
                    .HasForeignKey(d => d.TitleLanguageId)
                    .HasConstraintName("FK_T_New_T_System_LanguageRelation_Title");

                entity.HasOne(d => d.LanguageRelationByContent)
                    .WithMany(p => p.NewsWithContent)
                    .HasForeignKey(d => d.ContentLanguageId)
                    .HasConstraintName("FK_T_New_T_System_LanguageRelation_Content");
            });

            modelBuilder.Entity<T_Announcement>(entity =>
            {
                entity.ToTable("T_Announcement");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Title).IsRequired().HasMaxLength(200);

                entity.Property(e => e.Content);

                entity.Property(e => e.TitleLanguageId);

                entity.Property(e => e.ContentLanguageId);

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                }

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.LanguageRelationByTitle)
                    .WithMany(p => p.AnnouncementsWithTitle)
                    .HasForeignKey(d => d.TitleLanguageId)
                    .HasConstraintName("FK_T_New_T_Announcement_Title");

                entity.HasOne(d => d.LanguageRelationByContent)
                    .WithMany(p => p.AnnouncementsWithContent)
                    .HasForeignKey(d => d.ContentLanguageId)
                    .HasConstraintName("FK_T_New_T_Announcement_Content");
            });

            modelBuilder.Entity<T_Pro_Product>(entity =>
            {
                entity.ToTable("T_Pro_Product");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Name).IsRequired().HasMaxLength(200);

                entity.Property(e => e.OrderId).IsRequired();

                entity.Property(e => e.Description);

                entity.Property(e => e.NameLanguageId);

                entity.Property(e => e.IntroductionLanguageId);

                entity.Property(e => e.DescriptionLanguageId);

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                }

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.LanguageRelationByName)
                    .WithMany(p => p.ProductsWithName)
                    .HasForeignKey(d => d.NameLanguageId)
                    .HasConstraintName("FK_T_Pro_Product_T_System_LanguageRelation_Name");

                entity.HasOne(d => d.LanguageRelationByIntroduction)
                    .WithMany(p => p.ProductsWithIntroduction)
                    .HasForeignKey(d => d.IntroductionLanguageId)
                    .HasConstraintName("FK_T_Pro_Product_T_System_LanguageRelation_Introduction");

                entity.HasOne(d => d.LanguageRelationByDescription)
                    .WithMany(p => p.ProductsWithDescription)
                    .HasForeignKey(d => d.DescriptionLanguageId)
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

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                }

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

            modelBuilder.Entity<T_Pro_ProductImg>(entity =>
            {
                entity.ToTable("T_Pro_ProductImg");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductImgs)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_T_Pro_ProductImg_T_Pro_Product");
            });

            modelBuilder.Entity<T_Pro_HotSaleProduct>(entity =>
            {
                entity.ToTable("T_Pro_HotSaleProduct");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.HotSaleProducts)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_T_Pro_HotSaleProduct_T_Pro_Product");
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

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                }

                entity.HasOne(d => d.LanguageRelation)
                    .WithMany(p => p.TSystemMenu)
                    .HasForeignKey(d => d.LanguageRelationId)
                    .HasConstraintName("FK_T_System_Menu_T_System_LanguageRelation");
            });

            modelBuilder.Entity<T_Pro_Example>(entity =>
            {
                entity.ToTable("T_Pro_Example");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Name).IsRequired().HasMaxLength(200);

                entity.Property(e => e.OrderId).IsRequired();

                entity.Property(e => e.Description);

                entity.Property(e => e.NameLanguageId);

                entity.Property(e => e.DescriptionLanguageId);

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                }

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.LanguageRelationByName)
                    .WithMany(p => p.ExamplesWithName)
                    .HasForeignKey(d => d.NameLanguageId)
                    .HasConstraintName("FK_T_Pro_Example_T_System_LanguageRelation_Name");

                entity.HasOne(d => d.LanguageRelationByDescription)
                    .WithMany(p => p.ExamplesWithDescription)
                    .HasForeignKey(d => d.DescriptionLanguageId)
                    .HasConstraintName("FK_T_Pro_Example_T_System_LanguageRelation_Description");

                entity.HasOne(d => d.ExampleGourp)
                    .WithMany(p => p.Examples)
                    .HasForeignKey(d => d.GroupId)
                    .HasConstraintName("FK_T_Pro_Example_T_Pro_ExampleGroup");
            });

            modelBuilder.Entity<T_Pro_ExampleGroup>(entity =>
            {
                entity.ToTable("T_Pro_ExampleGroup");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50);

                if (IS_MYSQL)
                {
                    entity.Property(e => e.IsDeleted).HasColumnType("bit(1)").HasDefaultValue(false);
                }

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
                    .WithMany(p => p.ExampleGroups)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_T_Pro_ExampleGroup_T_System_LanguageRelation");
            });

            modelBuilder.Entity<T_Pro_ExampleImg>(entity =>
            {
                entity.ToTable("T_Pro_ExampleImg");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.Example)
                    .WithMany(p => p.ExampleImgs)
                    .HasForeignKey(d => d.ExampleId)
                    .HasConstraintName("FK_T_Pro_ExampleImg_T_Pro_Example");
            });

            modelBuilder.Entity<T_Company>(entity =>
            {
                entity.ToTable("T_Company");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.OrderId);

                entity.Property(e => e.IntroductionLanguageId);

                entity.Property(e => e.Content);

                entity.Property(e => e.ContentLanguageId);

                entity.Property(e => e.ImgPath).IsRequired().HasMaxLength(2000);

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");

                entity.HasOne(d => d.LanguageRelationByIntroduction)
                    .WithMany(p => p.CompaniesWithIntroduction)
                    .HasForeignKey(d => d.IntroductionLanguageId)
                    .HasConstraintName("FK_T_Company_T_System_LanguageRelation_Introduction");

                entity.HasOne(d => d.LanguageRelationByContent)
                    .WithMany(p => p.CompaniesWithContent)
                    .HasForeignKey(d => d.ContentLanguageId)
                    .HasConstraintName("FK_T_Company_T_System_LanguageRelation_Content");
            });

            modelBuilder.Entity<T_Evaluation>(entity =>
            {
                entity.ToTable("T_Evaluation");

                entity.Property(e => e.ID).HasColumnName("ID");

                entity.Property(e => e.Name).IsRequired().HasMaxLength(10);

                entity.Property(e => e.Tel).IsRequired().HasMaxLength(20);

                entity.Property(e => e.Content).IsRequired().HasMaxLength(1000);

                entity.Property(e => e.Email).IsRequired().HasMaxLength(100);

                entity.Property(e => e.OtherContact).IsRequired().HasMaxLength(100);

                entity.Property(e => e.IpAddress).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.CreatedTime).HasColumnType("datetime");

                entity.Property(e => e.LastUpdatedBy).IsRequired().HasMaxLength(50);

                entity.Property(e => e.LastUpdatedTime).HasColumnType("datetime");
            });
        }
    }
}
