using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Migrations
{
    //[DbContext(typeof(CinemaHubContext))]
    partial class CinemaHubContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Account", b =>
            {
                b.Property<string>("Id")
                    .HasColumnType("nvarchar(450)");

                b.Property<int>("AccessFailedCount")
                    .HasColumnType("int");

                b.Property<decimal?>("Balance")
                    .HasColumnType("decimal(18,2)");

                b.Property<string>("ConcurrencyStamp")
                    .IsConcurrencyToken()
                    .HasColumnType("nvarchar(max)");

                b.Property<DateTime?>("CreatedAt")
                    .HasColumnType("datetime2");

                b.Property<string>("Email")
                    .HasMaxLength(256)
                    .HasColumnType("nvarchar(256)");

                b.Property<bool>("EmailConfirmed")
                    .HasColumnType("bit");

                b.Property<string>("FullName")
                    .IsRequired()
                    .HasColumnType("nvarchar(max)");

                b.Property<bool>("LockoutEnabled")
                    .HasColumnType("bit");

                b.Property<DateTimeOffset?>("LockoutEnd")
                    .HasColumnType("datetimeoffset");

                b.Property<string>("NormalizedEmail")
                    .HasMaxLength(256)
                    .HasColumnType("nvarchar(256)");

                b.Property<string>("NormalizedUserName")
                    .HasMaxLength(256)
                    .HasColumnType("nvarchar(256)");

                b.Property<string>("OtpCode")
                    .HasColumnType("nvarchar(max)");

                b.Property<DateTime?>("OtpExpiration")
                    .HasColumnType("datetime2");

                b.Property<string>("PasswordHash")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("PhoneNumber")
                    .HasColumnType("nvarchar(max)");

                b.Property<bool>("PhoneNumberConfirmed")
                    .HasColumnType("bit");

                b.Property<string>("ProfilePicture")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("SecurityStamp")
                    .HasColumnType("nvarchar(max)");

                b.Property<bool?>("Status")
                    .HasColumnType("bit");

                b.Property<bool>("TwoFactorEnabled")
                    .HasColumnType("bit");

                b.Property<string>("UserName")
                    .HasMaxLength(256)
                    .HasColumnType("nvarchar(256)");

                b.HasKey("Id");

                b.HasIndex("NormalizedEmail")
                    .HasDatabaseName("EmailIndex");

                b.HasIndex("NormalizedUserName")
                    .IsUnique()
                    .HasDatabaseName("UserNameIndex")
                    .HasFilter("[NormalizedUserName] IS NOT NULL");

                b.ToTable("AspNetUsers", (string)null);
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Comment", b =>
            {
                b.Property<int>("CommentId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("CommentID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CommentId"));

                b.Property<string>("Content")
                    .IsRequired()
                    .HasMaxLength(1000)
                    .HasColumnType("nvarchar(1000)");

                b.Property<DateTime?>("CreatedAt")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                b.Property<int>("MovieId")
                    .HasColumnType("int")
                    .HasColumnName("MovieID");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)")
                    .HasColumnName("UserID");

                b.HasKey("CommentId")
                    .HasName("PK__Comments__C3B4DFAAAB9D27CA");

                b.HasIndex("MovieId");

                b.HasIndex("UserId");

                b.ToTable("Comments");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Log", b =>
            {
                b.Property<int>("LogId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("LogID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("LogId"));

                b.Property<string>("Action")
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)");

                b.Property<DateTime?>("Timestamp")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                b.Property<string>("UserId")
                    .HasColumnType("nvarchar(450)")
                    .HasColumnName("UserID");

                b.HasKey("LogId")
                    .HasName("PK__Logs__5E5499A84C461684");

                b.HasIndex("UserId");

                b.ToTable("Logs");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Movie", b =>
            {
                b.Property<int>("MovieId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("MovieID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("MovieId"));

                b.Property<string>("Description")
                    .HasColumnType("nvarchar(max)");

                b.Property<int>("Duration")
                    .HasColumnType("int");

                b.Property<string>("Language")
                    .HasMaxLength(50)
                    .HasColumnType("nvarchar(50)");

                b.Property<DateOnly?>("ReleaseDate")
                    .HasColumnType("date");

                b.Property<string>("Thumbnail")
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)");

                b.Property<string>("Title")
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)");

                b.Property<string>("TrailerUrl")
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)")
                    .HasColumnName("TrailerURL");

                b.Property<string>("UploadedBy")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("VideoUrl")
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)")
                    .HasColumnName("VideoURL");

                b.HasKey("MovieId")
                    .HasName("PK__Movies__4BD2943AF6A04ED5");

                b.HasIndex("UploadedBy");

                b.ToTable("Movies");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.MovieGenre", b =>
            {
                b.Property<int>("GenreId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("GenreID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("GenreId"));

                b.Property<string>("GenreName")
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnType("nvarchar(50)");

                b.HasKey("GenreId")
                    .HasName("PK__MovieGen__0385055E5CB3ED1D");

                b.ToTable("MovieGenres");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Notification", b =>
            {
                b.Property<int>("NotificationId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("NotificationID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("NotificationId"));

                b.Property<string>("Content")
                    .IsRequired()
                    .HasColumnType("nvarchar(max)");

                b.Property<DateTime?>("CreatedAt")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                b.Property<string>("Title")
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)");

                b.HasKey("NotificationId")
                    .HasName("PK__Notifica__20CF2E32ECE77725");

                b.HasIndex("UserId");

                b.ToTable("Notifications");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Payment", b =>
            {
                b.Property<int>("PaymentId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("PaymentID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PaymentId"));

                b.Property<decimal>("Amount")
                    .HasColumnType("decimal(10, 2)");

                b.Property<DateTime>("ExpiryDate")
                    .HasColumnType("datetime");

                b.Property<string>("PaymentCode")
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)");

                b.Property<DateTime?>("PaymentDate")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                b.Property<string>("PaymentMethod")
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnType("nvarchar(50)");

                b.Property<string>("PaymentStatus")
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnType("nvarchar(50)");

                b.Property<int>("SubscriptionPlanId")
                    .HasColumnType("int")
                    .HasColumnName("SubscriptionPlanID");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasMaxLength(450)
                    .HasColumnType("nvarchar(450)")
                    .HasColumnName("UserID");

                b.HasKey("PaymentId")
                    .HasName("PK__Payments__9B556A5808982283");

                b.HasIndex("SubscriptionPlanId");

                b.HasIndex("UserId");

                b.HasIndex(new[] { "PaymentCode" }, "UQ__Payments__106D3BA810D12558")
                    .IsUnique();

                b.ToTable("Payments");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Rating", b =>
            {
                b.Property<int>("RatingId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("RatingID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("RatingId"));

                b.Property<int>("MovieId")
                    .HasColumnType("int")
                    .HasColumnName("MovieID");

                b.Property<double>("Rating1")
                    .HasColumnType("float")
                    .HasColumnName("Rating");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)")
                    .HasColumnName("UserID");

                b.HasKey("RatingId")
                    .HasName("PK__Ratings__FCCDF85C80D7F09B");

                b.HasIndex("MovieId");

                b.HasIndex("UserId");

                b.ToTable("Ratings");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.SubscriptionPlan", b =>
            {
                b.Property<int>("PlanId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("PlanID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PlanId"));

                b.Property<DateTime?>("CreatedAt")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                b.Property<string>("Description")
                    .HasColumnType("nvarchar(max)");

                b.Property<int>("Duration")
                    .HasColumnType("int");

                b.Property<bool?>("IsActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.Property<string>("PlanName")
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnType("nvarchar(255)");

                b.Property<decimal>("Price")
                    .HasColumnType("decimal(10, 2)");

                b.HasKey("PlanId")
                    .HasName("PK__Subscrip__755C22D789D64755");

                b.ToTable("SubscriptionPlans");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.UserFavorite", b =>
            {
                b.Property<int>("FavoriteId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("FavoriteID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("FavoriteId"));

                b.Property<int>("MovieId")
                    .HasColumnType("int")
                    .HasColumnName("MovieID");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)")
                    .HasColumnName("UserID");

                b.HasKey("FavoriteId")
                    .HasName("PK__UserFavo__CE74FAF53B3A6860");

                b.HasIndex("MovieId");

                b.HasIndex("UserId");

                b.ToTable("UserFavorites");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.WatchHistory", b =>
            {
                b.Property<int>("HistoryId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasColumnName("HistoryID");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("HistoryId"));

                b.Property<int>("MovieId")
                    .HasColumnType("int")
                    .HasColumnName("MovieID");

                b.Property<int>("Progress")
                    .HasColumnType("int");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)")
                    .HasColumnName("UserID");

                b.Property<DateTime?>("WatchedAt")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                b.HasKey("HistoryId")
                    .HasName("PK__WatchHis__4D7B4ADDB0BD44E8");

                b.HasIndex("MovieId");

                b.HasIndex("UserId");

                b.ToTable("WatchHistory", (string)null);
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
            {
                b.Property<string>("Id")
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("ConcurrencyStamp")
                    .IsConcurrencyToken()
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("Name")
                    .HasMaxLength(256)
                    .HasColumnType("nvarchar(256)");

                b.Property<string>("NormalizedName")
                    .HasMaxLength(256)
                    .HasColumnType("nvarchar(256)");

                b.HasKey("Id");

                b.HasIndex("NormalizedName")
                    .IsUnique()
                    .HasDatabaseName("RoleNameIndex")
                    .HasFilter("[NormalizedName] IS NOT NULL");

                b.ToTable("AspNetRoles", (string)null);
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
            {
                b.Property<int>("Id")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                b.Property<string>("ClaimType")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("ClaimValue")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("RoleId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)");

                b.HasKey("Id");

                b.HasIndex("RoleId");

                b.ToTable("AspNetRoleClaims", (string)null);
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
            {
                b.Property<int>("Id")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int");

                SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                b.Property<string>("ClaimType")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("ClaimValue")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)");

                b.HasKey("Id");

                b.HasIndex("UserId");

                b.ToTable("AspNetUserClaims", (string)null);
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
            {
                b.Property<string>("LoginProvider")
                    .HasMaxLength(450)
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("ProviderKey")
                    .HasMaxLength(450)
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("ProviderDisplayName")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("UserId")
                    .IsRequired()
                    .HasColumnType("nvarchar(450)");

                b.HasKey("LoginProvider", "ProviderKey");

                b.HasIndex("UserId");

                b.ToTable("AspNetUserLogins", (string)null);
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
            {
                b.Property<string>("UserId")
                    .HasMaxLength(450)
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("RoleId")
                    .HasMaxLength(450)
                    .HasColumnType("nvarchar(450)");

                b.HasKey("UserId", "RoleId");

                b.HasIndex("RoleId");

                b.ToTable("AspNetUserRoles", (string)null);
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
            {
                b.Property<string>("UserId")
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("LoginProvider")
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("Name")
                    .HasColumnType("nvarchar(450)");

                b.Property<string>("Value")
                    .HasColumnType("nvarchar(max)");

                b.HasKey("UserId", "LoginProvider", "Name");

                b.ToTable("AspNetUserTokens", (string)null);
            });

            modelBuilder.Entity("MovieGenreMapping", b =>
            {
                b.Property<int>("MovieId")
                    .HasColumnType("int")
                    .HasColumnName("MovieID");

                b.Property<int>("GenreId")
                    .HasColumnType("int")
                    .HasColumnName("GenreID");

                b.HasKey("MovieId", "GenreId")
                    .HasName("PK__MovieGen__BBEAC46F16BE84B9");

                b.HasIndex("GenreId");

                b.ToTable("MovieGenreMapping", (string)null);
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Comment", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Movie", "Movie")
                    .WithMany("Comments")
                    .HasForeignKey("MovieId")
                    .IsRequired()
                    .HasConstraintName("FK_Comments_MovieID");

                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany("Comments")
                    .HasForeignKey("UserId")
                    .IsRequired()
                    .HasConstraintName("FK_Comments_UserID");

                b.Navigation("Movie");

                b.Navigation("User");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Log", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany("Logs")
                    .HasForeignKey("UserId")
                    .HasConstraintName("FK_Logs_UserID");

                b.Navigation("User");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Movie", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "UploadedByNavigation")
                    .WithMany("Movies")
                    .HasForeignKey("UploadedBy")
                    .IsRequired()
                    .HasConstraintName("FK_Movies_UploadedBy");

                b.Navigation("UploadedByNavigation");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Notification", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany()
                    .HasForeignKey("UserId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();

                b.Navigation("User");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Payment", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.SubscriptionPlan", "SubscriptionPlan")
                    .WithMany("Payments")
                    .HasForeignKey("SubscriptionPlanId")
                    .IsRequired()
                    .HasConstraintName("FK_Payments_SubscriptionPlanID");

                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany("Payments")
                    .HasForeignKey("UserId")
                    .IsRequired()
                    .HasConstraintName("FK_Payments_UserID");

                b.Navigation("SubscriptionPlan");

                b.Navigation("User");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Rating", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Movie", "Movie")
                    .WithMany("Ratings")
                    .HasForeignKey("MovieId")
                    .IsRequired()
                    .HasConstraintName("FK_Ratings_MovieID");

                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany("Ratings")
                    .HasForeignKey("UserId")
                    .IsRequired()
                    .HasConstraintName("FK_Ratings_UserID");

                b.Navigation("Movie");

                b.Navigation("User");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.UserFavorite", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Movie", "Movie")
                    .WithMany("UserFavorites")
                    .HasForeignKey("MovieId")
                    .IsRequired()
                    .HasConstraintName("FK_UserFavorites_MovieID");

                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany("UserFavorites")
                    .HasForeignKey("UserId")
                    .IsRequired()
                    .HasConstraintName("FK_UserFavorites_UserID");

                b.Navigation("Movie");

                b.Navigation("User");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.WatchHistory", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Movie", "Movie")
                    .WithMany("WatchHistories")
                    .HasForeignKey("MovieId")
                    .IsRequired()
                    .HasConstraintName("FK_WatchHistory_MovieID");

                b.HasOne("CinemaHub.Domain.ObjectValues.Account", "User")
                    .WithMany("WatchHistories")
                    .HasForeignKey("UserId")
                    .IsRequired()
                    .HasConstraintName("FK_WatchHistory_UserID");

                b.Navigation("Movie");

                b.Navigation("User");
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
            {
                b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                    .WithMany()
                    .HasForeignKey("RoleId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Account", null)
                    .WithMany()
                    .HasForeignKey("UserId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Account", null)
                    .WithMany()
                    .HasForeignKey("UserId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
            {
                b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                    .WithMany()
                    .HasForeignKey("RoleId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();

                b.HasOne("CinemaHub.Domain.ObjectValues.Account", null)
                    .WithMany()
                    .HasForeignKey("UserId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.Account", null)
                    .WithMany()
                    .HasForeignKey("UserId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("MovieGenreMapping", b =>
            {
                b.HasOne("CinemaHub.Domain.ObjectValues.MovieGenre", null)
                    .WithMany()
                    .HasForeignKey("GenreId")
                    .IsRequired()
                    .HasConstraintName("FK_MovieGenreMapping_GenreID");

                b.HasOne("CinemaHub.Domain.ObjectValues.Movie", null)
                    .WithMany()
                    .HasForeignKey("MovieId")
                    .IsRequired()
                    .HasConstraintName("FK_MovieGenreMapping_MovieID");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Account", b =>
            {
                b.Navigation("Comments");

                b.Navigation("Logs");

                b.Navigation("Movies");

                b.Navigation("Payments");

                b.Navigation("Ratings");

                b.Navigation("UserFavorites");

                b.Navigation("WatchHistories");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.Movie", b =>
            {
                b.Navigation("Comments");

                b.Navigation("Ratings");

                b.Navigation("UserFavorites");

                b.Navigation("WatchHistories");
            });

            modelBuilder.Entity("CinemaHub.Domain.ObjectValues.SubscriptionPlan", b =>
            {
                b.Navigation("Payments");
            });
#pragma warning restore 612, 618
        }
    }
}
