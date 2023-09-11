using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CinemaApp.Data.Migrations
{
    public partial class commentupdated : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Blogs_blogId",
                table: "Comments");

            migrationBuilder.RenameColumn(
                name: "blogId",
                table: "Comments",
                newName: "BlogId");

            migrationBuilder.RenameIndex(
                name: "IX_Comments_blogId",
                table: "Comments",
                newName: "IX_Comments_BlogId");

            migrationBuilder.AddColumn<string>(
                name: "AppUserId1",
                table: "Comments",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Comments_AppUserId1",
                table: "Comments",
                column: "AppUserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_AspNetUsers_AppUserId1",
                table: "Comments",
                column: "AppUserId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Blogs_BlogId",
                table: "Comments",
                column: "BlogId",
                principalTable: "Blogs",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comments_AspNetUsers_AppUserId1",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Blogs_BlogId",
                table: "Comments");

            migrationBuilder.DropIndex(
                name: "IX_Comments_AppUserId1",
                table: "Comments");

            migrationBuilder.DropColumn(
                name: "AppUserId1",
                table: "Comments");

            migrationBuilder.RenameColumn(
                name: "BlogId",
                table: "Comments",
                newName: "blogId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "Comments",
                newName: "BlogtId");

            migrationBuilder.RenameIndex(
                name: "IX_Comments_BlogId",
                table: "Comments",
                newName: "IX_Comments_blogId");

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Blogs_blogId",
                table: "Comments",
                column: "blogId",
                principalTable: "Blogs",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
