using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace ASP_NET_Core_App.Pages
{
    public class ContactModel : PageModel
    {
        public string? Message { get; private set; }

        public void OnPost(string name, string email)
        {
            Message = $"Thank you, {name}! We have received your email.";
        }
    }
}
