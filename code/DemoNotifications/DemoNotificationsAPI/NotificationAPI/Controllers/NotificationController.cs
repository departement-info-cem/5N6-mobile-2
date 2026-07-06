using FirebaseAdmin.Messaging;
using Microsoft.AspNetCore.Mvc;
using NotificationAPI.DTOs;

namespace NotificationAPI.Controllers;

[ApiController]
[Route("api/[controller]/[action]")]
public class NotificationController : Controller
{
    [HttpPost]
    public async Task<IActionResult> SendOrder([FromBody] OrderRequest orderRequest)
    {
        // TODO #5 : Attendre 5 secondes pour simuler le temps de préparation de la commande.
        await Task.Delay(5000);

        // TODO #6 : Construction du message de notification à envoyer
        Message message = new()
        {
            Notification = new Notification()
            {
                Title = "Commande acceptée.",
                Body = $"{orderRequest.OrderContent} est en cours de préparation.",
            },
            // Donnnées qui n'apparaitront pas dans la notification, mais qui seront accessibles dans l'application mobile.
            Data = new Dictionary<string, string>
            {
                { "OrderContent", orderRequest.OrderContent }
            },
            // TODO #7 : Token qui nous a été envoyé par l'application mobile. 
            Token = orderRequest.DeviceToken,
        };

        // TODO #8 : Envoi du message de notification
        // Le prochain TODO est sur le code flutter!
        string response = await FirebaseMessaging.DefaultInstance.SendAsync(message);

        return Ok();
    }
}