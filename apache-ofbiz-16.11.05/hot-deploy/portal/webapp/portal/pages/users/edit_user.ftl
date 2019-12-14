
<div class="container-fluid">
    <div>&nbsp;</div>
    <div class="table-title">
        <div class="row">
            <div class="col-sm-4">
                <h2>Edit User</h2>
            </div>
            <div class="col-sm-8">
            </div>
        </div>
    </div>

    <form action="<@ofbizUrl>UpdateUser</@ofbizUrl>" method="post">
    <input type="hidden" name="partyId" value="${partyId!}"/>
        <div class="col-md-9 my-3">
            <div class="form-group row required">
                <label for="fnamacc" class="col-sm-2 col-form-label">First Name <span class="mandatory">*</span></label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${person.firstName!}" name="firstname" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="lnameacc" class="col-sm-2 col-form-label">Last Name <span class="mandatory">*</span></label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${person.lastName!}" name="lastname" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="emailacc" class="col-sm-2 col-form-label ">E-mail</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" readonly value="${email}" name="email" required >
                </div>
            </div>
            <div class="form-group row">
                <label for="roleacc" class="col-sm-2 col-form-label">Role</label>
                <div class="col-sm-10">
                    <select name="securityGroupId" class="form-control" required>
                        <option value="AP_PLANNER">Planner</option>
                        <option value="AP_APPROVER">Approver</option>
                        <option value="AP_DEPLOYER">Deployer</option>
                        <option value="AP_FULLADMIN">Administrator</option>
                    </select>

                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2">&nbsp;</div>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </div>
</div>
</form>
