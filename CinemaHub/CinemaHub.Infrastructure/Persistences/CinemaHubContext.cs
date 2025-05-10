using CinemaHub.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences
{
    public partial class CinemaHubContext : IdentityDbContext<Account>
    {
        public CinemaHubContext()
        {
        }

        public CinemaHubContext(DbContextOptions<CinemaHubContext> options)
            : base(options)
        {

        }

        public virtual DbSet<Account> Accounts { get; set; }

        public virtual DbSet<Comment> Comments { get; set; }

        public virtual DbSet<Log> Logs { get; set; }

        public virtual DbSet<Movie> Movies { get; set; }

        public virtual DbSet<MovieGenre> MovieGenres { get; set; }

        public virtual DbSet<Notification> Notifications { get; set; }

        public virtual DbSet<Payment> Payments { get; set; }

        public virtual DbSet<Rating> Ratings { get; set; }

        public virtual DbSet<SubscriptionPlan> SubscriptionPlans { get; set; }

        public virtual DbSet<UserFavorite> UserFavorites { get; set; }

        public virtual DbSet<UserRefreshToken> UserRefreshTokens { get; set; }

        public virtual DbSet<WatchHistory> WatchHistories { get; set; }

        private string GetConnectionString()
        {
            IConfiguration config = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", true, true)
            .Build();
            var strConn = config["ConnectionStrings:DefaultConnectionStringDB"];
            return strConn;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
            => optionsBuilder.UseSqlServer(GetConnectionString());

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Optional: Cấu hình tùy chỉnh thêm cho Identity nếu cần
            // Ví dụ về cấu hình khóa chính nếu cần
            // Set Khoa cho IdentityUser (Khong co se ko cai dc)
            // Can cau hinh UserID va RoleID la kieu nvarchar(450) trong IdentityUserRole va IdentityUserLogin
            // Hàm base.OnModelCreating() trong IdentityDbContext là bắt buộc để cấu hình các bảng mặc định của Identity Framework. Nếu bạn không gọi nó, các bảng này sẽ không được cấu hình đúng.
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<IdentityUserLogin<string>>(entity =>
            {
                entity.Property(e => e.LoginProvider).HasMaxLength(450);
                entity.Property(e => e.ProviderKey).HasMaxLength(450);
            });

            modelBuilder.Entity<IdentityUserRole<string>>(entity =>
            {
                entity.Property(e => e.UserId).HasMaxLength(450);
                entity.Property(e => e.RoleId).HasMaxLength(450);
            });
            modelBuilder.Entity<IdentityUserLogin<string>>().HasKey(iul => new { iul.LoginProvider, iul.ProviderKey });
            modelBuilder.Entity<IdentityUserRole<string>>().HasKey(iur => new { iur.UserId, iur.RoleId });
            modelBuilder.Entity<IdentityUserToken<string>>().HasKey(iut => new { iut.UserId, iut.LoginProvider, iut.Name });

            //modelBuilder.Entity<Account>(entity =>
            //{
            //    entity.HasKey(e => e.UserId).HasName("PK__Accounts__1788CCAC595CD4C1");

            //    entity.HasIndex(e => e.Email, "UQ__Accounts__A9D10534B969CFA0").IsUnique();

            //    entity.Property(e => e.UserId).HasColumnName("UserID");
            //    entity.Property(e => e.CreatedAt)
            //        .HasDefaultValueSql("(getdate())")
            //        .HasColumnType("datetime");
            //    entity.Property(e => e.Email).HasMaxLength(100);
            //    entity.Property(e => e.FullName).HasMaxLength(100);
            //    entity.Property(e => e.PasswordHash).HasMaxLength(256);
            //    entity.Property(e => e.Permissions).HasMaxLength(255);
            //    entity.Property(e => e.ProfilePicture).HasMaxLength(255);
            //    entity.Property(e => e.Role).HasMaxLength(50);
            //});

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.HasKey(e => e.CommentId).HasName("PK__Comments__C3B4DFAAAB9D27CA");

                entity.Property(e => e.CommentId).HasColumnName("CommentID");
                entity.Property(e => e.Content).HasMaxLength(1000);
                entity.Property(e => e.CreatedAt)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");
                entity.Property(e => e.Status).HasDefaultValue(false);
                entity.Property(e => e.MovieId).HasColumnName("MovieID");
                entity.Property(e => e.UserId).HasColumnName("UserID");
                entity.HasOne(d => d.Movie).WithMany(p => p.Comments)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comments_MovieID");

                entity.HasOne(d => d.User).WithMany(p => p.Comments)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comments_UserID");
            });

            modelBuilder.Entity<Log>(entity =>
            {
                entity.HasKey(e => e.LogId).HasName("PK__Logs__5E5499A84C461684");

                entity.Property(e => e.LogId).HasColumnName("LogID");
                entity.Property(e => e.Action).HasMaxLength(255);
                entity.Property(e => e.Timestamp)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");
                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.User).WithMany(p => p.Logs)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Logs_UserID");
            });

            modelBuilder.Entity<Movie>(entity =>
            {
                entity.HasKey(e => e.MovieId).HasName("PK__Movies__4BD2943AF6A04ED5");

                entity.Property(e => e.MovieId).HasColumnName("MovieID");
                entity.Property(e => e.Language).HasMaxLength(50);
                entity.Property(e => e.Thumbnail).HasMaxLength(255);
                entity.Property(e => e.Director).HasMaxLength(255);
                entity.Property(e => e.Title).HasMaxLength(255);
                entity.Property(e => e.TrailerUrl)
                    .HasMaxLength(255)
                    .HasColumnName("TrailerURL");
                entity.Property(e => e.VideoUrl)
                    .HasMaxLength(255)
                    .HasColumnName("VideoURL");
                entity.Property(e => e.Status);

                entity.HasOne(d => d.UploadedByNavigation).WithMany(p => p.Movies)
                    .HasForeignKey(d => d.UploadedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Movies_UploadedBy");

                entity.HasMany(d => d.Genres).WithMany(p => p.Movies)
                    .UsingEntity<Dictionary<string, object>>(
                        "MovieGenreMapping",
                        r => r.HasOne<MovieGenre>().WithMany()
                            .HasForeignKey("GenreId")
                            .OnDelete(DeleteBehavior.Cascade)
                            .HasConstraintName("FK_MovieGenreMapping_GenreID"),
                        l => l.HasOne<Movie>().WithMany()
                            .HasForeignKey("MovieId")
                            .OnDelete(DeleteBehavior.Cascade) //DeleteBehavior.Cascade: Xóa bản ghi cha thì xóa luôn các bản ghi con
                            .HasConstraintName("FK_MovieGenreMapping_MovieID"),
                        j =>
                        {
                            j.HasKey("MovieId", "GenreId").HasName("PK__MovieGen__BBEAC46F16BE84B9");
                            j.ToTable("MovieGenreMapping");
                            j.IndexerProperty<int>("MovieId").HasColumnName("MovieID");
                            j.IndexerProperty<int>("GenreId").HasColumnName("GenreID");
                        });
            });

            modelBuilder.Entity<MovieGenre>(entity =>
            {
                entity.HasKey(e => e.GenreId).HasName("PK__MovieGen__0385055E5CB3ED1D");

                entity.Property(e => e.GenreId).HasColumnName("GenreID");
                entity.Property(e => e.GenreName).HasMaxLength(50);
            });

            modelBuilder.Entity<Notification>(entity =>
            {
                entity.HasKey(e => e.NotificationId).HasName("PK__Notifica__20CF2E32ECE77725");

                entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
                entity.Property(e => e.CreatedAt)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");
                entity.Property(e => e.Title).HasMaxLength(255);
                entity.Property(e => e.Content).HasMaxLength(450);
                entity.Property(e => e.ContentDetail).HasMaxLength(450);
                entity.Property(e => e.ReceiverId);
                entity.Property(e => e.Status).HasDefaultValue(false);
            });

            modelBuilder.Entity<Payment>(entity =>
            {
                entity.HasKey(e => e.PaymentId).HasName("PK__Payments__9B556A5808982283");

                entity.HasIndex(e => e.PaymentCode, "UQ__Payments__106D3BA810D12558").IsUnique();

                entity.Property(e => e.PaymentId).HasColumnName("PaymentID");
                entity.Property(e => e.Amount).HasColumnType("decimal(10, 2)");
                entity.Property(e => e.ExpiryDate).HasColumnType("datetime");
                entity.Property(e => e.PaymentCode).HasMaxLength(255);
                entity.Property(e => e.PaymentDate)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");
                entity.Property(e => e.PaymentMethod).HasMaxLength(50);
                entity.Property(e => e.PaymentStatus).HasMaxLength(50);
                entity.Property(e => e.SubscriptionPlanId).HasColumnName("SubscriptionPlanID");
                entity.Property(e => e.UserId)
                    .HasMaxLength(450)
                    .HasColumnName("UserID");

                entity.HasOne(d => d.SubscriptionPlan).WithMany(p => p.Payments)
                    .HasForeignKey(d => d.SubscriptionPlanId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Payments_SubscriptionPlanID");

                entity.HasOne(d => d.User).WithMany(p => p.Payments)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Payments_UserID");
            });

            modelBuilder.Entity<SubscriptionPlan>(entity =>
            {
                entity.HasKey(e => e.PlanId).HasName("PK__Subscrip__755C22D789D64755");

                entity.Property(e => e.PlanId).HasColumnName("PlanID");
                entity.Property(e => e.CreatedAt)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");
                entity.Property(e => e.IsActive);
                entity.Property(e => e.PlanName).HasMaxLength(255);
                entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");
            });

            modelBuilder.Entity<Rating>(entity =>
            {
                entity.HasKey(e => e.RatingId).HasName("PK__Ratings__FCCDF85C80D7F09B");

                entity.Property(e => e.RatingId).HasColumnName("RatingID");
                entity.Property(e => e.MovieId).HasColumnName("MovieID");
                entity.Property(e => e.Rating1).HasColumnName("Rating");
                entity.Property(e => e.UserId).HasColumnName("UserID");
                entity.Property(e => e.CreatedAt)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");
                entity.Property(e => e.Status).HasDefaultValue(false);
                entity.HasOne(d => d.Movie).WithMany(p => p.Ratings)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Ratings_MovieID");

                entity.HasOne(d => d.User).WithMany(p => p.Ratings)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Ratings_UserID");
            });

            modelBuilder.Entity<UserFavorite>(entity =>
            {
                entity.HasKey(e => e.FavoriteId).HasName("PK__UserFavo__CE74FAF53B3A6860");

                entity.Property(e => e.FavoriteId).HasColumnName("FavoriteID");
                entity.Property(e => e.MovieId).HasColumnName("MovieID");
                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Movie).WithMany(p => p.UserFavorites)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserFavorites_MovieID");

                entity.HasOne(d => d.User).WithMany(p => p.UserFavorites)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserFavorites_UserID");
            });

            modelBuilder.Entity<WatchHistory>(entity =>
            {
                entity.HasKey(e => e.HistoryId).HasName("PK__WatchHis__4D7B4ADDB0BD44E8");

                entity.ToTable("WatchHistory");

                entity.Property(e => e.HistoryId).HasColumnName("HistoryID");
                entity.Property(e => e.MovieId).HasColumnName("MovieID");
                entity.Property(e => e.UserId).HasColumnName("UserID");
                entity.Property(e => e.WatchedAt)
                    .HasDefaultValueSql("(getdate())")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Movie).WithMany(p => p.WatchHistories)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WatchHistory_MovieID");

                entity.HasOne(d => d.User).WithMany(p => p.WatchHistories)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WatchHistory_UserID");
            });

            modelBuilder.Entity<UserRefreshToken>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("PK_UserRefreshToken");

                entity.ToTable("UserRefreshToken");

                entity.Property(e => e.Id).HasColumnName("Id");
                entity.Property(e => e.Token)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ExpiresAt)
                    .HasColumnType("datetime");

                entity.Property(e => e.Revoked)
                    .HasColumnType("bit")
                    .HasDefaultValue(false);

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasColumnName("UserId");

                entity.HasIndex(e => e.Token)
                    .IsUnique()
                    .HasDatabaseName("IX_UserRefreshToken_Token");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.RefreshTokens)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_UserRefreshToken_UserId");
            });



            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
