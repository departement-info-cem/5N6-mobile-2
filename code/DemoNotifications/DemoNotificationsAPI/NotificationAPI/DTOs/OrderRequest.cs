namespace NotificationAPI.DTOs;

public class OrderRequest
{
    public required string OrderContent { get; set; }
    public required string DeviceToken { get; set; }
}