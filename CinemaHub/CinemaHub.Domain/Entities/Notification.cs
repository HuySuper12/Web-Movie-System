using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class Notification
    {
        public int NotificationId { get; set; }

        public string UserId { get; set; }

        public string ReceiverId { get; set; }

        public string Title { get; set; } = null!;

        public string Content { get; set; } = null!; //Dung de chua doan du lieu load len HTML cho nguoi dung

        public string ContentDetail { get; set; } = null!; //Dung de chua doan du lieu load len thong bao chi tiet cho Admin

        public bool? Status { get; set; }

        public DateTime? CreatedAt { get; set; }

        public virtual Account User { get; set; } = null!;
    }
}
