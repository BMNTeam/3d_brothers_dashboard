<script src="assets/pages/datatables.editable.init.js"></script>
<script src="assets/plugins/jquery-datatables-editable/jquery.dataTables.js"></script>
<!--BMNTeam Custom-->
<script src="assets/js/datatables.editable.init.js"></script>
<script src="assets/plugins/dropzone/dist/dropzone.js"></script>

<script src="assets/js/common.min.js"></script>
<!-- google analytic code -->


<!-- google analytic code ends here -->

<!-- following js will activate the menu in left side bar based on url -->
<script type="text/javascript">
    // === following js will activate the menu in left side bar based on url ====
    $(document).ready(function() {
        $("#sidebar-menu a").each(function() {
            if (this.href == window.location.href) {
                $(this).addClass("active");
                $(this).parent().addClass("active"); // add active to li of the current link
                $(this).parent().parent().prev().addClass("active"); // add active class to an anchor
                $(this).parent().parent().prev().click(); // click the item to make it drop
            }
        });
    });

</script>

</body>
</html>