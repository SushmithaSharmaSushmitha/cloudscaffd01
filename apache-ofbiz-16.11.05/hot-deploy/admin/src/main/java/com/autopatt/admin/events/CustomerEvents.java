package com.autopatt.admin.events;

import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.GenericServiceException;
import org.apache.ofbiz.service.LocalDispatcher;
import org.apache.ofbiz.service.ServiceUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class CustomerEvents {
    public final static String module = CustomerEvents.class.getName();
    public static final String SUCCESS = "success";
    public static final String ERROR = "error";

    public static String createCustomer(HttpServletRequest request, HttpServletResponse response) {
        Delegator delegator = (Delegator) request.getAttribute("delegator");
        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        HttpSession session = request.getSession();
        GenericValue userLogin = (GenericValue) session.getAttribute("userLogin");

        Debug.log("Initiating the process to onboard new customer", module);

        String tenantId = request.getParameter("tenantId");
        String organizationName = request.getParameter("organizationName");
        String contactFirstName = request.getParameter("contactFirstName");
        String contactLastName = request.getParameter("contactLastName");
        String contactEmail = request.getParameter("contactEmail");
        String contactPassword = request.getParameter("contactPassword");
        String sendNotificationToContact = request.getParameter("sendNotificationToContact");
        if(UtilValidate.isEmpty(sendNotificationToContact)) sendNotificationToContact = "N";

        Map<String, Object> onboardCustomerResp = null;
        try {
            //Async call - use status on Org Party to know the result
            dispatcher.runAsync("onboardNewCustomer", UtilMisc.<String, Object> toMap("tenantId", tenantId,
                    "organizationName", organizationName,
                    "contactFirstName",contactFirstName,
                    "contactLastName",contactLastName,
                    "contactEmail",contactEmail,
                    "contactPassword",contactPassword,
                    "sendNotificationToContact",sendNotificationToContact,
                    "userLogin", userLogin));

            /*if(!ServiceUtil.isSuccess(onboardCustomerResp)) {
                Debug.logError("Error onboarding new customer with organization Id: " + tenantId, module);
                request.setAttribute("_ERROR_MESSAGE_", "Error onboarding new customer. ");
                return ERROR;
            }*/

        } catch (GenericServiceException e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public static String associateSubscriptionToTenant(HttpServletRequest request, HttpServletResponse response) {

        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        HttpSession session = request.getSession();
        GenericValue userLogin = (GenericValue) session.getAttribute("userLogin");
        String tenantId = request.getParameter("tenantId");
        String productId = request.getParameter("productId");

        Debug.log("Received request to assign product " + productId + " subscription to tenant " + tenantId, module);
        Map<String, Object> resp = null;
        try {
            resp = dispatcher.runSync("assignSubscriptionToTenant", UtilMisc.<String, Object>toMap("tenantId", tenantId,
                    "productId", productId,
                    "userLogin", userLogin));

            if (!ServiceUtil.isSuccess(resp)) {
                Debug.logError("Error assigning product " + productId + " subscription to tenant " + tenantId, module);
                request.setAttribute("_ERROR_MESSAGE_", "Error subscribing tenant. ");
                return ERROR;
            }
        } catch (GenericServiceException e) {
            Debug.logError(e, module);
            request.setAttribute("_ERROR_MESSAGE_", "Error subscribing tenant. ");
            return ERROR;
        }
        return SUCCESS;
    }


}
