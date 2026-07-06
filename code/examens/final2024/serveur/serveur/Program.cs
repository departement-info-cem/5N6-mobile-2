using Microsoft.AspNetCore.Mvc;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.UseHttpsRedirection();

app.MapGet("/Exam2024/Division/{dividende:int}/{diviseur:int}",
    ([FromRoute] int dividende, [FromRoute] int diviseur) => diviseur == 0
        ? Results.BadRequest("Impossible d'effectuer une division par 0.")
        : Results.Ok(new { resultat = (dividende / diviseur) }));

app.Run();