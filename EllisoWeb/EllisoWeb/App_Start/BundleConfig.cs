using System.Web;
using System.Web.Optimization;

namespace Elliso
{
    public class BundleConfig
    {
        // 如需 Bundling 的詳細資訊，請造訪 http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/js/jquery").Include("~/js/jquery.min.js"));

            bundles.Add(new ScriptBundle("~/js/bootstrap").Include("~/css/vendors/bootstrap/dist/js/bootstrap.min.js"));

            bundles.Add(new ScriptBundle("~/js/jqueryui").Include("~/js/jquery-ui-1.9.2.custom.min.js"));

            bundles.Add(new ScriptBundle("~/js/custom").Include("~/js/custom.js"));

            bundles.Add(new StyleBundle("~/css/bootstrap").Include("~/css/vendors/bootstrap/dist/css/bootstrap.min.css", "~/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"));

            bundles.Add(new StyleBundle("~/css/font-awesome").Include("~/css/vendors/font-awesome/css/font-awesome.min.css"));

            bundles.Add(new StyleBundle("~/css/custom").Include("~/css/custom.css"));

            bundles.Add(new StyleBundle("~/css/jqueryui").Include("~/css/jquery-ui-1.9.2.custom.css"));
        }
    }
}