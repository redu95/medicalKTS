function slideToggle(t,e,o){0===t.clientHeight?j(t,e,o,!0):j(t,e,o)}function slideUp(t,e,o){j(t,e,o)}function slideDown(t,e,o){j(t,e,o,!0)}function j(t,e,o,i){void 0===e&&(e=400),void 0===i&&(i=!1),t.style.overflow="hidden",i&&(t.style.display="block");var p,l=window.getComputedStyle(t),n=parseFloat(l.getPropertyValue("height")),a=parseFloat(l.getPropertyValue("padding-top")),s=parseFloat(l.getPropertyValue("padding-bottom")),r=parseFloat(l.getPropertyValue("margin-top")),d=parseFloat(l.getPropertyValue("margin-bottom")),g=n/e,y=a/e,m=s/e,u=r/e,h=d/e;window.requestAnimationFrame(function l(x){void 0===p&&(p=x);var f=x-p;i?(t.style.height=g*f+"px",t.style.paddingTop=y*f+"px",t.style.paddingBottom=m*f+"px",t.style.marginTop=u*f+"px",t.style.marginBottom=h*f+"px"):(t.style.height=n-g*f+"px",t.style.paddingTop=a-y*f+"px",t.style.paddingBottom=s-m*f+"px",t.style.marginTop=r-u*f+"px",t.style.marginBottom=d-h*f+"px"),f>=e?(t.style.height="",t.style.paddingTop="",t.style.paddingBottom="",t.style.marginTop="",t.style.marginBottom="",t.style.overflow="",i||(t.style.display="none"),"function"==typeof o&&o()):window.requestAnimationFrame(l)})}

let sidebarItems = document.querySelectorAll('.sidebar-item.has-sub');
for(var i = 0; i < sidebarItems.length; i++) {
    let sidebarItem = sidebarItems[i];
	sidebarItems[i].querySelector('.sidebar-link').addEventListener('click', function(e) {
        e.preventDefault();
         
         $(this).toggleClass('d-active');
         
        let submenu = sidebarItem.querySelector('.submenu');
        if(submenu.style.display == 'none') submenu.classList.add('active')
        else submenu.classList.remove('active')
        slideToggle(submenu, 300)
    })
}

window.addEventListener('DOMContentLoaded', (event) => {
    var w = window.innerWidth;
    if(w < 12000) {
        document.getElementById('sidebar').classList.remove('active');
    }
});
window.addEventListener('resize', (event) => {
    var w = window.innerWidth;
    if(w < 12000) {
        document.getElementById('sidebar').classList.remove('active');
    }else{
        document.getElementById('sidebar').classList.add('active');
    }
});

document.querySelector('.burger-btn').addEventListener('click', () => {
    document.getElementById('sidebar').classList.toggle('active');
})
document.querySelector('.sidebar-hide').addEventListener('click', () => {
    document.getElementById('sidebar').classList.toggle('active');

})


// Perfect Scrollbar Init
if(typeof PerfectScrollbar == 'function') {
    const container = document.querySelector(".sidebar-wrapper");
    const ps = new PerfectScrollbar(container, {
        wheelPropagation: false
    });
}

// Scroll into active sidebar
document.querySelector('.sidebar-item.active').scrollIntoView(false)

$('.burger-btn').on('click', function(e){
	$($.fn.dataTable.tables(true)).DataTable().columns.adjust().responsive.recalc();
});

function toDate(timeStamp,seprator) {
	if(timeStamp == null) {
		return "";
	}
	if(typeof seprator === 'undefined' || seprator == null) {
		seprator = "/";
	}
	var date = new Date(timeStamp);
	return String((date.getMonth()+1)).padStart(2,"0") + seprator + String(date.getDate()).padStart(2,"0") + seprator +  date.getFullYear();
}

function checkUnverifiedPoStatus() {
	$.ajax({
        url: contextPath + "/ajax/unverifiedInvoice/checkVerification",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		success: function (response) {
			console.log(response);
			if(response.result == "Undefinded") {
				localStorage.removeItem("checkUnverifiedPoStatus");
			} else if(response.result == "Running") {
				setTimeout(checkUnverifiedPoStatus,3000);
			} else if(response.result == "Completed") {
				localStorage.removeItem("checkUnverifiedPoStatus");
				setTimeout(function() {
					showNotifaication("Process Completed","", "Automatic Verify All Unverified Purchase Orders Process Completed, Click to see results.", contextPath + "/unverifiedPOZapier/checkVerification")
				},2000);
			}
		}
	});
}
var checkStatus = localStorage.getItem("checkUnverifiedPoStatus");
console.log("checkStatus" , checkStatus);
if(checkStatus) {
	checkUnverifiedPoStatus();
}
function showNotifaication(heading,icon,messageBody, redirectionURL) {
    if (!("Notification" in window)) {
        console.log("Desktop notifications is not supported by this browser. Try another.");
        return;
    } else if (Notification.permission === "granted") {
        var myNotification = new Notification(heading, {
            icon: icon,
            body: messageBody
        });
		myNotification.onclick = function(event) {
			event.preventDefault(); // prevent the browser from focusing the Notification's tab
            window.open(redirectionURL);
		}

    } else if (Notification.permission !== 'denied') {
        Notification.requestPermission(function (userPermission) {
            if (userPermission === "granted") {
				var myNotification = new Notification(heading, {
		            icon: icon,
		            body: messageBody
		        });
		        myNotification.onclick = function () {
		            window.open(redirectionURL);
		        };
            }
        });
    }
}

$(document).on('change', '.form-control-error', function() {
    var input = $(this);
    var value = input.val();
    if(value == null || value.trim()  == ""); else {
        input.removeClass("form-control-error");
    }
});

function removeOldErrors() {
	$('.form-control-error').each(function(index, data){
		$(data).removeClass("form-control-error");
    });
}
function setErrorOnInputControl(element) {
	element.addClass("form-control-error");
}

function isIntNumberKey(evt) {
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if (charCode < 48 || charCode > 57)
      return false;
   return true;
}

function isFloatNumberKey(evt) {
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if ((charCode >= 48 && charCode <= 57) || charCode == 46)
      return true;
   return false;
}
Number.prototype.toFixedSpecial = function(n) {
	var str = this.toFixed(n);
	if (str.indexOf('e+') === -1)
		return str;
	// if number is in scientific notation, pick (b)ase and (p)ower
	str = str.replace('.', '').split('e+').reduce(function(b, p) {
		return b + Array(p - b.length + 2).join(0);
	});
	if (n > 0)
		str += '.' + Array(n + 1).join(0);
	return str;
}
function getInput(name, inputType, value, cssClass, extraProperties) {
	var inputE = '<input';
	inputE += " name='"+name + "'";

	if(typeof cssClass != 'undefined' && cssClass != null) {
 		inputE += " class='"+ cssClass +"'";
	}
	if(typeof inputType != 'undefined' && inputType != null) {
		inputE += " type='" + inputType + "'";
	} else {
		inputE += " type=text";
	}
	if(typeof value != 'undefined' && value != null) {
		inputE += " value='" + value + "'"; // invoiceItem[property];
	}
	if(typeof extraProperties != 'undefined' && extraProperties != null) {
		inputE += " " + extraProperties;
	}
	return inputE + ">";
}
