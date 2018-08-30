/* datepicker            */
$(function () {
    var datepicker = $("input[id^=datepicker]");
    datepicker.datepicker({
        dateFormat: 'yy/mm/dd',
        onSelect: function (dateText, inst) {
            $(this).css("color", "black");
        },
        onClose: function (selectedDate) {
            if (selectedDate == "") {
                $(this).css("color", "#cbcddc");
            }
        }
    });
});

$.validate({
    lang: 'zh_TW'
});

//$("form").validate({
//    submitHandler: function (form) {
//        alert("This is a valid form!");
//    }
//});
/* ----------------------*/


/* chosen-select         */
// Create Chosen Select Menus
setUpSelectMenus();

// Reset Chosen Select Menus when window changes size
window.addEventListener("resize", function () { setUpSelectMenus(); });

//Settings for Default Chosen Select Menus
function setUpSelectMenus() {

    $('.chosen-select')
        .chosen("destroy") // Need this to make responsive
        .chosen(
            {
                allow_single_deselect: true,
                disable_search_threshold: 10
            }
        );
}
/* ----------------------*/