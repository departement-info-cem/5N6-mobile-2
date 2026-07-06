using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.FileProviders;

WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllers();

// TODO #4 : Configuration de Firebase au lancement de l'application.
// Cela nous donnera la permission d'effectuer des opérations sur Firebase plus tard.
// N'oubliez pas d'aller lire le README.md pour savoir comment obtenir le fichier google-admin.json.
FirebaseApp.Create(new AppOptions
{
    Credential = GoogleCredential.FromFile("google-admin.json")
});

WebApplication app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.MapControllers();

app.Run();