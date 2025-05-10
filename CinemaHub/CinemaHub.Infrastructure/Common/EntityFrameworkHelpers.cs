using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Common
{
    public static class EntityFrameworkHelpers
    {
        public static void AttachIfNotTracked<TEntity>(this DbContext context, TEntity entity) where TEntity : class
        {
            var key = context.Model.FindEntityType(typeof(TEntity))?.FindPrimaryKey();
            if (key == null) throw new InvalidOperationException("Entity must have a primary key");

            var keyValues = key.Properties
                .Select(p => typeof(TEntity).GetProperty(p.Name)?.GetValue(entity))
                .ToArray();

            bool isTracked = context.ChangeTracker.Entries<TEntity>()
                .Any(e => key.Properties.All(p =>
                    Equals(
                        typeof(TEntity).GetProperty(p.Name)?.GetValue(e.Entity),
                        typeof(TEntity).GetProperty(p.Name)?.GetValue(entity)
                    )
                ));

            if (!isTracked)
            {
                context.Set<TEntity>().Attach(entity);
            }
        }
    }
}
