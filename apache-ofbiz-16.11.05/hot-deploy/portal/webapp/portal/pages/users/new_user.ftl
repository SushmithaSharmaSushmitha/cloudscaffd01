<div class="container-fluid">
    <div>&nbsp;</div>
    <div class="table-title">
        <div class="row">
            <div class="col-sm-5">
                <h2>New User</h2>
            </div>
            <div class="col-sm-7">
                <a href="<@ofbizUrl>manage_users</@ofbizUrl>" class="btn btn-primary"><i class="material-icons">keyboard_backspace</i> <span>Back</span></a>
                <#--<a href="#" class="btn btn-primary"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a>-->
            </div>
        </div>
    </div>

    <div class="col-md-8 my-4">
        <form action="<@ofbizUrl>CreateUser</@ofbizUrl>" method="post">
            <div class="form-group row required">
                <label for="userFirstName" class="col-sm-2 col-form-label">First Name</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" id="userFirstName" name="firstname" placeholder="Tony" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="userLastName" class="col-sm-2 col-form-label">Last Name</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" id="userLastName" name="lastname" placeholder="Stark" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="userEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                <input type="email" class="form-control" id="userEmail" name="email" placeholder="tony@company.com" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="userPassword" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                <input type="password" class="form-control" id="userPassword" name="password" placeholder="Initial Password" required>
                <small id="passwordHelpBlock" class="form-text text-muted">
                User will be prompted to change password when they login for the first time.
                </small>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-2">Role</div>
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
                    <button type="submit" class="btn btn-primary">Add User</button>
                    <a href="<@ofbizUrl>manage_users</@ofbizUrl>" class="btn btn-secondary">Cancel</a>
                </div>
            </div>
        </form>
    </div>
</div>