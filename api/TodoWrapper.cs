using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Net.Http;
using System.Net.Http.Headers;
using Azure.Identity;
using Azure.Core;

namespace api
{
    public static class TodoWrapper
    {
        static readonly HttpClient _client = new HttpClient();

        [FunctionName("WrappedTodo")]
        public static async Task<IActionResult> RunWrappedTodo(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            // Internal routing to data-api not working yet
            using (var m = new HttpRequestMessage(HttpMethod.Get, "/data-api/v1/todo"))
            {
                var response = await _client.SendAsync(m);        
                response.EnsureSuccessStatusCode();            

                var result = await response.Content.ReadAsStringAsync();
                var todos = JsonConvert.DeserializeObject(result);
            
                return new OkObjectResult(todos);
            }            
        }

        [FunctionName("Test")]
        public static IActionResult RunTest(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            var result = new {
                req.Host,
                req.Path,
                req.PathBase,
                timestamp = DateTime.Now
            };

            return new OkObjectResult(result);
        }
    }
}
