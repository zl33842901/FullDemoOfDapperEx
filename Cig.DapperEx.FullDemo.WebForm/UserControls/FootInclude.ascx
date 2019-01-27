<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FootInclude.ascx.cs" Inherits="WebForm.UserControls.FootInclude" %>
<!--Global JS-->
<script src="/js/vendor/jquery-1.11.1.min.js"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/navgoco/jquery.navgoco.min.js"></script>
<script src="/plugins/pace/pace.min.js"></script>
<script src="/plugins/fullscreen/jquery.fullscreen-min.js"></script>
<script src="/js/src/app.js"></script>
<!--Page Level JS-->
<script src="/plugins/countTo/jquery.countTo.js"></script>
<script src="/plugins/weather/js/skycons.js"></script>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<!-- ChartJS  -->
<script src="/plugins/chartjs/Chart.min.js"></script>
<!-- Morris  -->
<script src="/plugins/morris/js/morris.min.js"></script>
<script src="/plugins/morris/js/raphael.2.1.0.min.js"></script>
<!-- Vector Map  -->
<script src="/plugins/jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/plugins/jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
<!-- Gauge  -->
<script src="/plugins/gauge/gauge.min.js"></script>
<script src="/plugins/gauge/gauge-demo.js"></script>
<!-- Calendar  -->
<script src="/plugins/calendar/clndr.js"></script>
<script src="/plugins/calendar/clndr-demo.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
<!-- Switch -->
<script src="/plugins/switchery/switchery.min.js"></script>
<!--Load these page level functions-->

<script type="text/javascript">
    var pn = location.pathname;
    if (pn == "" || pn == "/")
        pn = "/Home/Default";
    var ad = $("a[href='" + pn + "']");
    var nad = ad.parent().parent().parent();
    if (pn !="/Home/Default")
        nad.attr("class", nad.attr("class") + " active open");
    ad.parent().attr("class", "active");
</script>