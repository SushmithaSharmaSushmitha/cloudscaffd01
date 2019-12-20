<div id="page-content-wrapper">

    <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle"><i class="material-icons">menu</i></button>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <#if orgParty??>
            <div class="pl-3">
                <b>${Static["org.apache.ofbiz.party.party.PartyHelper"].getPartyName(orgParty)}</b>
                <span class="small text-muted">(${tenantId!})</span>
            </div>
        </#if>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <#--  <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>  -->
            <#--  <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>  -->

                <#if userLogin??>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="material-icons">account_circle</i>
                    ${Static["org.apache.ofbiz.party.party.PartyHelper"].getPartyName(loggedInParty)}
                    <#--  <span class="sr-only">(current)</span>  -->
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item disabled">
                        <i class="material-icons">beenhere</i> <i>${userRoleName!}</i>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<@ofbizUrl>myaccount</@ofbizUrl>"><i class="material-icons">perm_identity</i> My Account</a>
                    <a class="dropdown-item" href="<@ofbizUrl>changePassword</@ofbizUrl>"><i class="material-icons">security</i> Change Password</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<@ofbizUrl>logout</@ofbizUrl>"><i class="material-icons">exit_to_app</i> Logout</a>
                </div>
            </li>
            <#else>
                <li class="nav-item">
                    <a class="nav-link" href="<@ofbizUrl>login</@ofbizUrl>">Sign in</a>
                </li>
            </#if>
            </ul>
        </div>
    </nav>


<#if requestAttributes.errorMessageList?has_content><#assign errorMessageList=requestAttributes.errorMessageList></#if>
<#if requestAttributes.eventMessageList?has_content><#assign eventMessageList=requestAttributes.eventMessageList></#if>
<#if requestAttributes.serviceValidationException??><#assign serviceValidationException = requestAttributes.serviceValidationException></#if>
<#if requestAttributes.uiLabelMap?has_content><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>

<#if !errorMessage?has_content>
    <#assign errorMessage = requestAttributes._ERROR_MESSAGE_!>
</#if>
<#if !errorMessageList?has_content>
    <#assign errorMessageList = requestAttributes._ERROR_MESSAGE_LIST_!>
</#if>
<#if !eventMessage?has_content>
    <#assign eventMessage = requestAttributes._EVENT_MESSAGE_!>
</#if>
<#if !eventMessageList?has_content>
    <#assign eventMessageList = requestAttributes._EVENT_MESSAGE_LIST_!>
</#if>
