using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class UserSession
{
    public int SessionId { get; set; }

    public string UserGuid { get; set; }

    public string Session { get; set; }

    public DateTime Expiry { get; set; }
}
