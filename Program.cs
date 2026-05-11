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
//Add comment 15 - saurabh
//Add comment 16 - saurabh
//Add comment 17 - saurabh
//Add comment 18 - saurabh
//Add comment 19 - saurabh
//Add comment 20 - saurabh
//Add comment 21 - saurabh
//Add comment 22 - saurabh
//Add comment 23 - saurabh
//Add comment 24 - saurabh
//Add comment 25 - saurabh
//Add comment 26 - saurabh
//Add comment 27 - saurabh
//Add comment 28 - saurabh
//Add comment 29 - saurabh
//Add comment 30 - saurabh
//Add comment 31 - saurabh
//Add comment 32 - saurabh
//Add comment 33 - saurabh
//Add comment 34 - saurabh
//Add comment 35 - saurabh
//Add comment 36 - saurabh
//Add comment 37 - saurabh
//Add comment 38 - saurabh
//Add comment 39 - saurabh
//Add comment 40 - saurabh
//Add comment 41 - saurabh
//Add comment 42 - saurabh
//Add comment 43 - saurabh
//Add comment 44 - saurabh
//Add comment 45 - saurabh
//Add comment 46 - saurabh
//Add comment 47 - saurabh
//Add comment 48 - saurabh
//Add comment 49 - saurabh
//Add comment 50 - saurabh
//Add comment 51 - saurabh
//Add comment 52 - saurabh
//Add comment 53 - saurabh
//Add comment 54 - saurabh
//Add comment 55 - saurabh
//Add comment 56 - saurabh
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
