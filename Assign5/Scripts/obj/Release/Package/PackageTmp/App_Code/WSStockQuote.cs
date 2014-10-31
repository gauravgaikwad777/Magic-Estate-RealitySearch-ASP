using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;

/// <summary>
/// Summary description for WSStockQuote
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WSStockQuote : System.Web.Services.WebService 
{

    public WSStockQuote () 
    {

    }

    [WebMethod]
    public string HelloWorld(string cName)
    {
        ServiceReference1.StockQuoteSoapClient objStock = new ServiceReference1.StockQuoteSoapClient();

        string sValue = objStock.GetQuote(cName);
        return sValue;
    }
}
