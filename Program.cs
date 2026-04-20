var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
//Add comment test kk test testing
//Add comment - saurabh
//Add comment 2 - saurabh
//Add comment 3- Abheek
//Add comment 4 - saurabh
//Add comment 5 - saurabh
//Add comment 6 - saurabh
//Add comment 7 - saurabh
//Add comment 8 - saurabh
//Add comment 9 - saurabh
//Add comment 10 - saurabh
//Add comment 11 - saurabh
//Add comment 12 - saurabh
//Add comment 13 - saurabh
//Add comment 14 - saurabh
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
