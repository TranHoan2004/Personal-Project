<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="search" method="post" class="form-inline my-2 my-lg-0">
    <div class="input-group input-group-sm">
        <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
        <div class="input-group-append">
            <button type="submit" class="btn btn-secondary btn-number">
                <i class="fa fa-search"></i>
            </button>
        </div>
    </div>
</form>
