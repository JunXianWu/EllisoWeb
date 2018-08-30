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
                      "~/Scripts/active.js",
                      "~/Scripts/jquery-ui.js",
                      "~/Scripts/chosen.jquery.min.js",
                      "~/Scripts/prism.js",
                      "~/Scripts/init.js",
                      "~/Scripts/jquery.form-validator.min.js",
                      //"~/Scripts/jquery.validate.js",
                      "~/Scripts/custom.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/style.css",
                      "~/Content/responsive.css",
                      "~/Content/jquery-ui.css",
                      "~/Content/chosen.min.css",
                      "~/Content/prism.css",
                      "~/Content/custom.css"
                      ));
        }
    }
}
