using System.ComponentModel.DataAnnotations;

namespace DatabaseApi;

public class Consignee_CustomerDto
{    
    public string CompanyName { get; set; }

    public string CompanyOwner { get; set; }

    public string CustomerName { get; set; }

    public string Guid { get; set; }   

}
