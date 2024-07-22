<c:if test="${not empty msg}">
	<div class="eror-msg">
		<div class="card">
			<div class="card-body error-msg">
				<p class="text-danger">Error - ${msg}</p>
				<a class="delete-msg btn btn-light">X</a>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${not empty successMsg}">
	<div class="eror-msg">
		<div class="card">
			<div class="card-body success-msg">
				<p class="">${successMsg}</p>
				<a class="delete-msg btn btn-light">X</a>
			</div>
		</div>
	</div>
</c:if>
