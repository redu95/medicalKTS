// datepicker start
/*
jQuery(document).ready(function ($) {
  $('input[type=date]').each(function () {
    $(this).clone().attr('type', 'text').insertAfter(this).datepicker().prev().remove();
  });
});*/

// datepicker end

// delete error message  


    $(document).ready(function (){
    	 $('.delete-msg').click(function () { 
    		 $(".eror-msg").hide();	  	
    	 }); 
	    });   
 

// delete error message  

// data-table with pagination only  

$(document).ready(function () {
  $('#table-p').DataTable({
    "scrollX": true,
    oLanguage: {
      oPaginate: {
        sNext: '<span class="pagination-default">&#x276f;</span>',
        sPrevious: '<span class="pagination-default">&#x276e;</span>'
      }
    }
  });
});

$(document).ready(function () {
  $('#table-msg').DataTable({
	"ordering": false,
    "scrollX": true,
    oLanguage: {
      oPaginate: {
        sNext: '<span class="pagination-default">&#x276f;</span>',
        sPrevious: '<span class="pagination-default">&#x276e;</span>'
      }
    }
  });
});

$(document).ready(function () {
  $('#table-msg2').DataTable({
	"ordering": false,
    "scrollX": true,
    oLanguage: {
      oPaginate: {
        sNext: '<span class="pagination-default">&#x276f;</span>',
        sPrevious: '<span class="pagination-default">&#x276e;</span>'
      }
    }
  });
});

$(document).ready(function () {
  $('#table-a').DataTable({
    "scrollX": true,
    order: [[2, 'desc']],
    oLanguage: {
      oPaginate: {
        sNext: '<span class="pagination-default">&#x276f;</span>',
        sPrevious: '<span class="pagination-default">&#x276e;</span>'
      }
    }
  });
});

$(document).ready(function () {
  $('#table-pox').DataTable({
    "scrollX": true,
    order: [[6, 'desc']],
    oLanguage: {
      oPaginate: {
        sNext: '<span class="pagination-default">&#x276f;</span>',
        sPrevious: '<span class="pagination-default">&#x276e;</span>'
      }
    }
  });
});


$(document).ready(function () {
  $('.table-p10').DataTable({
    "scrollX": true,
    oLanguage: {
      oPaginate: {
        sNext: '<span class="pagination-default">&#x276f;</span>',
        sPrevious: '<span class="pagination-default">&#x276e;</span>'
      }
    }
  });
	$('.burger-btn').on('click', function () {
	  $(this).parents('#app').find('.hello-worls').toggleClass('open')
	});
	$(function() {
	  $(".fixedHeader-floating>thead>tr").scroll(function() {
	    $(".dataTables_scrollBody ")
	      .scrollLeft($(".fixedHeader-floating>thead>tr").scrollLeft());
	  });
	  $(".dataTables_scrollBody ").scroll(function() {
	    $(".fixedHeader-floating>thead>tr")
	      .scrollLeft($(".dataTables_scrollBody ").scrollLeft());
	  });
	});

	$('body').on('DOMNodeInserted', function(e) {
		if($(e.target).closest("div#app").length == 0) {
			if($(e.target).hasClass("hello-worls")) {
				setTimeout(function() {
					$(".fixedHeader-floating>thead>tr").scrollLeft($(".dataTables_scrollBody").scrollLeft());
				}, 5);
			}
		}
	});
});




$(document).ready(function () {
	  $('#table-poTable').DataTable({
	    "scrollX": true,
	    'order' : [ [ 2, 'desc' ] ],
	    oLanguage: {
	      oPaginate: {
	        sNext: '<span class="pagination-default">&#x276f;</span>',
	        sPrevious: '<span class="pagination-default">&#x276e;</span>'
	      }
	    }
	  });
	});

// data-table with pagination only  


// data-table with pagination only with check box all select and 1st th inavtive 
    $(document).ready(function () {
		$(function() {
		  $(".fixedHeader-floating>thead>tr").scroll(function() {
		    $(".dataTables_scrollBody ")
		      .scrollLeft($(".fixedHeader-floating>thead>tr").scrollLeft());
		  });
		  $(".dataTables_scrollBody ").scroll(function() {
		    $(".fixedHeader-floating>thead>tr")
		      .scrollLeft($(".dataTables_scrollBody ").scrollLeft());
		  });
		});

        $('.checkAll').click(function () {
            var rows = table.rows({ 'search': 'applied' }).nodes();
            $('.example-select-single', rows).prop('checked', this.checked);
         
        });
    });

    
    
    $(document).ready(function () {
/*
        var table = $('#table-p-chk-bx-access').DataTable({
        	
        	    "bPaginate": false,
        	    "bLengthChange": false, 
            "scrollX": true,
            columnDefs: [{
                orderable: false,
                targets: 0,                   
            }],
          
            'order': [1, 'asc'],
            oLanguage: {
        oPaginate: {
            sNext: '<span class="pagination-default">&#x276f;</span>',
            sPrevious: '<span class="pagination-default">&#x276e;</span>'
        }
    }
        });
       */
        $('.checkAll').click(function () {
            var rows = table.rows({ 'search': 'applied' }).nodes();
            $('.example-select-single', rows).prop('checked', this.checked);
        });
    });
    

// data-table with pagination only with check box all select and 1st th inavtive 


// Add Purchase Orders cloning table and td


/*$('.delete').on('click', function (event) {
  $(this).parents('tr').remove();
});

$(".add").on('click', function (event) {
  $(this).parents('tr:last-child').clone(true).appendTo('tbody');
  // to make the clone removable, set clone(true)
});



$('.dlte-tble').on('click', function (event) {
  $(this).parents('.cln-tble').remove();
});

$(".cpy-tble").on('click', function (event) {
  $(this).parents('.cln-tble').clone(true).appendTo('.apnd-tble');
  // to make the clone removable, set clone(true)
});
*/
// Add Purchase Orders cloning table and td


// file upload in vendor page

      /*  const realFileBtn = document.getElementById("real-file");
        const customBtn = document.getElementById("custom-button");
        const customTxt = document.getElementById("custom-text");

        customBtn.addEventListener("click", function () {
            realFileBtn.click();
        });

        realFileBtn.addEventListener("change", function () {
            if (realFileBtn.value) {
                customTxt.innerHTML = realFileBtn.value.match(
                    /[\/\\]([\w\d\s\.\-\(\)]+)$/
                )[1];

                $('.upld-btn').removeAttr("disabled");


            } else {
                customTxt.innerHTML = "No file chosen, yet.";
                $('.upld-btn').Attr("disabled");
            }
        });
*/
// file upload in vendor page



// on change dropdown options class add and removed

    var filterActive;

    function filterCategory(category) {
        if (filterActive != category) {

            // reset results list
            $('.filter-cat-results .f-cat').removeClass('active-inv-v');

            // elements to be filtered
            $('.filter-cat-results .f-cat')
                .filter('[data-cat="' + category + '"]')
                .addClass('active-inv-v');

            // reset active filter
            filterActive = category;
        }
    }

    // $('.f-cat').addClass('active');

    $('.filtering select').change(function () {
        if ($(this).val() == 'cat-all') {
            $('.filter-cat-results .f-cat').addClass('active-inv-v');
            filterActive = 'cat-all';
        } else {
            filterCategory($(this).val());
        }
    });

// on change dropdown options class add and removed