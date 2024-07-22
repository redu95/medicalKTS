<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Banners Hallmark - Edit Chart Of Account</title>
</head>
<body>
 <div id="main" class='layout-navbar'>
           <div id="main-content">



                <div class="page-heading">

                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Edit Chart Of Account</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/chartOfAccount/chartOfAccounts">Chart Of Account</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Edit Chart Of Account
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section blnk-db">
                     <form:form class="form-horizontals" method="post" id="user_form"
						name="user_form"  onsubmit="saveForm()" action="${pageContext.request.contextPath}/chartOfAccount/updateChartOfAccount" modelAttribute="chartOfAccount">
						<form:input type="hidden" path="id"/>
						<form:input type="hidden" path="chartOfAccUnqId"/>
							<%@ include file="../common/error-and-success-message.jsp" %>
                            <div class="card tp-inpt">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="name">Name</label>
                                                <form:input type="text" maxlength="50" name="name" id="name"
															path="name" class="form-control"
															placeholder="Name" value="" required="true" readonly="true"/>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="is-active">Is Active</label>
                                                <fieldset class="">
                                                    <form:select type="text" name="isActive" id="isActive"
															path="isActive" class="form-select"
															placeholder="Is Active" value="" >														
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
                                                </fieldset>

                                            </div>
                                        </div>
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="account-number">Account Number</label>
                                                <form:input type="text" maxlength="7" name="accountNumber" id="accountNumber"
															path="accountNumber" class="form-control" onkeypress="return isNumberKey(event)"
															placeholder="Account Number" value="" required="true" readonly="true"/>
                                            </div>
                                        </div>

                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="type">Account Type</label>
                                                <fieldset class="">
                                                  <form:select type="number" name="type" id="type"
															path="type" class="form-control"
															placeholder="Account Type" value="" required="true"  >
															
															<c:forEach items="${accountsTypeList}" var="accountsTypeList" >
																<form:option value="${accountsTypeList.id}">${accountsTypeList.account_name}</form:option>
																									
															</c:forEach>
															
														</form:select>
                                                </fieldset>

                                            </div>
                                        </div>

                                        
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">  
                                                <label for="adress-2">Description</label>                                              
                                                <form:input type="text"  maxlength="250" name="description" id="description"
																	path="description" class="form-control"
																	placeholder="Description" value=""  />
                                            </div>
                                        </div>
                                    
              
                               <%--          <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="category1099">Category1099</label>
                                                <fieldset class="">
                                                    <form:select type="text" name="category1099" id="category1099"
																	path="category1099" class="form-select"
																	placeholder="Category1099" value="" >
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
                                                </fieldset>

                                            </div>
                                        </div> --%>

                                 <%--        <div class="col-md-4 col-12">
                                            <div class="form-group">  
                                                <label for="parent-name">Parent Name</label>                                             
                                                <form:input type="text" maxlength="70" name="parentName" id="parentName"
																	path="parentName" class="form-control"
																	placeholder="Parent Name" value="" />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="parent-account-number">Parent Account Number</label>
                                                <form:input  type="text" maxlength="7" name="parentAccountNumber" id="parentAccountNumber"
																	path="parentAccountNumber" class="form-control"
																	placeholder="Parent Account Number" value=""   onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>

                                        <div class="col-md-4 col-12">
                                            
                                            <div class="form-group">
                                                <label for="created">Created</label>
                                               
                                                <form:input type="date" name="created" id="created"
																	path="created" class="form-control"
																	placeholder="Created"  />    
                                            </div>
                                        </div>

                                        <div class="col-md-4 col-12">
                                            

                                            <div class="form-group">
                                                <label for="updated">Updated</label>
                                               <form:input type="date" name="updated" id="updated"
																	path="updated" class=" form-control"
																	placeholder="Updated"  />
                                            </div>

                                        </div>


                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="MergedIntoName">Merged Into Name</label>
                                                <form:input type="text" maxlength="100" name="mergedIntoName" id="mergedIntoName"
																	path="mergedIntoName" class="form-control"
																	placeholder="Merged Into Name" value="" />
                                            </div>
                                        </div>


                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="MergedIntoAccount">Merged Into Account</label>
                                                <form:input type="number" name="mergedIntoAccountNumber" id="mergedIntoAccountNumber"
																	path="mergedIntoAccountNumber" class="form-control"
																	placeholder="Merged Into Account Number" value="" />
                                            </div>
                                        </div> --%>



                                       

                                    </div>

                                   

                                </div>
                            </div>                           

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <button type="submit" class=" c-btn btn btn-primary me-3 mb-1" id="updateForm">Update</button>
                               <a href="${pageContext.request.contextPath}/chartOfAccount/chartOfAccounts" class="c-btn btn btn-danger  mb-1">Cancel</a>
                                 </div>
                            </div>
                        </form:form>

                    </section>

                </div>



                <footer>
                    <div class="footer clearfix mb-0 text-muted c-ftr">
                        <div class="float-start">
                            <p>2021 &copy; Banners Hallmark</p>
                        </div>
                        <div class="float-end">
                            <p>Developed by <span class="text-danger"><i class="bi bi-heart"></i></span> <a
                                    href="#">Suntek
                                    IT Solutions </a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<script>

function saveForm() {
	document.getElementById("updateForm").disabled = true;       
}

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
</script>
<script>
	$(document).ready(function (){
		
	   var createdDate = document.getElementById("created");
		var today = new Date();
		createdDate.value = today.toISOString().substr(0, 10);
		
		var updatedDate = document.getElementById("updated");
		var today = new Date();
		updatedDate.value = today.toISOString().substr(0, 10); 
		
		function isNumberKey(evt)
	    {
	       var charCode = (evt.which) ? evt.which : evt.keyCode;
	       if (charCode < 48 || charCode > 57)
	          return false;

	       return true;
	    }
	});
</script>
</body>
</html>