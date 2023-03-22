using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Sql;
using Microsoft.Extensions.Logging;
using SendGrid.Helpers.Mail;

namespace api
{
    public static class Emailer
    {
        [FunctionName("EmailToDo")]
        public static async Task SendEmails(
            [SqlTrigger("[dbo].[todos]", "SqlConnectionString")] IReadOnlyList<SqlChange<ToDo>> todoChanges,
            [SendGrid(ApiKey = "SendGridKeyAppSetting")] IAsyncCollector<SendGridMessage> messageCollector,
            ILogger log)
        {
            foreach (SqlChange<ToDo> todoChange in todoChanges)
            {
                // check if the completed flag is true
                if (todoChange.Operation == SqlChangeOperation.Update && todoChange.Item.completed)
                {
                    var message = new SendGridMessage();
                    message.AddTo($"{todoChange.Item.owner_id}@yourdomain.com");
                    message.SetFrom("noreply@yourdomain.com");
                    message.SetSubject("Todo completed");
                    message.AddContent("text/plain", $"Todo {todoChange.Item.title} completed");

                    await messageCollector.AddAsync(message);
                    log.LogInformation("todo completed, email sent");
                }
            }
        }
    }

    public class ToDo
    {
        public int id { get; set; }
        public string title { get; set; }
        public bool completed { get; set; }
        public string owner_id { get; set; }
        public int position { get; set; }
    }
}