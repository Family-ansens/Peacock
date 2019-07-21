using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Peacock.Dal.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "T_System_LanguageRelation",
                columns: table => new
                {
                    ID = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    CreatedBy = table.Column<string>(maxLength: 50, nullable: false),
                    CreatedTime = table.Column<DateTime>(type: "datetime", nullable: false),
                    LastUpdatedBy = table.Column<string>(maxLength: 50, nullable: false),
                    LastUpdatedDate = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T_System_LanguageRelation", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "T_System_LanguageContent",
                columns: table => new
                {
                    ID = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    RelationId = table.Column<int>(nullable: false),
                    LanguageType = table.Column<string>(unicode: false, maxLength: 50, nullable: false),
                    DisplayContent = table.Column<string>(type: "text", nullable: false),
                    CreatedBy = table.Column<string>(maxLength: 50, nullable: false),
                    CreatedTime = table.Column<DateTime>(type: "datetime", nullable: false),
                    LastUpdatedBy = table.Column<string>(maxLength: 50, nullable: false),
                    LastUpdatedTime = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T_System_LanguageContent", x => x.ID);
                    table.ForeignKey(
                        name: "FK_T_System_LanguageContent_T_System_LanguageRelation",
                        column: x => x.RelationId,
                        principalTable: "T_System_LanguageRelation",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "T_System_Menu",
                columns: table => new
                {
                    ID = table.Column<int>(nullable: false)
                        .Annotation("MySQL:AutoIncrement", true),
                    ParentId = table.Column<int>(nullable: false),
                    Code = table.Column<string>(unicode: false, maxLength: 50, nullable: false),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    Url = table.Column<string>(unicode: false, maxLength: 100, nullable: false),
                    Seq = table.Column<int>(nullable: false),
                    LanguageRelationId = table.Column<int>(nullable: true),
                    IsDeleted = table.Column<short>(nullable: false),
                    CreatedBy = table.Column<string>(maxLength: 50, nullable: false),
                    CreatedTime = table.Column<DateTime>(type: "datetime", nullable: false),
                    LastUpdatedBy = table.Column<string>(maxLength: 50, nullable: false),
                    LastUpdatedDate = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T_System_Menu", x => x.ID);
                    table.ForeignKey(
                        name: "FK_T_System_Menu_T_System_LanguageRelation",
                        column: x => x.LanguageRelationId,
                        principalTable: "T_System_LanguageRelation",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_T_System_LanguageContent_RelationId",
                table: "T_System_LanguageContent",
                column: "RelationId");

            migrationBuilder.CreateIndex(
                name: "IX_T_System_Menu_LanguageRelationId",
                table: "T_System_Menu",
                column: "LanguageRelationId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "T_System_LanguageContent");

            migrationBuilder.DropTable(
                name: "T_System_Menu");

            migrationBuilder.DropTable(
                name: "T_System_LanguageRelation");
        }
    }
}
