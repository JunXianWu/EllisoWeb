using System.Web;
using System.Web.Optimization;

namespace iUEDA
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/scripts").Include(
                      "~/Scripts/popper.min.js",
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/plugins.js",
                      "~/Scripts/active.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/style.css",
                      "~/Content/responsive.css"));
        }
    }
}
