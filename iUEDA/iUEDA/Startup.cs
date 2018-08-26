using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(iUEDA.Startup))]
namespace iUEDA
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
