function submit_url(url){
	/*
	    $.ajax({
        url: url,
        data: {
        },
        type: "GET",
        dataType: "html",
        success: function (data) {
            //var result = $('<div />').append(data).find('#maindiv').html();
            //$('#maindiv').html(result);
			location.href = url
        },
        error: function (xhr, status) {
            alert("Sorry, there was a problem!");
        },
        complete: function (xhr, status) {
            //$('#maindiv').slideDown('slow')
        }
    });
	*/
				location.href = url;
}

//下拉選單模糊查詢
$(function () {

    $.widget("custom.combobox", {
        _create: function () {
            this.wrapper = $("<span>")
          .addClass("custom-combobox")
          .insertAfter(this.element);
            this.element.hide();
            this._createAutocomplete();
            this._createShowAllButton();
        },

        _createAutocomplete: function () {
            var selected = this.element.children(":selected"),
          value = selected.val() ? selected.text() : "";

            this.input = $("<input style='width:80%;height:41px;float:left;'>")
          .appendTo(this.wrapper)
          .val(value)
          .attr("title", "")
            //.addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
          .autocomplete({
              delay: 0,
              minLength: 0,
              source: $.proxy(this, "_source")
          })

          .tooltip({
              classes: {
                  "ui-tooltip": "ui-state-highlight"
              }
          });

            this._on(this.input, {
                autocompleteselect: function (event, ui) {
                    ui.item.option.selected = true;
                    this._trigger("select", event, {
                        item: ui.item.option
                    });
                },
                autocompletechange: "_removeIfInvalid"
            });
        },

        _createShowAllButton: function () {
            var input = this.input,
          wasOpen = false;

            $("<a>")
          .attr("tabIndex", -1)
          .attr("title", "Show All Items")
          .tooltip()
          .appendTo(this.wrapper)
          .append('<i class="fa fa-search" style="float:left;"></i>')

          .removeClass("ui-corner-all")
          .addClass("custom-combobox-toggle ui-corner-right")
          .on("mousedown", function () {
              wasOpen = input.autocomplete("widget").is(":visible");
          })
          .on("click", function () {
              input.trigger("focus");

              // Close if already visible
              if (wasOpen) {
                  return;
              }

              // Pass empty string as value to search for, displaying all results
              input.autocomplete("search", "");
          });
        },

        _source: function (request, response) {
            var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
            response(this.element.children("option").map(function () {
                var text = $(this).text();
                if (this.value && (!request.term || matcher.test(text)))
                    return {
                        label: text,
                        value: text,
                        option: this
                    };
            }));
        },

        _removeIfInvalid: function (event, ui) {
            // Selected an item, nothing to do
            if (ui.item) {
                return;
            }

            // Search for a match (case-insensitive)
            var value = this.input.val(),
          valueLowerCase = value.toLowerCase(),
          valid = false;
            this.element.children("option").each(function () {
                if ($(this).text().toLowerCase() === valueLowerCase) {
                    this.selected = valid = true;
                    return false;
                }
            });

            // Found a match, nothing to do
            if (valid) {
                return;
            }


            this._delay(function () {
                this.input.tooltip("close").attr("title", "");
            }, 2500);
            this.input.autocomplete("instance").term = "";
        },



        _destroy: function () {
            this.wrapper.remove();
            this.element.show();
        }
    });

    $('[id^=combobox]').combobox();
    $("#toggle").on("click", function () {
        $('[id^=combobox]').toggle();
    });
});
//

$('input').addClass("ui-widget ui-state-default ");

//全選
$("#checkAll").change(function () {
    $("input:checkbox").prop('checked', $(this).prop("checked"));
});

function strReplaceAll(string, Find, Replace) {
    try {
        return string.replace(new RegExp(Find, "gi"), Replace);
    } catch (ex) {
        return string;
    }
}
